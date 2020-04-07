<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <form class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin">
  <h1 style="color: lime;text-align: center;">Contact Us</h1>
    <div class="from-group">
    <label>Enter Email</label>
    <input type="email" placeholder="Enter Email" class="form-control"/>
    </div>
    <div class="form-group">
    <label>Enter Subject</label>
    <input type="text" placeholder="Enter Subject" class="form-control"/>
    </div>
    <div class="form-group">
    <label>Enter Description</label>
    <textarea rows="3" cols="6" placeholder="Enter Description" class="form-control"></textarea>
    </div>
    <div>
    <input type="submit" value="Submit" class="btn btn-primary btn-block"/>
    <input type="reset" value="Reset" class="btn btn-secondary btn-block"/>  
    </div>
  </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>