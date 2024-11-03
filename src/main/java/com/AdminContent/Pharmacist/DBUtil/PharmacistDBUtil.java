// IT23163218 M.H.S. Perera

package com.AdminContent.Pharmacist.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DBConnection.DBConnection;
import com.AdminContent.Pharmacist.Model.Pharmacist;

public class PharmacistDBUtil {

	    private static Connection connection;

	    static {
	        connection = DBConnection.getConnection();
	    }

	    // Insert Pharmacist
	    public static boolean insertPharmacist(Pharmacist pharmacist) {
	        String sql = "INSERT INTO pharmacist (name, phone, username, password) VALUES (?, ?, ?, ?)";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            preparedStatement.setString(1, pharmacist.getName());
	            preparedStatement.setString(2, pharmacist.getPhone());
	            preparedStatement.setString(3, pharmacist.getUsername());
	            preparedStatement.setString(4, pharmacist.getPassword());
	            return preparedStatement.executeUpdate() > 0;
	        } catch (SQLException e) {
	            System.out.println("Error inserting pharmacists: " + e.getMessage());
	            return false;
	        }
	    }

	    // View All Pharmacists
	    public static List<Pharmacist> viewAllPharmacists() {
	        List<Pharmacist> pharmacists = new ArrayList<>();
	        String sql = "SELECT * FROM pharmacist";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	            	Pharmacist pharmacist = new Pharmacist(
	                        resultSet.getInt("id"),
	                        resultSet.getString("name"),
	                        resultSet.getString("phone"),
	                        resultSet.getString("username"),
	                        resultSet.getString("password")
	                );
	            	
	            	pharmacists.add(pharmacist);
	            }
	            
	            return pharmacists;
	            
	        } catch (SQLException e) {
	            System.out.println("Error viewing all pharmacists: " + e.getMessage());
	            return null;
	        }
	    }

	    // Select Specific Pharmacist
	    public static Pharmacist selectSpecificPharmacist(int id) {
	        String sql = "SELECT * FROM pharmacist WHERE id = ?";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            preparedStatement.setInt(1, id);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            if (resultSet.next()) {
	                return new Pharmacist(
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
	            System.out.println("Error selecting specific pharmacist: " + e.getMessage());
	            return null;
	        }
	    }

	    // Delete Pharmacist
	    public static boolean deletePharmacist(int id) {
	        String sql = "DELETE FROM pharmacist WHERE id = ?";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            preparedStatement.setInt(1, id);
	            return preparedStatement.executeUpdate() > 0;
	        } catch (SQLException e) {
	            System.out.println("Error deleting pharmacist: " + e.getMessage());
	            return false;
	        }
	    }

	    // Update Pharmacist
	    public static boolean updatePharmacist(Pharmacist pharmacist) {
	        String sql = "UPDATE pharmacist SET name = ?, phone = ?, username = ?, password = ? WHERE id = ?";
	        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	            preparedStatement.setString(1, pharmacist.getName());
	            preparedStatement.setString(2, pharmacist.getPhone());
	            preparedStatement.setString(3, pharmacist.getUsername());
	            preparedStatement.setString(4, pharmacist.getPassword());
	            preparedStatement.setInt(5, pharmacist.getId());
	            return preparedStatement.executeUpdate() > 0;
	        } catch (SQLException e) {
	            System.out.println("Error updating pharmacist: " + e.getMessage());
	            return false;
	        }
	    }
}	

