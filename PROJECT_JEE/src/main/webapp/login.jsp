<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Controller.Login"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <!--Stylesheet-->
    <style media="screen">
      *,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    background-color: #8AABBE;
}
.background{
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
}
.background .shape{
    height: 200px;
    width: 200px;
    position: absolute;
    border-radius: 50%;
}
.shape:first-child{
    background: linear-gradient(
        #C0A9A1,
        #C0A9A1
    );
    left: -80px;
    top: -80px;
}
.shape:last-child{
    background: linear-gradient(
        to right,
        #D2C3BE,
        #D2C3BE
    );
    right: -30px;
    bottom: -80px;
}
form{
    height: 560px;
    width: 400px;
    background-color: rgba(255,255,255,0);
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 10px;
    border: 2px solid rgba(255,255,255,0.1);
    padding: 50px 35px;
    box-shadow: -3px -4px 76px 6px #97726A;
-webkit-box-shadow: -3px -4px 76px 6px #97726A);
-moz-box-shadow: -3px -4px 76px 6px #97726A;
}
form *{
    font-family: 'Poppins',sans-serif;
    color: #ffffff;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
}
form .alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}

form h3{
    font-size: 32px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
}

label{
    display: block;
    margin-top: 30px;
    font-size: 16px;
    font-weight: 500;
}
input{
    display: block;
    height: 50px;
    width: 100%;
    background-color: rgba(255,255,255,0.1);
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
}
::placeholder{
    color: #e5e5e5;
}
.button{
    margin-top: 50px;
    width: 100%;
    background-color: #ffffff;
    color: #080710;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}
.social{
  margin-top: 30px;
  display: flex;
}
.social div{
  width: 180px;
  border-radius: 20px;
  padding: 5px 10px 10px 5px;
  background-color: rgba(255,255,255,0.1);
  color: #eaf0fb;
  text-align: center;
}
.social div:hover{
  background-color: rgba(255,255,255,0.47);
}
.social .fb{
  margin-left: 25px;
}


    </style>
</head>
<body>
<div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form action="<%=request.getContextPath()%>/Login" method="post">
    <h3>Connectez-vous</h3>
    
    	<div class="alert"><% if(Login.info_wrong){ %>
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Danger!</strong> email ou password incorrecte.
  <%} %>
</div>
    	
    	
                    <label for="username">Email</label>
                    <input type="text" class="form-control" name="email" id="username" required>
                   
                    <label for="password">Mot de passe</label>
                    <input type="password" class="form-control" name="pass" id="password" placeholder="" required>
                    <input type="submit" value="Se connecter" class="button">
                
                <div class="social">
          <div class="go"><a href="index.jsp" class="forgot-pass">Mot de passe oublie??</a></div>
          <div class="fb"> <a href="formulaireregister.jsp">S'inscrire</a></div>
        </div>
           
                </form>
</body>
</html>