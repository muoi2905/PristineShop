package com.devpro.shop16.repository;

import com.devpro.shop16.entities.Blog;
import com.devpro.shop16.entities.SaleorderProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
	
}
