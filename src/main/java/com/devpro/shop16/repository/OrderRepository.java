package com.devpro.shop16.repository;

import com.devpro.shop16.entities.Saleorder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Saleorder, Integer> {
    @Query("select s from Saleorder as s where s.customer_email = :customerEmail")
    List<Saleorder> findByEmailOrder(@Param("customerEmail") String customerEmail);
    
    @Query("select count(*) from Saleorder as s where s.orderStatus != 3")
    long countOrder();

    @Query(nativeQuery = true, value = "select sum(p.price * sop.quality) as total_sale_price from tbl_saleorder so inner join tbl_saleorder_products sop on so.id = sop.saleorder_id INNER JOIN tbl_products p ON sop.product_id = p.id where so.order_status = 2")
	long calculateTotalSalePrices();

    @Query(nativeQuery = true, value = "select * from tbl_saleorder ORDER BY created_date DESC LIMIT 5")
	List<Saleorder> getRecentOrders();
    
}
