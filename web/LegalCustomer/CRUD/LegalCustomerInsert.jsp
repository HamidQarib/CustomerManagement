<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 12/14/2018
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="LegalCustomer.CRUD.LegalCustomerCRUD" %>
<%@ page import="LegalCustomer.To.LegalCustomer" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<link rel="stylesheet" type="text/css" href="../../CssFile/Style.css">
<html lang="fa" dir="rtl">

<head>

    <title>حقوقی</title>

</head>
<body>
<a href="../LegalCustomerInPut.jsp" style="text-decoration: none" class="legalCustomerBackButtonToLegalCustomerInPut">بازگشت</a>
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

    legalCustomer.setCompanyName(request.getParameter("companyName"));
    legalCustomer.setEconomicCode(request.getParameter("economicCode"));
    legalCustomer.setDateOfRegistration(request.getParameter("dateOfRegisteration"));
    LegalCustomerCRUD legalCustomerPersonManeger = new LegalCustomerCRUD();
    legalCustomerPersonManeger.personManeger(legalCustomer);

    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
    preparedStatement=connection.prepareStatement("select * from legalcustomer where companyName=? && economicCode=? && dateOfRegisteration=?");
    preparedStatement.setString(1,request.getParameter("companyName"));
    preparedStatement.setInt(2, Integer.parseInt(legalCustomer.getEconomicCode()));
    preparedStatement.setString(3,legalCustomer.getDateOfRegistration());
    resultSet=preparedStatement.executeQuery();
    while (resultSet.next()){
        legalCustomer.setCustomerNumber(resultSet.getInt("customerNumber"));
    }


%>
<p class="legalCustomerSuccessMessege">
    <%="مشتری حقوقی شما با شماره("+legalCustomer.getCustomerNumber()+" )ثبت گردید..."%>
</p>
<table border="1" class="legalCustomerRegisterationTable">
    <tr>
        <td>شماره مشتری</td>
        <td>نام شرکت</td>
        <td>شماره اقتصادی</td>
        <td>تاریخ ثبت</td>
    </tr>
    <tr>

        <td><%=legalCustomer.getCustomerNumber()%>
        </td>
        <td><%=legalCustomer.getCompanyName()%>
        </td>
        <td><%=legalCustomer.getEconomicCode()%>
        </td>
        <td><%=legalCustomer.getDateOfRegistration()%>
        </td>
    </tr>
</table>
<%
    }
%>


</body>
</html>
