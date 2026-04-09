package vanvu.laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vanvu.laptop.domain.CartDetails;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetails, Long> {

    
}