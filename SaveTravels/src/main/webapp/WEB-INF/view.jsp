<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testing 123...</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="d-flex justify-content-around align-items-center">
		<h1>Expense Details</h1>
		<a href="/expenses">Go back</a>
	</div>
	<div class="d-flex justify-content-around mt-3">
		<p>Expense Name:</p>
		<c:out value="${viewExpense.expense}"></c:out>
	</div>
	<div class="d-flex justify-content-around">
		<p>Expense Description:</p>
		<c:out value="${viewExpense.description}"></c:out>
	</div>
	<div class="d-flex justify-content-around">
		<p>Vendor:</p>
		<c:out value="${viewExpense.vendor}"></c:out>
	</div>
	<div class="d-flex justify-content-around">
		<p>Amount spent:</p>
		<c:out value="${viewExpense.amount}"></c:out>
	</div>
</body>
</html>