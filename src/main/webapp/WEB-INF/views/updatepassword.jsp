<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags" %>
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
  <form action='<sp:url value="/user/passwordcheck"></sp:url>' method="post" class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin">
    <div class="form-group">
     <label>Enter Old password</label>
     <input type="password" name="opass" class="form-control" placeholder="Enter Old Password">
    </div>
    <div class="form-group">
     <label>Enter New password</label>
     <input type="password" name="pass" class="form-control" placeholder="Enter new Password">     
    </div>
    <div class="form-group">
     <label>Conform new Password</label>
     <input type="password" name="cpass" class="form-control" placeholder="Conform new Password">
    </div>
    <div class="form-group">
     <input type="submit" value="Update" class="btn btn-block btn-primary">
     <input type="reset" value="Reset" class="btn btn-block btn-danger">
    </div>
  </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>