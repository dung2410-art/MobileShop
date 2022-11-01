/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    private static PreparedStatement pstmt = null;
    private static Connection conn = null;
    private static Statement statement = null;
    private static ResultSet resultSet = null;
    private static DBConnection db;

    public CategoryDAO() {
        try {
            //lay connection ra 
            db = new DBConnection();
            conn = db.getConnection();
            System.out.println("ok");
        } catch (Exception e) {
            System.out.println("Loi : " + e);
        }
    }

    public static ArrayList<Category> getCategories() {
        ArrayList<Category> categoryList = new ArrayList<Category>();
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[Category]";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                Category Category = new Category();
                Category.setCid(Integer.parseInt(resultSet.getString("cid")));
                Category.setCname(resultSet.getString("cname"));
                categoryList.add(Category);
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

        return categoryList;
    }

    public static Category getCategoryById(int id) {
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[Category] WHERE cid=" + id + "";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            resultSet.next();

            Category newCategory = new Category();
            newCategory.setCid(Integer.parseInt(resultSet.getString("cid")));
            newCategory.setCname(resultSet.getString("cname"));
            return newCategory;

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

    public int insert(Category cate) {
        String sql = "INSERT INTO [dbo].[Category] ([cname])\n"
                + "     VALUES\n"
                + "           (?)";
        int status = 0;
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cate.getCname());
            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public void updateCategoryByID(Category cate) {

        String sql = "UPDATE [PRJ301].[dbo].[Category] SET [cname] = ? WHERE cid =?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cate.getCname());
            pstmt.setInt(2, cate.getCid());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Category]\n"
                + "      WHERE cid =?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CategoryDAO testDAO = new CategoryDAO();
        ArrayList<Category> list = testDAO.getCategories();
        for (Category category : list) {
            System.out.println("category: ()" + category.getCname() + category.getCid());
        }
    }
}
