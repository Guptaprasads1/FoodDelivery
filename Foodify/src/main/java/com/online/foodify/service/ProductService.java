package com.online.foodify.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.online.foodify.model.Product;
import com.online.foodify.repository.ProductRepo;
@Service
public class ProductService {
	@Autowired 
	ProductRepo foodProductRepo; 
	
	public List<Product> getAllFoodProduct(){
		return foodProductRepo.findAll();
	}
	public void addFoodProduct(Product foodProduct) {
		foodProductRepo.save(foodProduct);
	}
	public void removeFoodbyId(long id) {
		foodProductRepo.deleteById(id);
	}
	public Optional<Product> getFoodById(long id){
		return foodProductRepo.findById(id);
	}
	public Optional<Product> updateFoodById(long id) {
		return foodProductRepo.findById(id);
	}
	public List<Product> getAllFoodByCategoryId(int id){
		return foodProductRepo.findAllByCategory_Id(id);
	}
}
