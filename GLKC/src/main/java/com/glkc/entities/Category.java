package com.glkc.entities;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
  
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(length= 10,name = "c_id")
	private int categoryId;
	@Column(length= 100,name = "c_title")
    private String categoryTitle;
	@Column(length= 300,name = "c_description")
    private String categoryDescription;
	@OneToMany(mappedBy = "category")
	private List<Product> products=new ArrayList<Product>();
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int categoryId, String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}
	public Category(String categoryTitle, String categoryDescription) {
		
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
        
	}
	public Category( String categoryTitle, String categoryDescription, List<Product> products) {
	
		
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}
	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription="
				+ categoryDescription + ", products=" + products + "]";
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
}
