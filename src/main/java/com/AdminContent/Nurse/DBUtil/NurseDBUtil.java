package com.AdminContent.Nurse.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.AdminContent.Nurse.Model.Nurse;
import com.DBConnection.DBConnection;

public class NurseDBUtil {
	
	private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }

    // Insert Nurse
    public static boolean insertNurse(Nurse nurse) {
        String sql = "INSERT INTO nurse (name, phone, username, password) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, nurse.getName());
            preparedStatement.setString(2, nurse.getPhone());
            preparedStatement.setString(3, nurse.getUsername());
            preparedStatement.setString(4, nurse.getPassword());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error inserting nurses: " + e.getMessage());
            return false;
        }
    }

    // View All Nurse
    public static List<Nurse> viewAllNurses() {
        List<Nurse> nurses = new ArrayList<>();
        String sql = "SELECT * FROM nurse";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	Nurse nurse = new Nurse(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("phone"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            	
            	nurses.add(nurse);
            }
            
            return nurses;
            
        } catch (SQLException e) {
            System.out.println("Error viewing all nurse: " + e.getMessage());
            return null;
        }
    }

    // Select Specific Nurse
    public static Nurse selectSpecificNurse(int id) {
        String sql = "SELECT * FROM nurse WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Nurse(
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
            System.out.println("Error selecting specific nurse: " + e.getMessage());
            return null;
        }
    }

    // Delete Nurse
    public static boolean deleteNurse(int id) {
        String sql = "DELETE FROM nurse WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting nurse: " + e.getMessage());
            return false;
        }
    }

    // Update Nurse
    public static boolean updateNurse(Nurse nurse) {
        String sql = "UPDATE nurse SET name = ?, phone = ?, username = ?, password = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, nurse.getName());
            preparedStatement.setString(2, nurse.getPhone());
            preparedStatement.setString(3, nurse.getUsername());
            preparedStatement.setString(4, nurse.getPassword());
            preparedStatement.setInt(5, nurse.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating nurse: " + e.getMessage());
            return false;
        }
        
    }   

}
