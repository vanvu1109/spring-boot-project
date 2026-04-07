package vanvu.laptop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vanvu.laptop.domain.Product;
import vanvu.laptop.service.UploadService;
import vanvu.laptop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
@Controller
public class ProductController {
    
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(
            ProductService productService,
            UploadService uploadService
        ){
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getDasboardPage(Model model) {
        List<Product> arrayProducts = this.productService.getAllProducts(); 
        model.addAttribute("arrayProducts", arrayProducts);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getProductCreatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }
    

    @PostMapping("/admin/product/create")
    public String createProduct(
        Model model, 
        @ModelAttribute("newProduct") @Valid Product product, 
        BindingResult newProductBindingResult,
        @RequestParam("file") MultipartFile file) {
        
            
        List<FieldError> errors =  newProductBindingResult.getFieldErrors();
        for(FieldError error : errors) {
          System.out.println(">>>>" + error.getField() + ": " + error.getDefaultMessage());
        }

        if(newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String images = this.uploadService.handleSaveUploadFile(file, "product");
        
        product.setImage(images);
        product.setName(product.getName());
        product.setDetailDesc(product.getDetailDesc());
        product.setPrice(product.getPrice());
        product.setQuantity(product.getQuantity());
        product.setShortDesc(product.getShortDesc());
        product.setFactory(product.getFactory());
        product.setTarget(product.getTarget());

        this.productService.handleSaveProduct(product);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getProductUpdatePage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping(value = "/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("newProduct") Product product) {
        Product currentProduct = this.productService.getProductById(product.getId());
        if (currentProduct != null) {
            currentProduct.setName(product.getName());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());
            this.productService.handleSaveProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping(value = "/admin/product/delete/{id}")
    public String getDeletePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        Product Product = new Product();
        Product.setId(id);
        model.addAttribute("newProduct", Product);
        return "admin/product/delete";
    }

    @PostMapping(value = "/admin/product/delete")
    public String deleteProduct(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.handleDeleteProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping(value = "/admin/product/view/{id}")
    public String getproductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }
}
