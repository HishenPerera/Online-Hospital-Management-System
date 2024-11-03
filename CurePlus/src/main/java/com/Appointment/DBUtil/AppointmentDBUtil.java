package com.Appointment.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Appointment.Model.Appointment;
import com.DBConnection.DBConnection;

public class AppointmentDBUtil {
	
	private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }
    
    // Add Appointment
    public static boolean insertAppointment(Appointment appoint) {
    	String sql = "INSERT INTO appointment (patientName, patientAge, patientPhone, patientAllergies, selectDoctor, date, time) VALUES (?, ?, ?, ?, ?, ?, ?)";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, appoint.getPatientName());
            preparedStatement.setString(2, appoint.getPatientAge());
            preparedStatement.setString(3, appoint.getPatientPhone());
            preparedStatement.setString(4, appoint.getPatientAllergies());
            preparedStatement.setString(5, appoint.getSelectDoctor());
            preparedStatement.setString(6, appoint.getDate());
            preparedStatement.setString(7, appoint.getTime());
            return preparedStatement.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.out.println("Error adding appointment: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
    
    // Retrieve all Appointments
    public static List<Appointment> getAllAppointments() {
    	List<Appointment> appointments = new ArrayList<>();
    	String sql = "SELECT * FROM appointment";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	Appointment appoint = new Appointment(
            			resultSet.getInt("appointmentId"),
            			resultSet.getString("patientName"),
            			resultSet.getString("patientAge"),
            			resultSet.getString("patientPhone"),
            			resultSet.getString("patientAllergies"),
            			resultSet.getString("selectDoctor"),
            			resultSet.getString("date"), 
            			resultSet.getString("time")
            	);
            	appointments.add(appoint);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving appointments: " + e.getMessage());
            // Log the error or take alternative action
        }
    	return appointments;
    }
    
    // Retrieve Appointment by ID
    public static Appointment getAppointmentById(int appointmentId) {
    	Appointment appoint = null;
    	String sql = "SELECT * FROM appointment WHERE appointmentId = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, appointmentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
            	appoint = new Appointment(
            			resultSet.getInt("appointmentId"),
            			resultSet.getString("patientName"),
            			resultSet.getString("patientAge"),
            			resultSet.getString("patientPhone"),
            			resultSet.getString("patientAllergies"),
            			resultSet.getString("selectDoctor"),
            			resultSet.getString("date"),
            			resultSet.getString("time")
            	);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving appointment: " + e.getMessage());
            // Log the error or take alternative action
        }
    	return appoint;
    }
    
    
    // Delete Appointment
    public static boolean deleteAppointment(int appointmentId) {
    	String sql = "DELETE FROM appointment WHERE appointmentId = ?";
    	try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, appointmentId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting appointment: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }
}