// IT23163218 M.H.S.Perera 

package com.AdminContent.Doctor.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DBConnection.DBConnection;

import com.AdminContent.Doctor.Model.Doctor;

public class DoctorDBUtil {
    private static Connection connection;

    static {
        connection = DBConnection.getConnection();
    }

    // Insert Doctor
    public static boolean insertDoctor(Doctor doctor) {
        String sql = "INSERT INTO doctor (name, speciality, phone, username, password, docId) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, doctor.getName());
            preparedStatement.setString(2, doctor.getSpeciality());
            preparedStatement.setString(3, doctor.getPhone());
            preparedStatement.setString(4, doctor.getUsername());
            preparedStatement.setString(5, doctor.getPassword());
            preparedStatement.setInt(6, doctor.getDocId()); 
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error inserting doctor: " + e.getMessage());
            return false;
        }
    }

    // View All Doctors
    public static List<Doctor> viewAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        String sql = "SELECT * FROM doctor";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Doctor doctor = new Doctor(
                        resultSet.getInt("docId"), 
                        resultSet.getString("name"),
                        resultSet.getString("speciality"),
                        resultSet.getString("phone"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
                doctors.add(doctor);
            }
            
            return doctors;
            
        } catch (SQLException e) {
            System.out.println("Error viewing all doctors: " + e.getMessage());
            return null;
        }
    }

    // Select Specific Doctor
    public static Doctor selectSpecificDoctor(int docId) { 
        String sql = "SELECT * FROM doctor WHERE docId = ?"; 
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, docId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Doctor(
                        resultSet.getInt("docId"), 
                        resultSet.getString("name"),
                        resultSet.getString("speciality"),
                        resultSet.getString("phone"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Error selecting specific doctor: " + e.getMessage());
            return null;
        }
    }
    
 // Select Specific doc
    public static Doctor selectSpecificDoctorbU(String username) {
        String sql = "SELECT * FROM doctor WHERE username = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Doctor(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("speciality"),
                        resultSet.getString("phone"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Error selecting specific doctor: " + e.getMessage());
            return null;
        }
    }
    
    // Delete Doctor
    public static boolean deleteDoctor(int docId) {
        String sql = "DELETE FROM doctor WHERE docId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, docId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting doctor: " + e.getMessage());
            return false;
        }
    }

    // Update Doctor
    public static boolean updateDoctor(Doctor doctor) {
        String sql = "UPDATE doctor SET name = ?, speciality = ?, phone = ?, username = ?, password = ? WHERE docId = ?"; 
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, doctor.getName());
            preparedStatement.setString(2, doctor.getSpeciality());
            preparedStatement.setString(3, doctor.getPhone());
            preparedStatement.setString(4, doctor.getUsername());
            preparedStatement.setString(5, doctor.getPassword());
            preparedStatement.setInt(6, doctor.getDocId()); 
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating doctor: " + e.getMessage());
            return false;
        }
    }
}
