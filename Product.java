/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER NITRO 5
 */
public class Product {
    private int id;
	private String name;
	private String category;
	private Double price;
	private String image;
        private int total;
	
	
	public Product() {
	}

    public Product(String name, String category, Double price, String image, int total) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
        this.total = total;
    }




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
				+ image + "]";
	}
	
}
