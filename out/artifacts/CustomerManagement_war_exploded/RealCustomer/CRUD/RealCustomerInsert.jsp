<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 12/14/2018
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="RealCustomer.To.RealCustomer" %>
<%@ page import="RealCustomer.CRUD.RealCustomerCRUD" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<link rel="stylesheet" type="text/css" href="../../CssFile/Style.css">
<html lang="fa" dir="rtl">
<head>
    <title>Title</title>
</head>
<body>
<%
    RealCustomer realCustomer=new RealCustomer();
    java.sql.PreparedStatement preparedStatement;
    java.sql.Connection connection;
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
    preparedStatement=connection.prepareStatement("select * from realcustomer where nationalCode=? ");
    preparedStatement.setString(1,request.getParameter("nationalCode"));
    ResultSet resultSet=preparedStatement.executeQuery();
    int i=0;
    while (resultSet.next()){
        i++;
    }
    if (i>0){ %>
<p>
    <%="این کد ملی قبلا وارد شده است"%></p>

<%  }
else {


    realCustomer.setCustomerName(request.getParameter("customerName"));
    realCustomer.setCustomerFamily(request.getParameter("customerFamily"));
    realCustomer.setCustomersFatherName(request.getParameter("customersFatherName"));
    realCustomer.setNationalCode(Integer.parseInt(request.getParameter("nationalCode")));
    realCustomer.setDateOfBirth(request.getParameter("dateOfBirth"));
    RealCustomerCRUD realCustomerCRUD_PersonManager=new RealCustomerCRUD();
    realCustomerCRUD_PersonManager.person(realCustomer);
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
    preparedStatement=connection.prepareStatement("select * from realcustomer where customerName=? && customerFamily=? && customersFatherName=? && nationalCode=? && dateOfBirth=?");
    preparedStatement.setString(1,realCustomer.getCustomerName());
    preparedStatement.setString(2,realCustomer.getCustomerFamily());
    preparedStatement.setString(3,realCustomer.getCustomersFatherName());
    preparedStatement.setInt(4,realCustomer.getNationalCode());
    preparedStatement.setString(5,realCustomer.getDateOfBirth());
    resultSet=preparedStatement.executeQuery();
    while (resultSet.next()){
        realCustomer.setCustomerNumber(resultSet.getInt("customerNumber"));
    }

%>
<p class="realCustomerSuccessMessege">
    <%="مشتری حقیقی شما با شماره("+realCustomer.getCustomerNumber()+")با موفقیت ثبت شد"%>
</p>
<table border="1" class="realCustomerRegsterationTable">
    <tr>
        <td>شماره مشتری</td>
        <td>نام</td>
        <td>نام خانوادگی</td>
        <td>شماره ملی</td>
        <td>تاریخ تولد</td>
        <td>نام پدر</td>
    </tr>
    <tr>
        <td>
            <%=realCustomer.getCustomerNumber()%>
        </td>
        <td><%=realCustomer.getCustomerName()%>
        </td>
        <td><%=realCustomer.getCustomerFamily()%>
        </td>
        <td><%=realCustomer.getNationalCode()%>
        </td>
        <td>
            <%=realCustomer.getDateOfBirth()%>
        </td>
        <td>
            <%=realCustomer.getCustomersFatherName()%>
        </td>
    </tr>
</table>
<%
    }
%>

<a href="../RealCustomerInPut.jsp" style="text-decoration: none" class="realCustomerBackButtonTorealCustomerInPut">بازگشت</a>

</body>
</html>
