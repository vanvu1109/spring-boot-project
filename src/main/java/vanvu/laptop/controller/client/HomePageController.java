package vanvu.laptop.controller.client;

import java.util.List;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vanvu.laptop.domain.Product;
import vanvu.laptop.domain.User;
import vanvu.laptop.domain.dto.RegisterDTO;
import vanvu.laptop.service.ProductService;
import vanvu.laptop.service.UserService;

@Controller
public class HomePageController {

    private ProductService productService;
    private UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(
        ProductService productService,
        UserService userService,
        PasswordEncoder passwordEncoder
    ) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> arrayProducts = this.productService.getAllProducts();
        model.addAttribute("arrayProducts", arrayProducts);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(
        @ModelAttribute("registerUser") @Valid RegisterDTO registerUser, BindingResult bindingResult) {

        // List<FieldError> errors = bindingResult.getFieldErrors();
        // for(FieldError error : errors) {
        //   System.out.println(">>>>" + error.getField() + ": " + error.getDefaultMessage());
        // }

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOUser(registerUser); 
        String hashedPassWord = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassWord);
        user.setRole(this.userService.getRoleByName("USER"));

        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        model.addAttribute("loginUser", new RegisterDTO());
        return "client/auth/login";
    }

    @PostMapping("/login")
    public String handleLogin(Model model, @ModelAttribute("loginUser") RegisterDTO loginUser) {
        model.addAttribute("loginUser", loginUser);
        return "redirect:/client/homepage/show";
    }

    @GetMapping("/acess-denied")
    public String getAccessDenied(Model model) {

        return "client/auth/denied";
    }
}