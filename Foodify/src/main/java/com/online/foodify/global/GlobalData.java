package com.online.foodify.global;

import java.util.*;

import com.online.foodify.model.Product;

public class GlobalData {
	public static List<Product>  cart;
	static {
		cart = new ArrayList<Product>();
	}
}
