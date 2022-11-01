/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Product {

    public Product(int id, String name, String model, int price, String brand, String description, int quantity, String size) {
        this.id = id;
        this.name = name;
        this.model = model;
        this.price = price;
        this.brand = brand;
        this.description = description;
        this.quantity = quantity;
        this.size = size;
    }
    
     public Product( String name, String model, int price, String brand, String description, int quantity, String size) {
        this.name = name;
        this.model = model;
        this.price = price;
        this.brand = brand;
        this.description = description;
        this.quantity = quantity;
        this.size = size;
    }
    
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private String name;
    private String model;
    private int price;
    private String image;
    private String brand;
    private String description;
    private int quantity;
    private String size;


    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
   
    public Product() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
