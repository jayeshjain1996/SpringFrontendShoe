<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
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
   <h1 style="text-align: center;color: red;">Registration Form</h1>
   <sp:form class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" modelAttribute="user" action="${pageContext.request.contextPath}/user/register" method="post">
     <div class="form-group">
     <label>Enter Username</label>
     <sp:input path="username" cssClass="form-control" placeholder="Enter Username"/>
     </div>
     <div class="form-group">
     <label>Enter Email</label>
     <sp:input path="email" cssClass="form-control" placeholder="Enter Email"/>
     </div>
     <div class="form-group">
     <label>Enter Password</label>
     <sp:password path="password" cssClass="form-control" placeholder="Enter Password"/>
     </div>
     <div class="form-group">
     <input type="submit" value="Register" class="btn btn-primary btn-block">
     <input type="reset" value="Reset" class="btn btn-secondary btn-block"> 
     </div>
   </sp:form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>