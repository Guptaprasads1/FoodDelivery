package com.online.foodify.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.online.foodify.global.GlobalData;
import com.online.foodify.model.Role;
import com.online.foodify.model.User;
import com.online.foodify.model.UserData;
import com.online.foodify.repository.RoleRepo;
import com.online.foodify.repository.UserRepo;

@Controller
public class LoginController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	UserRepo userRepo;
	@Autowired
	RoleRepo roleRepo;
	@GetMapping("/login")
	public String getlogin() {
		return "login";
	}
//	@PostMapping("/login")
//	public String login(@ModelAttribute("userData") UserData userData,HttpServletRequest request) throws ServletException {
//		/* GlobalData.cart.clear(); */
//		if(use)
//		System.out.println(userData.getEmail()+" "+ userData.getPassword());
//		
//		return "redirect:";
//	}
	@GetMapping("/register")
	public String getRegister() {
		return "register";
	}
	@PostMapping("/register")
	public String postRegister(@ModelAttribute("user") User user,HttpServletRequest request) throws ServletException {
		String password=user.getPassword();
		user.setPassword(bCryptPasswordEncoder.encode(password));
		List<Role> roles= new ArrayList<Role>();
		roles.add(roleRepo.findById(2).get());
		user.setRoles(roles);
		userRepo.save(user);
		request.login(user.getEmail(), password);
		
		System.out.println("Abcddjkgwkwgdliiualoi;aue;fuaoefyaeyf;oaiue");
		return "redirect:/";
	}
}
