package vanvu.laptop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

import jakarta.servlet.DispatcherType;
import vanvu.laptop.service.CustomUserDetailsService;
import vanvu.laptop.service.UserService;
@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }
    
    @Bean
    public DaoAuthenticationProvider authProvider(
        UserDetailsService userDetailsService,
        PasswordEncoder passwordEncoder
    ) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }

    @Bean
    public AuthenticationSuccessHandler myaAuthenticationSuccessHandler() {
        return new CustomSuccessHandle();
    }

    @Bean
    public SpringSessionRememberMeServices rememberMeServices() {
        SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
        rememberMeServices.setAlwaysRemember(true);
        return rememberMeServices;
    }
        

    @Bean 
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http 
            .authorizeHttpRequests(authorize-> authorize
                .dispatcherTypeMatchers(DispatcherType.FORWARD , DispatcherType.INCLUDE).permitAll()
                .requestMatchers("/", "/login","/product/**",
                 "/client/**", "/css/**", "/js/**", "/images/**").permitAll()    
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .requestMatchers("/user/**").hasRole("USER")
                .anyRequest().authenticated()
            )

            .sessionManagement((sessionmanagement) -> sessionmanagement
                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
                .invalidSessionUrl("/logout?expired")
                .maximumSessions(1)
                .maxSessionsPreventsLogin(false)
            )

            .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))
            
            .rememberMe(remember -> remember.rememberMeServices(rememberMeServices()))
            .formLogin(formlogin -> formlogin 
                .loginPage("/login")
                .usernameParameter("email") 
                .passwordParameter("password")
                .failureUrl("/login?error")
                .successHandler(myaAuthenticationSuccessHandler())
                .permitAll())

            .exceptionHandling(ex -> ex.accessDeniedPage("/acess-denied"));

        return http.build();
    }

}