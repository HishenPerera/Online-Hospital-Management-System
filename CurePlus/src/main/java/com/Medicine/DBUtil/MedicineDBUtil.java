package com.Medicine.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import com.DBConnection.DBConnection;
import com.Medicine.Model.Medicine;

public class MedicineDBUtil {
	
	private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }
    
    //Insert Medicine
    public static boolean insertMedicine(Medicine med) {
    	String sql = "INSERT INTO medicines (name, description, qty, price) VALUES (?, ?, ?, ?)";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, med.getName());
            preparedStatement.setString(2, med.getDescription());
            preparedStatement.setString(3, med.getQty());
            preparedStatement.setString(4, med.getPrice());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error adding medicine: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
    
    public static Medicine getMedicineById(int id) {
        String sql = "SELECT * FROM medicines WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Medicine(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("description"),
                            resultSet.getString("qty"),
                            resultSet.getString("price")
                    );
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting medicine by id: " + e.getMessage());
            // Log the error or take alternative action
            return null;
        }
    }
    
 // Get All Medicine
    public static List<Medicine> getAllMedicine() {
    	List<Medicine> medicines = new ArrayList<>();
    	String sql = "SELECT * FROM medicines";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
    		 ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
            	Medicine medicine = new Medicine(
            			resultSet.getInt("id"),
            			resultSet.getString("name"),
            			resultSet.getString("description"),
            			resultSet.getString("qty"),
            			resultSet.getString("price")
            	);
            	medicines.add(medicine);
            }
            return medicines;
        } catch (SQLException e) {
            System.out.println("Error getting attendance: " + e.getMessage());
            // Log the error or take alternative action
            return medicines;
        }
    }
    
    //Update Medicine
    public static boolean updateMedicine(Medicine med) {
    	String sql = "UPDATE medicines SET name = ?, description = ?, qty = ?, price = ? WHERE id = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, med.getName());
            preparedStatement.setString(2, med.getDescription());
            preparedStatement.setString(3, med.getQty());
            preparedStatement.setString(4, med.getPrice());
            preparedStatement.setInt(5, med.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating medicine: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
    
    //Delete Medicine
    public static boolean deleteMedicine(int id) {
    	String sql = "DELETE FROM medicines WHERE id = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting medicine: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
}