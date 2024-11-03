package com.Shift.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DBConnection.DBConnection;
import com.Shift.Model.Shift;

public class ShiftDBUtil {
	
	private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }
    
    //Insert Shift
    public static boolean insertShift(Shift sft) {
    	String sql = "INSERT INTO shift (details, date, shift) VALUES (?, ?, ?)";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, sft.getDetails());
            preparedStatement.setString(2, sft.getDate());
            preparedStatement.setString(3, sft.getShift());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error adding shift: " + e.getMessage());
            return false;
        }
    }
    
    //Get Shift by ID
    public static Shift getShiftById(int id) {
        String sql = "SELECT * FROM shift WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Shift(
                            resultSet.getInt("id"),
                            resultSet.getString("details"),
                            resultSet.getString("date"),
                            resultSet.getString("shift")
                    );
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error getting shift by id: " + e.getMessage());
            return null;
        }
    }
    
    //Get All Shifts
    public static List<Shift> getAllShifts() {
    	List<Shift> shifts = new ArrayList<>();
    	String sql = "SELECT * FROM shift";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
    		 ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
            	Shift shift = new Shift(
            			resultSet.getInt("id"),
            			resultSet.getString("details"),
            			resultSet.getString("date"),
            			resultSet.getString("shift")
            	);
            	shifts.add(shift);
            }
            return shifts;
        } catch (SQLException e) {
            System.out.println("Error getting all shifts: " + e.getMessage());
            return shifts;
        }
    }
    
    //Update Shift
    public static boolean updateShift(Shift sft) {
    	String sql = "UPDATE shift SET details = ?, date = ?, shift = ? WHERE id = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, sft.getDetails());
            preparedStatement.setString(2, sft.getDate());
            preparedStatement.setString(3, sft.getShift());
            preparedStatement.setInt(4, sft.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating shift: " + e.getMessage());
            return false;
        }
    }
    
    //Delete Shift
    public static boolean deleteShift(int id) {
    	String sql = "DELETE FROM shift WHERE id = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting shift: " + e.getMessage());
            return false;
        }
    }
}