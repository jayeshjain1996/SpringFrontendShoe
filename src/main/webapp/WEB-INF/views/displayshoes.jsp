<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href='<sp:url value="/css/shoes.css"></sp:url>'/>
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
    <h3 class="h3">shopping Demo-1 </h3>
    <div class="row">
      <c:forEach items="${shoes}" var="shoe">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid">
                <div class="product-image">
                    <a href="${pageContext.request.contextPath}/shoe/display/${shoe.shoeid}">
                        <img class="pic-1" style="height:250px" src='<sp:url value="/images/${shoe.shoebrand}/${shoe.shoeimage}"></sp:url>'>
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="#">${shoe.shoebrand}</a></h3>
                    <div class="price">Rs. ${shoe.price}
                        <span>Rs. ${shoe.price}</span>
                    </div>
                    <a class="add-to-cart" href="">+ Add To Cart</a>
                </div>
            </div>
         </div>
        </c:forEach>
      </div>
    </div>
<hr>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>