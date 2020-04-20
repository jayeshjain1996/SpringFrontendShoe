<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <h1 style="text-align: center;color: gray;text-decoration: underline;">Profile Info</h1>
  <form class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin">
    <div class="form-group">
      <h4>${user.username}</h4>
      <p>
        <span style="font-weight: 600;">Email: </span> ${user.email} <br />
        <span style="font-weight: 600;">Authority: </span> ${user.authority}<br />
        <span style="font-weight: 600;">Status: </span> ${user.status}</p>     
    </div>
    <div class="form-group">
      <a class="form-control btn btn-secondary" href="${pageContext.request.contextPath}/user/updatepassword">Update Password</a>
    </div>
  </form>
</div> 
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>