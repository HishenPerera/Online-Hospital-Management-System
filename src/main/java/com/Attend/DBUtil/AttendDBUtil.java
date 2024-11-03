package com.Attend.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Attend.Model.Attend;
import com.DBConnection.DBConnection;

public class AttendDBUtil {
	
	private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }
    
    //Insert Attendance
    public static boolean insertAttend(Attend attend) {
    	String sql = "INSERT INTO attendance (attendDetails, date, morning, night) VALUES (?, ?, ?, ?)";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, attend.getAttendDetails());
            preparedStatement.setString(2, attend.getDate());
            preparedStatement.setString(3, attend.getMorning());
            preparedStatement.setString(4, attend.getNight());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error adding attendance: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
    
    // Get All Attendance
    public static List<Attend> getAllAttendance() {
    	List<Attend> attends = new ArrayList<>();
    	String sql = "SELECT * FROM attendance";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
    		 ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
            	Attend attend = new Attend(
            			resultSet.getInt("id"),
            			resultSet.getString("attendDetails"),
            			resultSet.getString("date"),
            			resultSet.getString("morning"),
            			resultSet.getString("night")
            	);
            	attends.add(attend);
            }
            return attends;
        } catch (SQLException e) {
            System.out.println("Error getting attendance: " + e.getMessage());
            // Log the error or take alternative action
            return attends;
        }
    }
    
    // Get Attendance by ID
    public static Attend getAttendanceById(int id) {
    	String sql = "SELECT * FROM attendance WHERE id = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
            	if (resultSet.next()) {
                	return new Attend(
                			resultSet.getInt("id"),
                			resultSet.getString("attendDetails"),
                			resultSet.getString("date"),
                			resultSet.getString("morning"),
                			resultSet.getString("night")
                	);
            	} else {
            		return null;
            	}
            }
        } catch (SQLException e) {
            System.out.println("Error getting attendance by id: " + e.getMessage());
            // Log the error or take alternative action
            return null;
        }
    }
    
    //Update Attendance
    public static boolean updateAttend(Attend attend) {
    	String sql = "UPDATE attendance SET attendDetails = ?, date = ?, morning = ?, night = ? WHERE id = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, attend.getAttendDetails());
            preparedStatement.setString(2, attend.getDate());
            preparedStatement.setString(3, attend.getMorning());
            preparedStatement.setString(4, attend.getNight());
            preparedStatement.setInt(5, attend.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating attendance: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
    
    // Delete Attendance
    public static boolean deleteAttend(int id) {
    	String sql = "DELETE FROM attendance WHERE id = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting attendance: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
}