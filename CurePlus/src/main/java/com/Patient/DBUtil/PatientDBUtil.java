package com.Patient.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DBConnection.DBConnection;
import com.Patient.Model.Patient;

public class PatientDBUtil {
	
	private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }

    // Insert Patients
    public static boolean insertPatient(Patient patient) {
        String sql = "INSERT INTO patient (name, age, address, phone, allergies, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, patient.getName());
            preparedStatement.setString(2, patient.getAge());
            preparedStatement.setString(3, patient.getAddress());
            preparedStatement.setString(4, patient.getPhone());
            preparedStatement.setString(5, patient.getAllergies());
            preparedStatement.setString(6, patient.getUsername());
            preparedStatement.setString(7, patient.getPassword());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error inserting patient: " + e.getMessage());
            // Log the error or take alternative action
            return false;
        }
    }

    // View All Patients
    public static List<Patient> viewAllPatients() {
        List<Patient> patients = new ArrayList<>();
        String sql = "SELECT * FROM patient";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	Patient patient = new Patient(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("age"),
                        resultSet.getString("address"),
                        resultSet.getString("phone"),
                        resultSet.getString("allergies"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
                patients.add(patient);
            }
            
            return patients;
            
        } catch (SQLException e) {
            System.out.println("Error viewing all patients: " + e.getMessage());
            return null;
        }
    }

    // Select Specific Patient
    public static Patient selectSpecificPatient(String username) {
        String sql = "SELECT * FROM patient WHERE username = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Patient(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("age"),
                        resultSet.getString("address"),
                        resultSet.getString("phone"),
                        resultSet.getString("allergies"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Error selecting specific patient: " + e.getMessage());
            return null;
        }
    }

    // Update Patient
    public static boolean updatePatient(Patient patient) {
        String sql = "UPDATE patient SET name = ?, age = ?, address = ? , phone = ?, allergies = ? ,username = ?, password = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        	preparedStatement.setString(1, patient.getName());
            preparedStatement.setString(2, patient.getAge());
            preparedStatement.setString(3, patient.getAddress());
            preparedStatement.setString(4, patient.getPhone());
            preparedStatement.setString(5, patient.getAllergies());
            preparedStatement.setString(6, patient.getUsername());
            preparedStatement.setString(7, patient.getPassword());
            preparedStatement.setInt(8, patient.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating patient: " + e.getMessage());
            return false;
        }
    }
    
    // Delete Patient
    public static boolean deletePatient(int id) {
        String sql = "DELETE FROM patient WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting patient: " + e.getMessage());
            return false;
        }
    }
	
}
