<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="<%=request.getContextPath()%>/Login" method="post">
                  <div class="form-group first">
                    <label for="username">Email</label>
                    <input type="text" class="form-control" name="email" id="username" required>

                  </div>
                  <div class="form-group last mb-4">
                    <label for="username">Mot de passe</label>
                    <input type="password" class="form-control" name="pass" id="password" placeholder="" required>
                    
                  </div>
                  <input type="submit" value="Se connecter" class="btn text-white btn-block btn-info">
                
                    <center> <span class="ml-auto"> <a href="index.jsp" class="forgot-pass">Mot de passe oublieé</a></span> 
                  </center>

                  
                   <br>
       <p class="text-left small" style="color:black;">vous  n'avez pas un compte? <a href="register.jsp" style="color:#0096FF;"> 
       <strong>Inscrivez-vous ici!</strong></a></p>                               
                
                </form>
</body>
</html>