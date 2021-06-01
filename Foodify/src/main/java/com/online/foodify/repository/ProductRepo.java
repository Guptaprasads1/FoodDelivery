package com.online.foodify.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.online.foodify.model.Product;

public interface ProductRepo extends JpaRepository<Product, Long>{
	List<Product> findAllByCategory_Id(int Id);
}
