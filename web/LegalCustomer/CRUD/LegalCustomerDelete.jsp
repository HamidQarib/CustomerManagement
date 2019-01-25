<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 1/1/2019
  Time: 8:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="LegalCustomer.CRUD.LegalCustomerCRUD" %>
<link rel="stylesheet" type="text/css" href="../../CssFile/Style.css">

<html lang="fa" dir="rtl">
<head>
    <title>حذف</title>
</head>
<body>
<%
    LegalCustomerCRUD legalCustomerCRUD = new LegalCustomerCRUD();
    legalCustomerCRUD.Delete(Integer.parseInt(request.getParameter("deletingDataButton")));
%>
<p><%="مشتری با شماره(" + request.getParameter("deletingDataButton") + ")با موفقیت حذف شد"%>
</p>
<a href="../LegalCustomerSelectTools.jsp" style="text-decoration: none" class="legalCustomerBackButtonToLegalCustomerInPutInDeletingPage">بازگشت</a>


</body>
</html>
