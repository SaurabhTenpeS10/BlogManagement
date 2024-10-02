<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Blog</title>
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
        .form-group textarea,
        .form-group select {
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
        .form-group textarea:focus,
        .form-group select:focus {
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

        #custom-category-container {
            display: none;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add a New Blog</h2>
        <form action="./add-blog" method="POST">
            <!-- Title -->
            <div class="form-group">
                <label for="title">Blog Title</label>
                <input type="text" id="title" name="title" required placeholder="Enter the blog title">
            </div>
            
            <!-- Content -->
            <div class="form-group">
                <label for="content">Content</label>
                <textarea id="content" name="content" required placeholder="Write your blog content here"></textarea>
            </div>

            <!-- Author -->
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" id="author" name="author" required placeholder="Author's name">
                <small>By default, this field will be pre-filled with your logged-in username (if applicable).</small>
            </div>

            <!-- Category Selection -->
            <div class="form-group">
                <label for="category">Category:</label>
                <select name="category" id="category" required onchange="toggleCustomCategoryInput(this)">
                    <option value="" disabled selected>Select a category</option>
                    <option value="Technology">Technology</option>
                    <option value="Lifestyle">Lifestyle</option>
                    <option value="Travel">Travel</option>
                    <option value="Education">Education</option>
                    <option value="Health">Health</option>
                    <option value="custom">Add Custom Category</option>
                </select>

                <!-- Input field for custom category -->
                <div id="custom-category-container">
                    <input type="text" name="customCategory" placeholder="Enter custom category">
                </div>
            </div>

            <!-- Add Blog Button -->
            <button type="submit" class="btn">Add Blog</button>
        </form>
    </div>

    <script>
        function toggleCustomCategoryInput(select) {
            const customCategoryContainer = document.getElementById('custom-category-container');
            if (select.value === 'custom') {
                customCategoryContainer.style.display = 'block'; // Show the custom category input
            } else {
                customCategoryContainer.style.display = 'none'; // Hide the custom category input
            }
        }
    </script>

</body>
</html>
