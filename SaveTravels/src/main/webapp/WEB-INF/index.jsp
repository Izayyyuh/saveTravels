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
	<div class="w-75 mx-auto">
		<h1>Save Travels</h1>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th style="text-align:center" scope="col">Expense</th>
					<th style="text-align:center" scope="col">Vendor</th>
					<th style="text-align:center" scope="col">Amount</th>
					<th style="text-align:center" scope="col">Actions</th>
				</tr>
			</thead>
			<c:forEach var="expense" items="${allTheExpenses}">
			<tr>
			<td style="text-align:center">
			<%-- <c:url value = "${expense.expense}"/> --%>
				<a href = "/expenses/${expense.id}">${expense.expense}</a>
			</td>
			<td style="text-align:center">
			<p><c:out value="${expense.vendor}"></c:out></p>
			</td>
			<td style="text-align:center">
			<p>$<c:out value="${expense.amount}"></c:out></p>
			</td>
			<td style="text-align:center">
			<a href="/expenses/edit/${expense.id}" type="button" class="btn btn-secondary">Edit</a>
			<a href="/expenses/delete/${expense.id}" type="button" class="btn btn-danger">Delete</a>
			</td>
			
			</tr>
			</c:forEach>
	</table>
	</div>
	<div class="col-md-6 offset-md-3">
		<h2>Add an expense:</h2>
		<form:form class="form-horizontal" action="/expenses/create" method="POST" modelAttribute="newExpense">
			<form:errors style="color:red" path="expense"/>
			<div class="text-center form-outline w-35 d-flex mt-1">
			<form:label for="formControlInput" class="form-label text-nowrap" path="expense">Expense Name:</form:label>
			<form:input class="input-group input-group-sm" id="formControlInput" type="text" path="expense" required="true"/>
			</div>
			<form:errors style="color:red" path="vendor"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="vendor" class="form-label">Vendor:</form:label>
			<form:input class="input-group input-group-sm" type="text" path='vendor' required="true"/>
			</div>
			<form:errors style="color:red" path="amount"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="amount" class="form-label">Amount:</form:label>
			<form:input class="input-group input-group-sm" type="number" step="any" path='amount' required="true"/>
			</div>
			<form:errors style="color:red" path="description"/>
			<div class="text-center form-outline w-30 d-flex mt-3">
			<form:label path="description" class="form-label">Description:</form:label>
			<form:input class="input-group input-group-sm" style="height:90px" type="text" path='description' required="true"/>
			</div>
			<div class="text-center">
			<form:button class="btn btn-primary text-center mt-3">Submit</form:button>
			</div>
		</form:form>
	</div>
</body>
</html>