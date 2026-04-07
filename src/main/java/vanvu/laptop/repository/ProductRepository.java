package vanvu.laptop.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import vanvu.laptop.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Product getProductById(long id);
}
