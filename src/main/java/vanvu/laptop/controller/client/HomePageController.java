package vanvu.laptop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vanvu.laptop.domain.Product;
import vanvu.laptop.service.ProductService;

@Controller
public class HomePageController {

    private ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> arrayProducts = this.productService.getAllProducts();
        model.addAttribute("arrayProducts", arrayProducts);
        return "client/homepage/show";
    }

}