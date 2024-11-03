// IT23163218 M.H.S. Perera
package com.Admin.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Admin.Model.Admin;
import com.DBConnection.DBConnection;

public class AdminDBUtil {
    
    private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }

    // Insert Admin
    public static boolean insertAdmin(Admin admin) {
        String sql = "INSERT INTO admin (name, phone, email, username, password) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, admin.getName());
            preparedStatement.setString(2, admin.getPhone());
            preparedStatement.setString(3, admin.getEmail());
            preparedStatement.setString(4, admin.getUsername());
            preparedStatement.setString(5, admin.getPassword());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error inserting admins: " + e.getMessage());
            return false;
        }
    }

    // View All Admins
    public static List<Admin> viewAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        String sql = "SELECT * FROM admin";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Admin admin = new Admin(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("phone"),
                        resultSet.getString("email"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
                admins.add(admin);
            }
            
            return admins;
            
        } catch (SQLException e) {
            System.out.println("Error viewing all admins: " + e.getMessage());
            return null;
        }
    }

    // Select Specific Admin
    public static Admin selectSpecificAdmin(int id) {
        String sql = "SELECT * FROM admin WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Admin(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("phone"),
                        resultSet.getString("email"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Error selecting specific admin: " + e.getMessage());
            return null;
        }
    }

    // Delete Admin
    public static boolean deleteAdmin(int id) {
        String sql = "DELETE FROM admin WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting admin: " + e.getMessage());
            return false;
        }
    }

    // Update Admin
    public static boolean updateAdmin(Admin admin) {
        String sql = "UPDATE admin SET name = ?, phone = ?, email = ?, username = ?, password = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, admin.getName());
            preparedStatement.setString(2, admin.getPhone());
            preparedStatement.setString(3, admin.getEmail());
            preparedStatement.setString(4, admin.getUsername());
            preparedStatement.setString(5, admin.getPassword());
            preparedStatement.setInt(6, admin.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating admin: " + e.getMessage());
            return false;
        }
    }
}