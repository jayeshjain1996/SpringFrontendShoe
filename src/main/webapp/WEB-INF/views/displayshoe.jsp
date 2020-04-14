<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
<link rel="stylesheet" href='<sp:url value="/css/shoe.css"></sp:url>'>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src='<sp:url value="/images/${shoe.shoebrand}/${shoe.shoeimage}"></sp:url>'/></div>
						  <div class="tab-pane" id="pic-2"><img src='<sp:url value="/images/${shoe.shoebrand}/${shoe.shoeimage}"></sp:url>' /></div>
						  <div class="tab-pane" id="pic-3"><img src='<sp:url value="/images/${shoe.shoebrand}/${shoe.shoeimage}"></sp:url>'/></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src='<sp:url value="/images/${shoe.shoebrand}/${shoe.shoeimage}"></sp:url>'/></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src='<sp:url value="/images/${shoe.shoebrand}/${shoe.shoeimage}"></sp:url>'/></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src='<sp:url value="/images/${shoe.shoebrand}/${shoe.shoeimage}"></sp:url>'/></a></li>
						</ul>
					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${shoe.shoebrand}</h3>
				        <p class="product-description">${shoe.shoemodel}</p>
				        <p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<h4 class="price">current price: <span>Rs. ${shoe.price}</span></h4>
						<div class="action">
							<a class="add-to-cart btn btn-primary" href="${pageContext.request.contextPath}/cart/add/${shoe.shoeid}">Add to cart</a>
							<a class="btn btn-warning" href="${pageContext.request.contextPath}/order/${shoe.shoeid}">Buy</a>
							<sec:authorize access="isAuthenticated() and hasAuthority('admin')">
							<a class="btn btn-danger" href="${pageContext.request.contextPath}/shoe/delete/${shoe.shoeid}">Delete</a>
							<a class="btn btn-secondary" href="${pageContext.request.contextPath}/shoe/edit/${shoe.shoeid}">Edit</a>
						    </sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>