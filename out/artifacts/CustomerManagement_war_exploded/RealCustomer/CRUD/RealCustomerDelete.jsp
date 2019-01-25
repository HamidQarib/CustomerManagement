<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 1/1/2019
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="RealCustomer.CRUD.RealCustomerCRUD" %>
<link rel="stylesheet" type="text/css" href="../../CssFile/Style.css">
<html lang="fa" dir="rtl">
<head>
    <title>عملیات حذف</title>

</head>
<body>
<%
    RealCustomerCRUD realCustomerCRUD=new RealCustomerCRUD();
    realCustomerCRUD.Delete(Integer.parseInt(request.getParameter("deletingDataButton")));

%>
<p><%=" مشتری با شماره("+request.getParameter("deletingDataButton")+")با موفقیت حذف شد"%></p>
<a href="../RealCustomerSelectTools.jsp" style="text-decoration: none" class="realCustomerBackButtonToRealCustomerSelectToolsInDeletingPage">بازگشت</a>


</body>
</html>
