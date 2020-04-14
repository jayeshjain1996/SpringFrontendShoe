<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
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
  <h1 style="text-decoration: underline;text-decoration: underline;color: green;text-align: center;">ADD SHOE</h1>
  <c:if test="${s==null }">
  <sp:form class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" modelAttribute="shoe" action="${pageContext.request.contextPath}/shoe/add" method="post" enctype="multipart/form-data">
    <div class="form-group">
    <label>Enter Shoebrand</label>
    <sp:input path="shoebrand" placeholder="Enter Shoebrand" class="form-control"/>
    </div>
    <div class="form-group">
    <label>Enter shoemodel</label>
    <sp:input path="shoemodel" placeholder="Enter Shoemodel" class="form-control"/>
    </div>
    <div class="form-group">
    <label>Select Images</label>
    <input type="file" name="image" accept="image/*" multiple="multiple" height="250">
    </div>
    <div class="form-group">
    <label>Enter Sheosize</label>
    <sp:select path="shoesize" class="mdb-select md-form form-control">
    <option value="" disabled selected>Choose Size</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    </sp:select>
    </div>
    <div class="form-group">
    <label>Enter Shoecolour</label>
    <sp:input path="shoecolour" class="form-control" placeholder="Enter Shoecolour"/>
    </div>
    <div class="form-group">
    <label>Enter Price</label>
    <sp:input path="price" class="form-control" placeholder="Enter Price"/>
    </div>
    <div class="form-group">
    <input type="submit" value="Add" class="btn btn-primary btn-block">
    <input type="reset" value="Reset" class="btn btn-secondary btn-block"> 
    </div>
  </sp:form>
  </c:if>
  <c:if test="${s!=null}">
   <sp:form class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" modelAttribute="s" action="${pageContext.request.contextPath}/shoe/update" method="post">
    <div class="form-group">
    <label>Enter ShoeId</label>
    <sp:input path="shoeid" placeholder="Enter ShoeId" class="form-control"/>
    </div>
    <div class="form-group">
    <label>Enter Shoebrand</label>
    <sp:input path="shoebrand" placeholder="Enter Shoebrand" class="form-control"/>
    </div>
    <div class="form-group">
    <label>Enter shoemodel</label>
    <sp:input path="shoemodel" placeholder="Enter Shoemodel" class="form-control"/>
    </div>
    <div class="form-group">
    <label>Enter Sheosize</label>
    <sp:select path="shoesize" class="mdb-select md-form form-control">
    <option value="" disabled selected>Choose Size</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    </sp:select>
    </div>
    <div class="form-group">
    <label>Enter Shoecolour</label>
    <sp:input path="shoecolour" class="form-control" placeholder="Enter Shoecolour"/>
    </div>
    <div class="form-group">
    <label>Enter Price</label>
    <sp:input path="price" class="form-control" placeholder="Enter Price"/>
    </div>
    <div class="form-group">
    <input type="submit" value="Update" class="btn btn-success btn-block">
    <input type="reset" value="Reset" class="btn btn-secondary btn-block"> 
    </div>
  </sp:form>
  </c:if>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>