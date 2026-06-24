<!DOCTYPE html>
<html>
<head>
    <title>Case Edited Successfully</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #2ecc71, #27ae60);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
            width: 400px;
        }

        .icon {
            font-size: 60px;
            color: #2ecc71;
            margin-bottom: 20px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 10px 18px;
            text-decoration: none;
            color: white;
            border-radius: 6px;
            font-weight: bold;
        }

        .btn-view {
            background: #3498db;
        }

        .btn-add {
            background: #2ecc71;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

<div class="card">

    <h2>Case Edited Successfully!</h2>

    <p>Your case has been modified in the system.</p>

    <p>You can now view all cases.</p>

    <a href="<%=request.getContextPath()%>/CaseListServlet" class="btn btn-view">
        View Cases
    </a>

</div>

</body>
</html>