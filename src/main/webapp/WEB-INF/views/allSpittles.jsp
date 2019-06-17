<%@ page contentType="text/html; UTF-8" session="false" pageEncoding="UTF-8" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="edu.sam.spittr.Spittle" %>

<!-- JSTL tag lib connection -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<!-- ToDo: Set table borders' properties in CSS file -->
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        margin-top: 10px;
        margin-bottom: 10px;
    }
</style>

<head>
    <title>Spittr</title>
</head>

<body>

<h1>List of all Spittles</h1>

<table>
    <tr>
        <td>ID</td>
        <td>Message</td>
        <td>Time</td>
        <td>Latitude</td>
        <td>Longitude</td>
    </tr>
    <c:forEach items="${spittleList}" var="spittle">
        <tr>
            <td>${spittle.id}</td>
            <td>${spittle.message}</td>
            <td>${spittle.time}</td>
            <td>${spittle.longitude}</td>
            <td>${spittle.latitude}</td>
            <td><button type="button" onclick="location.href='spittles/edit/${spittle.id}'">edit</button></td>
            <td><button type="button" onclick="location.href='spittles/delete/${spittle.id}'">remove</button></td>
        </tr>
    </c:forEach>
</table>

<button type="button" onclick="location.href='spittles/create'">Add</button>

</body>

</html>
