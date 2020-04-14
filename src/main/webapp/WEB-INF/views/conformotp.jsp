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
   <form action='<sp:url value="/user/checkotp"></sp:url>' class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" method="post">
     <div class="form-group">
     <label>Enter OTP</label>
     <input type="text" class="form-control" placeholder="Enter OTP" name="userotp">
     </div>
     <div class="form-group">
     <input type="hidden" name="otp" value="${otp}" class="form-control">
     </div>
     <div class="form-group">
     <input type="submit" value="Conform OTP" class="btn btn-secondary btn-block">
     <input type="reset" value="Reset" class="btn btn-danger btn-block">
     </div>
   </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>