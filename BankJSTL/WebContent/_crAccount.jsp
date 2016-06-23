<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>      

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>_create Account</title>
</head>
<body>
<c:set var="aname" value="${param.sname"></c:set>
<c:set var="accno" value="${param.accno}"></c:set>
<c:set var="dob" value="${param.dob}"></c:set>
<c:set var="addr" value="${param.address}"></c:set>
<c:set var="type" value="${param.type}"></c:set>
<sql:setDataSource
	var="conn"
	driver="com.mysql.jdbc.Driver"
	url= "jdbc:mysql://localhost:3306/bank"
	user="root"
	password="root"
/>
<sql:query var="accounts" dataSource="${conn}">
select Max(AccountNo)+1 accno from account
</sql:query>

<c:set var="accno" value="0"/>
<c:forEach var="account" items="${account.rows}">
	<c:set var="accno" value="${account.accno}"/>
</c:forEach>
<br/><br/>
Account No :
<b>
<sql:update dataSource="${conn}" var="bank">
	insert into account(accno,name,type,dob,address)
values(?,?,?,?,?)
	<sql:param value='${accno}'/>
	<sql:param value='${param["aname"]}'/>
	<sql:param value='${param["type"]}'/>
	<sql:param value='${param["dob"]}'/>
	<sql:param value='${param["address"]}'/>
	</sql:update>	
<c:out value="Account Created Successfully..."/>
</body>
</html>