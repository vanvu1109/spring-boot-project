package vanvu.laptop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vanvu.laptop.domain.Product;
import vanvu.laptop.service.ProductService;

import org.springframework.ui.Model;
@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/view/{id}")
    public String getItem(@PathVariable long id, Model model) {
        // model.addAttribute("product", this.productService.getProductById(id));
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }


    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id) {
        
        return "redirect:/";
    }

}