package vanvu.laptop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vanvu.laptop.repository.CartDetailRepository;
import vanvu.laptop.repository.CartRepository;
import vanvu.laptop.repository.ProductRepository;
import vanvu.laptop.domain.Product;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;    
    
    public ProductService(
        ProductRepository productRepository,
        CartRepository cartRepository,
        CartDetailRepository cartDetailRepository
    ) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }
    public Product handleSaveProduct( Product product){
        return this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepository.getProductById(id); 
    }

    public void handleDeleteProduct(Product product) {
        this.productRepository.delete(product);
    }

    public void handleAddProductToCart(){

    }
}
