package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showdata")
public class showUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String query = "select userid,name,email,mobile,dob,city,gender from user";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();
        //set content type
        response.setContentType("text/html");
        
        pw.println("<link rel = \"stylesheet\" href = \"style/style.css\"></link>");
        
        pw.println("<marquee><h2 class='text-primary'>User Data</h2></marquee>");
        //load the JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(Exception e) {
            e.printStackTrace();
        }
        //generate the connection
        try(Connection con = DriverManager.getConnection("jdbc:mysql:///registraion","root","123OOPAss#");
                PreparedStatement ps = con.prepareStatement(query);){
            //resultSet
            ResultSet rs = ps.executeQuery();
           
            pw.println("<table cellpadding=\"10\" cellspacing=\"10\">");
            pw.println("<tr>");
            pw.println("<th><h2>ID</h2></th>");
            pw.println("<th><h2>Name</h2></th>");
            pw.println("<th><h2>Email</h2></th>");
            pw.println("<th><h2>Mobile No</h2></th>");
            pw.println("<th><h2>DOB</h2></th>");
            pw.println("<th><h2>City</h2></th>");
            pw.println("<th><h2>Gender</h2></th>");
            pw.println("<th><h2>Edit</h2></th>");
            pw.println("<th><h2>Delete</h2></th>");
            pw.println("</tr>");
            while(rs.next()) {
                pw.println("<tr>");
                pw.println("<td>"+rs.getInt(1)+"</td>");
                pw.println("<td>"+rs.getString(2)+"</td>");
                pw.println("<td>"+rs.getString(3)+"</td>");
                pw.println("<td>"+rs.getString(4)+"</td>");
                pw.println("<td>"+rs.getString(5)+"</td>");
                pw.println("<td>"+rs.getString(6)+"</td>");
                pw.println("<td>"+rs.getString(7)+"</td>");
                pw.println("<td><a href='editurl?userid="+rs.getInt(1)+"'>Edit</a></td>");
                pw.println("<td><a href='deleteurl?userid="+rs.getInt(1)+"'>Delete</a></td>");
                pw.println("</tr>");
            }
            pw.println("</table>");
        }catch(SQLException se) {
            pw.println("<h2 class='bg-danger text-light text-center'>"+se.getMessage()+"</h2>");
            se.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
        pw.println("<button class='btn btn-outline-success d-block'><a href='index1.jsp'>Home</a></button>");
       
        //close the stream
        pw.close();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
