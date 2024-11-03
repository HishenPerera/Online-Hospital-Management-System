package com.AdminContent.Recep.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.AdminContent.Recep.Model.Recep;
import com.DBConnection.DBConnection;

public class RecepDBUtil {
	
	private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }

    // Insert Recep
    public static boolean insertRecep(Recep recep) {
        String sql = "INSERT INTO receptionist (name, phone, username, password) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, recep.getName());
            preparedStatement.setString(2, recep.getPhone());
            preparedStatement.setString(3, recep.getUsername());
            preparedStatement.setString(4, recep.getPassword());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error inserting receptionist: " + e.getMessage());
            return false;
        }
    }

    // View All Nurse
    public static List<Recep> viewAllReceps() {
        List<Recep> receps = new ArrayList<>();
        String sql = "SELECT * FROM receptionist";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	Recep recep = new Recep(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("phone"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            	
            	receps.add(recep);
            }
            
            return receps;
            
        } catch (SQLException e) {
            System.out.println("Error viewing all receptionist: " + e.getMessage());
            return null;
        }
    }

    // Select Specific Recep
    public static Recep selectSpecificRecep(int id) {
        String sql = "SELECT * FROM receptionist WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Recep(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("phone"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Error selecting specific receptionist: " + e.getMessage());
            return null;
        }
    }

    // Delete Recep
    public static boolean deleteRecep(int id) {
        String sql = "DELETE FROM receptionist WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting receptionist: " + e.getMessage());
            return false;
        }
    }

    // Update Recep
    public static boolean updateRecep(Recep recep) {
        String sql = "UPDATE receptionist SET name = ?, phone = ?, username = ?, password = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, recep.getName());
            preparedStatement.setString(2, recep.getPhone());
            preparedStatement.setString(3, recep.getUsername());
            preparedStatement.setString(4, recep.getPassword());
            preparedStatement.setInt(5, recep.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating receptionist: " + e.getMessage());
            return false;
        }
        
    }   
	
}
