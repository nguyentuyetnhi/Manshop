/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author ACER NITRO 5
 */
public class ProductDao {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductDao(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts() {
        List<Product> book = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setTotal(rs.getInt("quantity"));

                book.add(row);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return book;
    }

    public List<Product> getProductsByName(String name){
        List<Product> searchProduct = new ArrayList<>();
        List<Product> products = getAllProducts();
        for (Product product : products) {
            if(product.getName().toLowerCase().contains(name.toLowerCase())){
                searchProduct.add(product);
            }
        }
        return searchProduct;
    }
    public Product getSingleProduct(int id) {
        Product row = null;
        try {
            query = "select * from products where id=? ";

            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setTotal(rs.getInt("quantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("price") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
    public void insertProduct(Product product){
        try {
            query = "insert into products (name, category, price, image, quantity) values(?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, product.getName());
            pst.setString(2, product.getCategory());
            pst.setDouble(3, product.getPrice());
            pst.setString(4, product.getImage());
            pst.setInt(5, product.getTotal());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateProduct(Product product){
        try {
            query = "Update products SET price=?, quantity=? WHERE id =?";
            pst = this.con.prepareStatement(query);
            pst.setDouble(1, product.getPrice());
            pst.setInt(2, product.getTotal());
            pst.setInt(3, product.getId());
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void deleteProduct(int id){
        try {
            query = "DELETE FROM products WHERE id=? ";
            pst = this.con.prepareStatement(query);           
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
