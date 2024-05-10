<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
    background-image:url("https://st4.depositphotos.com/13193658/30137/i/450/depositphotos_301375510-stock-illustration-young-woman-holding-credit-card.jpg");
      background-size: cover; /* Cover the entire background */
    background-repeat: no-repeat; /* Prevent the image from repeating */
    background-position: center;
}

h2 {
    text-align: center;
    margin-top: 20px;
    color: #333;
}

form {
    max-width: 500px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 5px;
    color: #333;
}

input[type="text"],
input[type="password"] {
    width: 90%;
    padding: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="submit"] {
    padding: 8px 15px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #007bff;
    outline: none;
}

input[type="text"]:hover,
input[type="password"]:hover {
    border-color: #007bff;
}
</style>
</head>
<body>
    <h2>Registration Form</h2>
    <form action="RegistrationServlet" method="post">
        <label for="cust_name">Name:</label>
        <input type="text" id="cust_name" name="cust_name" required><br><br>
        
        <label for="mobile">Mobile:</label>
        <input type="text" id="mobile" name="mobile" required><br><br>
        
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" required><br><br>
        
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required><br><br>
        
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>
