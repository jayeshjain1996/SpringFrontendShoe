<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <form action='<sp:url value="/user/password"></sp:url>' class="margin col-lg-6 col-md-6 col-sm-12 col-xm-12" method="post">
    <div class="form-group">
    <label>Enter Password</label>
    <input type="password" name="password" placeholder="Enter Password" class="form-control">
    </div>
    <div class="form-group">
    <label>Conform Password</label>
    <input type="password" name="cpassword" placeholder="Conform Password" class="form-control">
    </div>
    <div class="form-group">
    <input type="submit" value="Submit" class="btn btn-primary btn-block">
    <input type="reset" value="Reset" class="btn btn-danger btn-block">
    </div>
  </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>