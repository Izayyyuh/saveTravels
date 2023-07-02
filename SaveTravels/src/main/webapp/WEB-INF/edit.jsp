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
	<h1>Edit Expense</h1>
	<a href="/expenses"> Go back</a>
	</div>
	<div>
	<form:form action="/expenses/update/${expenseToEdit.id}" method="PUT" modelAttribute="expenseToEdit" class="col-md-6 offset-md-3">
		<form:errors path="expense"/>
		<div>
		<form:label path="expense">Expense Name:</form:label>
		<form:input type="text" path="expense"/>
		</div>
		<form:errors path="vendor"/>
		<div>
		<form:label path="vendor">Vendor:</form:label>
		<form:input type="text" path='vendor'/>
		</div>
		<form:errors path="amount"/>
		<div>
		<form:label path="amount">Amount:</form:label>
		<form:input type="number" step= "any" path='amount'/>
		</div>
		<form:errors path="description"/>
		<div>
		<form:label path="description">Description:</form:label>
		<form:input type="text" path='description' required="true"/>
		</div>
		<form:button>Submit</form:button>
	</form:form>
	</div>
</body>
</html>