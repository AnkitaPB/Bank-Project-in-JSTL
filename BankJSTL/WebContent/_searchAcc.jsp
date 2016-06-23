<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>      
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
<sql:setDataSource
       var=conn
       driver="com.mysql.jdbc.driver"
       	url= "jdbc:mysql://localhost:3306/bank"
       	user="root"
       	pass="root"
/>

<sql:query var="listOfItems" dataSource="conn">
              select * from acoount where accno=?
              <sql:param> value="${accno}"</sql:param>
</sql:query>
       

</body>
</html>