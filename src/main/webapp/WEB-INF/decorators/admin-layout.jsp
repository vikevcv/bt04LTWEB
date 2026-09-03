<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><sitemesh:write property='title'>Admin</sitemesh:write></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <sitemesh:write property='head'/>
</head>
<body>
    <jsp:include page="/views/topbar.jsp"/>
    <sitemesh:write property='body'/>
</body>
</html>
