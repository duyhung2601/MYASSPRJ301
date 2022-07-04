<%-- 
    Document   : newjsp
    Created on : Jun 21, 2022, 9:38:02 PM
    Author     : ASUS
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="margin-left: 560px;"> Campus:<select>
            <option>HL</option>
            <option>DN</option>
            <option>HCM</option>
        </select></div>
        <div style="margin-left: 500px;">Lecturer:<input value="sonnt5" disabled="true"/><button>View</button>
        </div> 
        <table style="margin-left: 300px;">
            <tr style="background-color: #3366ff;">
                <td> Year 
            <select>
                <option>2022</option>   
                <option>2023</option>   
                <option>2024</option>   
            </select>
            </td>
            <c:forEach items="${list}" var="n">
                
                <td style="padding: 10px 30px 10px 30px">${n}</td>
                
            </c:forEach>
            </tr>
            <tr style="background-color: #3366ff;">
            
            <td>Week
            <select>
                <option>17/1 To 23/1</option>
            </select>
         </td>
         <c:forEach items="${date}" var="d">
                    <td>${d}</td>              
            </c:forEach>
</tr>
<tr>
    <td style="height: 60px;">slot 1</td>
</tr>
<tr>
    <td style="height: 60px;">slot 2</td>
</tr>
<tr>
    <td style="height: 60px;">slot 3</td>
</tr>
<tr>
    <td style="height: 60px;">slot 4</td>
</tr>
<tr>
    <td style="height: 60px;">slot 5</td>
</tr>
<tr>
    <td style="height: 60px;">slot 6</td>
</tr>
<tr>
    <td style="height: 60px;">slot 7</td>
</tr>
        </table>
    </body>
</html>
