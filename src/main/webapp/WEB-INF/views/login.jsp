<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.margin
{
 margin:0 auto;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
  <form class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" action='<sp:url value="/loginaction"></sp:url>' method="post">
  <h1 style="font-family:fantasy;color: green;text-align:center;">Login Page</h1>
   <div class="form-group">
   <label>Enter Username</label>
   <input type="text" name="username" placeholder="Enter Username" class="form-control"/>
   </div>
   <div class="form-group">
   <label>Enter Password</label>
   <input type="password" name="password" placeholder="Enter Password" class="form-control"/>
   </div>
   <div class="form-group">
   <a  href="${pageContext.request.contextPath}/user/enterusername">Forgot Password?</a>
   </div>
   <div>
   <input type="submit" value="Login" class="btn btn-danger btn-block"/>
   <input type="reset" value="Reset" class="btn btn-secondary btn-block">
   </div>
  </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>