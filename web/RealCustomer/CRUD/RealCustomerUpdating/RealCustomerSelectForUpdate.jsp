<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 1/1/2019
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="RealCustomer.CRUD.RealCustomerCRUD" %>
<%@ page import="RealCustomer.To.RealCustomer" %>
<%@ page import="java.util.ArrayList" %>
<link rel="stylesheet" type="text/css" href="../../../CssFile/Style.css">
<html lang="fa" dir="rtl">
<head>
    <title >مشتری انتخاب شده برای ویرایش</title>
</head>
<body>
<table border="1" class="realCustomerSearchingForUpdateTable">
    <a href="../../RealCustomerSelectTools.jsp " style="text-decoration: none" class="realCustomerBackButtonToRealCustomerSelectToolsInSearchedForUpdatepage" >بازگشت</a>
    <tr>
        <td>شماره مشتری</td>
        <td>نام</td>
        <td>نام خانوادگی</td>
        <td>شماره ملی</td>
        <td>تاریخ تولد</td>
        <td>نام پدر</td>


    </tr>
    <tr>

    </tr>
        <%
   RealCustomerCRUD realCustomerCRUD=new RealCustomerCRUD();
    ArrayList<RealCustomer>list= realCustomerCRUD.SelectingForUpdate(Integer.parseInt(request.getParameter("selectingForUpdate")));
    RealCustomer realCustomer1=new RealCustomer();
   realCustomer1.setCustomerNumber(Integer.parseInt(request.getParameter("selectingForUpdate")));

    for (RealCustomer realCustomer:list ){


%>
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
        <td><%=realCustomer.getDateOfBirth()%>
        </td>
        <td><%=realCustomer.getCustomersFatherName()%>
        </td>
            <%}

%>
        <form action="RealCustomerUpdate.jsp">
    <tr>
        <td><input type="hidden" name="customerNumber" value="<%=realCustomer1.getCustomerNumber()%>" ></td>
        <td><input type="text" name="customerName" ></td>
        <td><input type="text" name="customerFamily" ></td>
        <td><input type="text" name="nationalCode" ></td>
        <td><input type="date" name="dateOfbirth" ></td>
        <td><input type="text" name="customersFatherName" ></td>
    </tr>
    <input type="submit" value="بروز رسانی" class="realCustomerEditButtonInSearchedForUpdate">
        </form>


</table>

</body>
</html>
