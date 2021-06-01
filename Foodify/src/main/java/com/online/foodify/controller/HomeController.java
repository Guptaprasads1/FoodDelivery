package com.online.foodify.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.online.foodify.global.GlobalData;
import com.online.foodify.service.CategoryService;
import com.online.foodify.service.ProductService;

@Controller
public class HomeController {
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService foodProductService;
	
	@GetMapping({"/", "/home"})
	public String home(Model model) {
		model.addAttribute("cartCount",GlobalData.cart.size());
		return "index";
	}
	
	/*
	 * @GetMapping("/foods") public String foods(Model model) {
	 * model.addAttribute("categories",categoryService.getAllCategory());
	 * model.addAttribute("foodProducts",foodProductService.getAllFoodProduct());
	 * return "foods"; }
	 */
	
	@GetMapping("/shop")
	public String shop(Model model) {
		model.addAttribute("categories", categoryService.getAllCategory());
		model.addAttribute("products", foodProductService.getAllFoodProduct());
		model.addAttribute("cartCount",GlobalData.cart.size());
		return "shop";
	}
	
	@GetMapping("/shop/category/{id}")
	public String shopByCategory(Model model, @PathVariable int id) {
		model.addAttribute("categories", categoryService.getAllCategory());
		model.addAttribute("cartCount",GlobalData.cart.size());
		model.addAttribute("products", foodProductService.getAllFoodByCategoryId(id));
		return "shop";
	}
	
	
	
	 @GetMapping("/shop/viewproduct/{id}") 
	 public String viewProduct(Model model, @PathVariable int id) {
		 model.addAttribute("categories", categoryService.getAllCategory());
		 model.addAttribute("product", foodProductService.getFoodById(id).get()); 
		 model.addAttribute("cartCount",GlobalData.cart.size());
		 return "viewProduct";
		}
	 
	 @GetMapping("/about")
	 public String about() {
		 return "about";
	 }
	 
}
