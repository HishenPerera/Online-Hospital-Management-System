<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel = "stylesheet" href = "style/style.css">
</head>

<body class="container-fluid">
    <marquee><h1 class="text-primary">------ S O N I C-E X P R E S S ------ </h1></marquee>
    <center>
      <form action="RegistraionServlet" method="post" class="form card" id="frm"><div style="opacity:0.4;">
        <h1 class="reg"><i>Registration Form</i></h1></div>
        <table class="table table-hover">
        <tr>
         <td style="font-size:22px"><b>Name</b></td>
         <td><input type="text" name="userName" required></td>
        </tr>
        <td><br></td>
        <tr>
         <td style="font-size:22px"><b>Email</b></td>
         <td><input type="email" name="email" required></td>
        </tr>
        <td><br></td>
        <tr>
         <td style="font-size:22px"><b>Mobile</b></td>
         <td><input type="number" name="mobile" required pattern="\d{10}" title="Please enter a 10 digit number"></td>
        </tr>
        <td><br></td>
        <tr>
         <td style="font-size:22px"><b>DOB</b></td>
         <td><input type="date" name="dob" required></td>
        </tr>
        <td><br></td>
        <tr>
         <td style="font-size:22px"><b>City</b></td>
         <td><input type="text" name="city" required></td>
        </tr>
        <td><br></td>
        <tr>
        <td style="font-size:22px"><b>Gender</b></td>
        <td><input type="radio" name="gender" value="male">Male &nbsp;
            <input type="radio" name="gender" value="female">Female
        </td>
        </tr>
        <td><br></td>
        <td><br></td>
        <td><br></td>
        <tr >
        <td><button type="submit" class="btn"><b>Register</b></button></td>
        <td><button type="reset" class="btn "><b>cancel</b></button></td>
        </tr>
        </table>
        <td><br></td>
        <button class="button"><a href="showdata">Show Users</a></button>
    </form>
</center>
    
</body>
</html>