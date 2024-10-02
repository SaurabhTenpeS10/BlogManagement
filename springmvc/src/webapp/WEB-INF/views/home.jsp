<%@page import="com.jspiders.springmvc.dto.Role"%>
<%@page import="com.jspiders.springmvc.dto.UserDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #eef2f3;
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
        }

        #logo {
            width: 150px; /* Adjust based on your logo size */
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #fff;
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        nav a {
            width: 120px;
            padding: 12px;
            margin: 0 10px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 5px;
            text-align: center;
            text-decoration: none; /* Remove underline */
            transition: background-color 0.3s;
            font-weight: bold;
        }

        nav a:hover {
            background-color: #45a049; /* Darker green */
        }

        .hero {
            background-color: #4CAF50;
            color: white;
            padding: 40px 20px;
            text-align: center;
        }

        .hero h1 {
            font-size: 2.5em;
            margin: 0;
        }

        .hero p {
            font-size: 1.2em;
            margin-top: 10px;
        }

        .content {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .message {
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            color: #d9534f; /* Bootstrap danger color */
        }

        .card {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 15px;
            margin: 10px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-2px);
        }

        footer {
            text-align: center;
            padding: 15px 0;
            background-color: #4CAF50;
            color: white;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<header>
    <img id="logo" src="path_to_your_logo_image" alt="Logo"> <!-- Replace with your logo path -->
    <h1>Welcome to Your Blog Platform</h1>
</header>

<% 
UserDTO user = (UserDTO) request.getAttribute("user");
%>

<nav>
    <a href="./home" id="home">Home</a> 
    <a href="./update" id="edit">Update Profile</a> 
    <% if (user.getRole().equals(Role.ADMIN)) { %>
        <a href="./blogs">All Blogs</a>
        <a href="users">All Users</a>
    <% } else { %>
        <a href="./add-blog-page">Add Blog</a>
        <a href="./my-blogs">My Blogs</a>
        <a href="./blogs">All Blogs</a>
    <% } %>
    <a href="./logout">Logout</a>
    <a href="./delete">Delete Account</a>
</nav>

<div class="hero">
    <h1>Explore, Write, Share!</h1>
    <p>Your journey in blogging begins here.</p>
</div>

<div class="content">
    <div class="message">
        <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
        %>
        <h3><%=message%></h3>
        <%
        }
        %>
    </div>

    
</div>

<footer>
    <p>&copy; 2024 Your Blog Platform. All rights reserved.</p>
</footer>

</body>
</html>
