package vanvu.laptop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vanvu.laptop.service.UserService;
import vanvu.laptop.domain.User;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("bo", test);
        model.addAttribute("bohocit", "bohocit");
        return "hello";
    }

    @RequestMapping(value = "/admin/user")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user) {
        System.out.println("user: " + user);
        return "hello";
    }

}
