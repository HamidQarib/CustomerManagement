<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 1/1/2019
  Time: 6:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="LegalCustomer.CRUD.LegalCustomerCRUD" %>
<%@ page import="LegalCustomer.To.LegalCustomer" %>
<%@ page import="java.util.ArrayList" %>
<link rel="stylesheet" type="text/css" href="../../../CssFile/Style.css">
<html lang="fa" dir="rtl">
<head>
    <title>صفحه ویرایش</title>
</head>
<body>
<table width="80%" border="1" class="legalCustomerSearchingForUpdateTable">
    <a href="../../LegalCustomerSelectTools.jsp" style="text-decoration: none"
       class="legalCustomerBackButtonToLegalCustomerSelectToolsInUpdatingSelect">بازگشت</a>
    <tr>
        <td>شماره مشتری</td>
        <td>شماره اقتصادی</td>
        <td>تاریخ ثبت</td>
        <td>نام شرکت</td>


    </tr>
    <tr>

    </tr>

    <%
        LegalCustomerCRUD legalCustomerCRUD = new LegalCustomerCRUD();
        ArrayList<LegalCustomer> list = legalCustomerCRUD.SelectingForUpdate(Integer.parseInt(request.getParameter("selectingForUpdate")));
        LegalCustomer legalCustomer1 = new LegalCustomer();
        legalCustomer1.setCustomerNumber(Integer.parseInt(request.getParameter("selectingForUpdate")));

        for (LegalCustomer legalCustomer : list) {


    %>
    <tr>
        <td><%=legalCustomer.getCustomerNumber()%>
        </td>
        <td><%=legalCustomer.getEconomicCode()%>
        </td>
        <td><%=legalCustomer.getDateOfRegistration()%>
        </td>
        <td><%=legalCustomer.getCompanyName()%>
        </td>


            <%}

%>
        <form action="LegalCustomerUpdate.jsp">
    <tr>
        <td><input type="hidden" name="customerNumber" value="<%=legalCustomer1.getCustomerNumber()%>"></td>
        <td><input type="text" name="economicCode"></td>
        <td><input type="date" name="dateOfRegisteration"></td>
        <td><input type="text" name="companyName"></td>
    </tr>
    <input type="submit" value="ویرایش" class="legalCustomerEditButtonInSearchingForUpdate">

    </form>

</table>
</body>
</html>
