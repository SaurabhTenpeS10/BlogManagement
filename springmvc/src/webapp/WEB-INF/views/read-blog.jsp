<%@page import="com.jspiders.springmvc.dto.WebBlogDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jspiders.springmvc.dto.CommentDTO"%> <!-- Import your CommentDTO -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Read Blog</title>
    <link rel="stylesheet" href="css/blogStyles.css">
    <style>
        /* Add your styles here */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .meta {
            text-align: center;
            font-size: 0.9em;
            color: #777;
            margin: 10px 0;
        }
        p {
            font-size: 1.1em;
            line-height: 1.6;
            color: #555;
            text-align: justify;
        }
        a.back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #5cb85c;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9em;
        }
        a.back-btn:hover {
            background-color: #4cae4c;
        }
        .comment-section {
            margin-top: 20px;
            border-top: 1px solid #ddd;
            padding-top: 10px;
        }
        .comment {
            margin: 10px 0;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .comment input[type="text"] {
            width: 80%;
            padding: 8px;
            margin-right: 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .comment input[type="submit"] {
            padding: 8px 12px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .comment input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .likes {
            text-align: center;
            margin: 10px 0;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // Retrieve the blog from the request scope
            WebBlogDTO blog = (WebBlogDTO) request.getAttribute("blog");
            List<CommentDTO> comments = (List<CommentDTO>) request.getAttribute("comments"); // Retrieve comments
            if (blog != null) {
        %>
        <h1><%= blog.getTitle() %></h1>
        <div class="meta">
            <span>By <strong><%= blog.getAuthor() %></strong> | Published on <%= blog.getDate() %></span>
        </div>
        <p><%= blog.getContent() %></p>

        <!-- Display the category of the blog -->
        <div class="meta">
            <span>Category: <strong><%= blog.getCategory() %></strong></span>
        </div>

        <!-- Display the likes count -->
        <div class="likes">
            <a href="add-like?blog-id=<%= blog.getId() %>">👍</a> <strong><%= blog.getLikes() %></strong> 
        </div>

        <!-- Comment Section -->
        <div class="comment-section">
            <h3>Comments:</h3>
            <%
                // Check if there are comments
                if (comments != null && !comments.isEmpty()) {
                    for (CommentDTO comment : comments) {
            %>
                <div class="comment">
                    <strong><%= comment.getAuthor() %></strong>: <%= comment.getContent() %>
                </div>
            <%
                    }
                } else {
            %>
                <p>No comments yet!</p>
            <%
                }
            %>

            <!-- Form to add a new comment -->
            <form action="./add-comment" method="POST">
                <input type="hidden" name="blogId" value="<%= blog.getId() %>"> <!-- Pass the blog ID -->
                <input type="text" name="author" required placeholder="Your Name" />
                <input type="text" name="content" required placeholder="Add a comment..." />
                <input type="submit" value="Post Comment" />
            </form>
        </div>

        <a href="blogs" class="back-btn">Back to Blogs</a>

        <%
            } else {
        %>
        <p>Blog not found!</p>
        <a href="blogs" class="back-btn">Back to Blogs</a>
        <%
            }
        %>
    </div>
</body>
</html>
