/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnection;
import models.Product;
import connect.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    private static PreparedStatement pstmt = null;
    private static Connection conn = null;
    private static Statement statement = null;
    private static ResultSet resultSet = null;
    private static DBConnection db;

    public ProductDAO() {
        try {
            //lay connection ra 
            db = new DBConnection();
            conn = db.getConnection();
            System.out.println("ok");
        } catch (Exception e) {
            System.out.println("Loi : " + e);
        }
    }

    public int insert(Product p) {
        String sql = "INSERT INTO [dbo].[Product] ([name], [price], [quantity], [description], [brand], [size], [model])\n" +
"     VALUES\n" +
"           (?,?,?,?,?,?,?)";
        int status = 0 ;
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, p.getName());
            pstmt.setInt(2, p.getPrice());
            pstmt.setInt(3, p.getQuantity());
            pstmt.setString(4, p.getDescription());
            pstmt.setString(5, p.getBrand());
            pstmt.setString(6, p.getSize());
            pstmt.setString(7, p.getModel());
            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static ArrayList<Product> getProducts() {
        ArrayList<Product> productsList = new ArrayList<Product>();
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[Product]";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                Product newProduct = new Product();
                newProduct.setDescription(resultSet.getString("description"));
                newProduct.setName(resultSet.getString("name"));
                newProduct.setBrand(resultSet.getString("brand"));
                newProduct.setModel(resultSet.getString("model"));
                newProduct.setSize(resultSet.getString("size"));
                newProduct.setId(Integer.parseInt(resultSet.getString("id")));
                newProduct.setPrice(Integer.parseInt(resultSet.getString("price")));
                newProduct.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                productsList.add(newProduct);
                //System.out.println(newProduct.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return productsList;
    }

    public static ArrayList<Product> getProductById(String id) {
        ArrayList<Product> productsList = new ArrayList<Product>();
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[Product] WHERE id=" + id + "";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                Product newProduct = new Product();
                newProduct.setDescription(resultSet.getString("description"));
                newProduct.setName(resultSet.getString("name"));
                newProduct.setBrand(resultSet.getString("brand"));
                newProduct.setModel(resultSet.getString("model"));
                newProduct.setSize(resultSet.getString("size"));
                newProduct.setId(Integer.parseInt(resultSet.getString("id")));
                newProduct.setPrice(Integer.parseInt(resultSet.getString("price")));
                newProduct.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                productsList.add(newProduct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productsList;
    }

    public static ArrayList<Product> getProductByBrand(String brand) {
        ArrayList<Product> productsList = new ArrayList<Product>();
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[Product] WHERE lower(brand)='" + brand.toLowerCase() + "'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                Product newProduct = new Product();
                newProduct.setDescription(resultSet.getString("description"));
                newProduct.setName(resultSet.getString("name"));
                newProduct.setBrand(resultSet.getString("brand"));
                newProduct.setModel(resultSet.getString("model"));
                newProduct.setSize(resultSet.getString("size"));
                newProduct.setId(Integer.parseInt(resultSet.getString("id")));
                newProduct.setPrice(Integer.parseInt(resultSet.getString("price")));
                newProduct.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                productsList.add(newProduct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productsList;
    }

    public static ArrayList<Product> getProductByWildCard(String term) {
        ArrayList<Product> productsList = new ArrayList<Product>();
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[Product] "
                    + "WHERE lower(brand) LIKE '%" + term.toLowerCase() + "%' "
                    + "OR lower(description) LIKE '%" + term.toLowerCase() + "%' "
                    + "OR lower(model) LIKE '%" + term.toLowerCase() + "%' "
                    + "OR lower(price) LIKE '%" + term.toLowerCase() + "%' "
                    + "OR lower(name) LIKE '%" + term.toLowerCase() + "%' "
                    + "";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                Product newProduct = new Product();
                newProduct.setDescription(resultSet.getString("description"));
                newProduct.setName(resultSet.getString("name"));
                newProduct.setBrand(resultSet.getString("brand"));
                newProduct.setModel(resultSet.getString("model"));
                newProduct.setSize(resultSet.getString("size"));
                newProduct.setId(Integer.parseInt(resultSet.getString("id")));
                newProduct.setPrice(Integer.parseInt(resultSet.getString("price")));
                newProduct.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                productsList.add(newProduct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productsList;
    }

    public static Product getProductByID(int id) {

        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[Product] WHERE id='" + id + "'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            resultSet.next();
            if (resultSet.getString("name") != null) {
                Product newProduct = new Product();
                newProduct.setDescription(resultSet.getString("description"));
                newProduct.setName(resultSet.getString("name"));
                newProduct.setBrand(resultSet.getString("brand"));
                newProduct.setModel(resultSet.getString("model"));
                newProduct.setSize(resultSet.getString("size"));
                newProduct.setId(Integer.parseInt(resultSet.getString("id")));
                newProduct.setPrice(Integer.parseInt(resultSet.getString("price")));
                newProduct.setQuantity(Integer.parseInt(resultSet.getString("quantity")));
                return newProduct;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void updateProductByID(Product prd) {

        String sql = "UPDATE [PRJ301].[dbo].[Product] SET [name] = ?,"
                + "[price] = ?,"
                + "[size] = ?,"
                + "[quantity] = ?,"
                + "[description] = ?,"
                + "[model] = ?,"
                + "[brand] = ? WHERE id =?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, prd.getName());
            pstmt.setInt(2, prd.getPrice());
            pstmt.setString(3, prd.getSize());
            pstmt.setInt(4, prd.getQuantity());
            pstmt.setString(5, prd.getDescription());
            pstmt.setString(6, prd.getModel());
            pstmt.setString(7, prd.getBrand());
            pstmt.setInt(8, prd.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE id=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ProductDAO testDAO = new ProductDAO();
        Product test = new Product("test","hp", 23, "hp", "test", 123123, "XL");
        int status = testDAO.insert(test);
        System.out.println(status);

    }
}
