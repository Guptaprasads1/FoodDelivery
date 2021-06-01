package com.online.foodify.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.online.foodify.dto.ProductDto;
import com.online.foodify.model.Category;
import com.online.foodify.model.Product;
import com.online.foodify.service.CategoryService;
import com.online.foodify.service.ProductService;

@Controller
public class AdminController {
	public static String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/productimages";
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;

	@GetMapping("/admin")
	public String ownerHome() {
		return "adminHome";
	}

	@GetMapping("/admin/categories")
	public String getCategories(Model model) {
		model.addAttribute("categories", categoryService.getAllCategory());
		return "categories";
	}

	@GetMapping("/admin/categories/add")
	public String getaddCategories(Model model) {
		model.addAttribute("category", new Category());
		return "categoriesAdd";
	}

	@PostMapping("/admin/categories/add")
	public String postaddCategories(@ModelAttribute("category") Category category) {
		categoryService.addCategory(category);
		return "redirect:/admin/categories";
	}

	@GetMapping("/admin/categories/delete/{id}")
	public String deleteCategory(@PathVariable int id) {
		categoryService.removeCategorybyId(id);
		return "redirect:/admin/categories";
	}

	@GetMapping("/admin/categories/update/{id}")
	public String updateCategoryById(@PathVariable int id, Model model) {
		Optional<Category> category = categoryService.updateCategoryById(id);
		if (category.isPresent()) {
			model.addAttribute("category", category.get());
			return "categoriesAdd";
		} else {
			return "404";
		}
	}

	// product section
	@GetMapping("/admin/products")
	public String foodProducts(Model model) {
		model.addAttribute("products", productService.getAllFoodProduct());
		return "products";
	}

	@GetMapping("/admin/products/add")
	public String getAddFood(Model model) {
		model.addAttribute("productDTO", new ProductDto());
		model.addAttribute("categories", categoryService.getAllCategory());
		return "productsAdd";
	}

	@PostMapping("/admin/products/add")
	public String postAddFood(@ModelAttribute("productDTO") ProductDto foodProductDto,
			@RequestParam("productImage") MultipartFile file, @RequestParam("imgName") String imgName)
			throws IOException {
		Product foodProduct = new Product();
		foodProduct.setId(foodProductDto.getId());
		foodProduct.setName(foodProductDto.getName());
		foodProduct.setCategory(categoryService.updateCategoryById(foodProductDto.getCategoryId()).get());
		foodProduct.setPrice(foodProductDto.getPrice());
		foodProduct.setDescription(foodProductDto.getDescription());
		String imageUUID;
		if (!file.isEmpty()) {
			imageUUID = file.getOriginalFilename();
			Path fileNameAndPath = Paths.get(uploadDir, imageUUID);// File Path and Name
			Files.write(fileNameAndPath, file.getBytes());// Actual file
		} else {
			imageUUID = imgName;
		}
		foodProduct.setImageName(imageUUID);
		productService.addFoodProduct(foodProduct);
		return "redirect:/admin/products";
	}

	@GetMapping("/admin/product/delete/{id}")
	public String deleteFood(@PathVariable long id) {
		productService.removeFoodbyId(id);
		return "redirect:/admin/products";
	}
	
	@GetMapping("/admin/product/update/{id}")
	public String updateFoodById(@PathVariable long id,Model model) {
		Product foodProduct = productService.getFoodById(id).get();
		
		ProductDto productDTO= new ProductDto();
		productDTO.setId(foodProduct.getId());
		productDTO.setName(foodProduct.getName());
		productDTO.setCategoryId(foodProduct.getCategory().getId());
		productDTO.setPrice(foodProduct.getPrice());
		productDTO.setDescription(foodProduct.getDescription());
		productDTO.setImageName(foodProduct.getImageName());
		
		model.addAttribute("categories", categoryService.getAllCategory());
		model.addAttribute("productDTO", productDTO);
		return "productsAdd";
	}

}
