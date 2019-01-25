<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 12/29/2018
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="LegalCustomer.CRUD.LegalCustomerCRUD" %>
<%@page import="LegalCustomer.To.LegalCustomer" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<link rel="stylesheet" type="text/css" href="../../../CssFile/Style.css">
<html lang="fa" dir="rtl">
<head>
    <title>گزارش عملیات ویرایش</title>
</head>
<body>
<%
    LegalCustomer legalCustomer=new LegalCustomer();
    java.sql.PreparedStatement preparedStatement;
    java.sql.Connection connection;
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
    preparedStatement=connection.prepareStatement("select * from legalcustomer where  economicCode=?");
    preparedStatement.setString(1,request.getParameter("economicCode"));
    ResultSet resultSet=preparedStatement.executeQuery();
    int i=0;
    while (resultSet.next()){
        i++;
    }
    if (i>0){ %>
<p class="legalCustomerAlertForEconomicCode">
    <%="این کد اقتصادی قبلا وارد شده است"%></p>

<%  }
else {

    LegalCustomerCRUD legalCustomerCRUD = new LegalCustomerCRUD();
    if (request.getParameter("companyName") != null && !request.getParameter("companyName").equals("") || request.getParameter("dateOfRegisteration") != null && !request.getParameter("dateOfRegisteration").equals("")) {

        legalCustomer.setCompanyName(request.getParameter("companyName"));
        legalCustomer.setDateOfRegistration(request.getParameter("dateOfRegisteration"));
    }

     else {
        legalCustomer.setEconomicCode(String.valueOf(request.getParameter("economicCode")));
    }
    legalCustomerCRUD.Update(Integer.parseInt(request.getParameter("customerNumber")), legalCustomer);
%>

<p><%="ویرایش مشتری با شماره("+request.getParameter("customerNumber")+")با موفقیت به اتمام رسید"%></p>
<%
    }
%>
<a href="../../LegalCustomerSelectTools.jsp" style="text-decoration: none" class="legalCustomerBackButtonToLegalCustomerSelectToolsInUpdatePage">بازگشت</a>
</body>
</html>
