<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    
        body {
            background-color:#C9DFD6; /* Light Brown Background */
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-form {
            width: 400px;
            background: rgba(255, 255, 255, 0.8);
            border: 2px solid #0ecced;
            border-radius: 20px;
            padding: 20px;
         
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            color: #0c3f47;
            text-align: center;
        }

        p {
            color: #076ff7;
            text-align: center;
        }

        .fa {
  padding: 10px;
  font-size: 30px;
  width: 30px;
  text-align: center;
  text-decoration: none;
  margin: 5px 2px;
  border-radius: 50%;
}

.fa:hover {
    opacity: 0.7;
}

.fa-facebook {
  background: #3B5998;
  color: white;
}

.fa-twitter {
  background: #55ACEE;
  color: white;
}

.fa-google {
  background: #dd4b39;
  color: white;
}

        .social-button:hover {
            background-color: #0056b3;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
        }

        .divider-line {
            flex-grow: 1;
            height: 1px;
            background-color: black;
            margin: 0 10px;
        }

        .or {
            color: black;
            font-weight: bold;
        }

        .form-input {
            margin: 15px 0;
        }

        .form-label {
            display: block;
            color: black;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .form-input input {
            width: 100%;
            padding: 10px;
            border: 1px solid #DB915E;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            color: #767676;
        }

        .remember-me input {
            margin-right: 5px;
        }

        .forgot-password {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .register-link {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .login-button {
            background-color: #0b1961;
            color: white;
            border: none;
            border-radius: 7px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width:100px;
            height:45px;
        }

        .login-button:hover {
            background-color: #7573d1;
        }

       

    input[type="text"],
    input[type="password"],
    textarea,
    select {
        width: 90%;
        padding: 13px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-top: 5px;
        font-size: 16px;
    }

  

    
    </style>
</head>

<body>
<div class="form-container">
    <div class="login-form">
        <h1>Login</h1>
        <form action="loginservlet" method="post">
        <p>Sign in with</p>
       
        <div class="social-buttons">
        <center>
           <a href="#" class="fa fa-facebook"></a>
<a href="#" class="fa fa-twitter"></a>
<a href="#" class="fa fa-google"></a>
</center>
        </div>
        <div class="divider">
            <div class="divider-line"></div>
            <span class="or">Or</span>
            <div class="divider-line"></div>
        </div>
        <div class="form-input">
        
            <label class="form-label" for="username">User Name</label>
            <input type="text" name="username" placeholder="Enter your username" id="username" class="form-control form-control-lg">
        </div>
        <div class="form-input">
            <label class="form-label" for="password">Password</label>
            <input type="password" name="password" placeholder="Enter your password" id="password" class="form-control form-control-lg">
        </div>
        <div class="form-actions">
            <div class="remember-me">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">Remember me</label>
            </div>
            <a href="#" class="forgot-password">Forgot password?</a>
        </div>
        <div class="text-center">
        <center>
            <button type="submit" name="submit" class="login-button">Login</button>
            
            <p class="small mt-2">Don't have an account? <a href="register.jsp" class="register-link">Register</a></p>
            </center>
        </div>
    </div>
</div>
</form>
</body>
</html>
