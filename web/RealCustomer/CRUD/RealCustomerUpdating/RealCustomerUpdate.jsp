<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 1/1/2019
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="RealCustomer.CRUD.RealCustomerCRUD" %>
<%@ page import="RealCustomer.To.RealCustomer" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<link rel="stylesheet" type="text/css" href="../../../CssFile/Style.css">

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
    RealCustomerCRUD realCustomerCRUD = new RealCustomerCRUD();
    if (request.getParameter("customerName") != null || !request.getParameter("customerName").equals("") || request.getParameter("customerFamily") != null || !request.getParameter("customerFamily").equals("") || request.getParameter("nationalCode") != null || !request.getParameter("nationalCode").equals("") || request.getParameter("dateOfbirth") != null || !request.getParameter("dateOfbirth").equals("") || request.getParameter("customersFatherName") != null || !request.getParameter("customersFatherName").equals("")) {
        realCustomer.setCustomerName(request.getParameter("customerName"));
        realCustomer.setCustomerFamily(request.getParameter("customerFamily"));
        realCustomer.setDateOfBirth(request.getParameter("dateOfbirth"));
        realCustomer.setCustomersFatherName(request.getParameter("customersFatherName"));
    }
    if (request.getParameter("nationalCode").equals("")) {
        realCustomer.setNationalCode(1);
    } else {
        realCustomer.setNationalCode(Integer.parseInt(request.getParameter("nationalCode")));
    }

    realCustomerCRUD.Update(Integer.parseInt(request.getParameter("customerNumber")), realCustomer);

%>
<p><%="ویرایش مشتری با شماری("+request.getParameter("customerNumber")+")با موفقیت انجام شد"%></p>
<%}%>
<a href="../../RealCustomerSelectTools.jsp" style="text-decoration: none" class="realCustomerBackButtonToRealCustomerSelectToolsInUpdatePage">بازگشت</a>


</body>
</html>
