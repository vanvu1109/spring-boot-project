package vanvu.laptop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DasboardController {

    @GetMapping("/admin")
    public String getDasboardPage() {

        return "admin/dashboard/show";
    }
}
