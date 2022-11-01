/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.Product;
import models.User;
import connect.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author Dung
 */
public class UserDAO {

    private static PreparedStatement pstmt = null;
    private static Connection conn = null;
    private static Statement statement = null;
    private static ResultSet resultSet = null;
    private static DBConnection db;

    public UserDAO() {
        try {
            //lay connection ra 
            db = new DBConnection();
            conn = db.getConnection();
            System.out.println("ok");
        } catch (Exception e) {
            System.out.println("Loi : " + e);
        }
    }

    public static User authenticate(String email, String password) {

        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[User] WHERE "
                    + "email='" + email + "' AND "
                    + "password='" + password + "' "
                    + "";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            resultSet.next();
            if (resultSet.getString("name") != null) {
                User newUser = new User(resultSet.getString("name"), resultSet.getInt("roleId"));
                return newUser;
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

    public static ArrayList<User> getUsers() {

        ArrayList<User> userlist = new ArrayList<User>();
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[User]";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                User newUser = new User();
                newUser.setId(Integer.parseInt(resultSet.getString("id")));
                newUser.setName(resultSet.getString("name"));
                newUser.setRole(Integer.parseInt(resultSet.getString("roleId")));
                newUser.setEmail(resultSet.getString("email"));
                newUser.setPhone(resultSet.getString("phone"));
                newUser.setAddress(resultSet.getString("address"));
                newUser.setPassword(resultSet.getString("password"));
                userlist.add(newUser);

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

        return userlist;
    }

    public static ArrayList<User> getUserById(String id) {
        ArrayList<User> userlist = new ArrayList<User>();
        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[User] WHERE id=" + id + "";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                User newUser = new User();
                newUser.setId(Integer.parseInt(resultSet.getString("id")));
                newUser.setName(resultSet.getString("name"));
                newUser.setRole(Integer.parseInt(resultSet.getString("roleId")));
                newUser.setEmail(resultSet.getString("email"));
                newUser.setPhone(resultSet.getString("phone"));
                newUser.setAddress(resultSet.getString("address"));
                newUser.setPassword(resultSet.getString("password"));
                userlist.add(newUser);
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
        return userlist;
    }

    public boolean register(User u) {

        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([id]\n"
                + "           ([name]\n"
                + "           ([roleId]\n"
                + "           ([phone]\n"
                + "           ([email]\n"
                + "           ([address]\n"
                + "           ([password]\n"
                + "            VALUES (?,?,?,?,?,?,?)";
        int status = 0;
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, u.getId());
            pstmt.setString(2, u.getName());
            pstmt.setInt(3, u.getRole());
            pstmt.setString(4, u.getPhone());
            pstmt.setString(5, u.getEmail());
            pstmt.setString(6, u.getAddress());
            pstmt.setString(7, u.getPassword());
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static User getUserById(int id) {

        try {
            String sql = "SELECT * FROM [PRJ301].[dbo].[User] WHERE id=" + id + "";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            resultSet = pstmt.executeQuery();
            resultSet.next();

            User newUser = new User();
            newUser.setId(Integer.parseInt(resultSet.getString("id")));
            newUser.setName(resultSet.getString("name"));
            newUser.setRole(Integer.parseInt(resultSet.getString("roleId")));
            newUser.setPhone(resultSet.getString("phone"));
            newUser.setEmail(resultSet.getString("email"));
            newUser.setAddress(resultSet.getString("address"));
            newUser.setPassword(resultSet.getString("password"));
            return newUser;

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

    public void updateUserByID(User user) {
        try {
            String sql = "UPDATE [PRJ301].[dbo].[User] SET [name] = ?,"
                    + "[roleId] = ?,"
                    + "[phone] = ?,"
                    + "[email] = ?,"
                    + "[address] = ?,"
                    + "[password] = ? WHERE id =?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getName());
            pstmt.setInt(2, user.getRole());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getPassword());
            pstmt.setInt(7, user.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(User user) throws SQLException {
        try {
            String sql = "INSERT INTO [Account]\n"
                    + "            ([email]\n"
                    + "           ,[password]\n"
                    + "     VALUES"
                    + "           ( ?\n"
                    + "           , ?\n";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPassword());
            pstmt.executeUpdate();
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

    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Account]\n"
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
        UserDAO test = new UserDAO();
        ArrayList<User> list = test.getUsers();
        for (User user : list) {
            System.out.println("user: ()" + user.getName());
        }

    }
}
