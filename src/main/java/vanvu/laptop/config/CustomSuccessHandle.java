package vanvu.laptop.config;


import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vanvu.laptop.domain.User;
import vanvu.laptop.service.UserService;

import org.springframework.security.web.WebAttributes;

public class CustomSuccessHandle implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;
    
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    public String determineTargetUrl(final Authentication authentication) {
        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");


        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        for (final GrantedAuthority authority : authorities) {
            String roleName = authority.getAuthority(); 

            if (roleTargetUrlMap.containsKey(roleName)) {
                return roleTargetUrlMap.get(roleName);
            }
        }

        throw new IllegalStateException("No mapping for '" + authentication + "' in " + roleTargetUrlMap);
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);

        if (session == null) {
            return;
        }

        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());

        }
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
                
                String targetUrl = determineTargetUrl(authentication);
                if (response.isCommitted()) {
                    return;
                }
                redirectStrategy.sendRedirect(request, response, targetUrl);
                clearAuthenticationAttributes(request, authentication);
    }
    
    
}
