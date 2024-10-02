<%@page import="com.jspiders.springmvc.dto.WebBlogDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Blog</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
            margin: 0;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-group textarea {
            height: 150px;
            resize: vertical;
        }

        .form-group input[type="text"]:focus,
        .form-group textarea:focus {
            border-color: #6200ea;
            outline: none;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #6200ea;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #45009d;
        }

        .form-group small {
            font-size: 12px;
            color: #999;
        }
    </style>
</head>
<body>
	<% WebBlogDTO blog = (WebBlogDTO) request.getAttribute("blog"); %>
    <div class="container">
        <h2>Update Blog</h2>
        <form action="./update-blog" method="POST">
         <div class="form-group">
                <label for="title">Blog Id</label>
                <input type="text" id="title" name="id" value="<%= blog.getId() %>" readonly="readonly">
            </div>
            <!-- Title -->
            <div class="form-group">
                <label for="title">Blog Title</label>
                <input type="text" id="title" name="title" required value="<%=blog.getTitle() %>">
            </div>
            
            <!-- Content -->
            <div class="form-group">
                <label for="content">Content</label>
                <textarea id="content" name="content" required value="<%= blog.getContent() %>" ></textarea>
            </div>

            <!-- Author -->
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" id="author" name="author" required value="<%= blog.getAuthor() %>">
          
            </div>

            <!-- Add Blog Button -->
            <button type="submit" class="btn">Update Blog</button>
        </form>
    </div>

</body>
</html>
