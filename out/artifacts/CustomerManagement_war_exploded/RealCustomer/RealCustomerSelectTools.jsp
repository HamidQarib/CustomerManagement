<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 1/1/2019
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="../CssFile/Style.css">
<html lang="fa" dir="rtl">
<head>
    <title>صفحه جستجوی مشتری حقیقی</title>
</head>
<body>
<form action="CRUD/RealCustomerSelect.jsp">

<p>جستجوی شما بر اساس فیلدهای زیر میباشد..</p>
    <table border="1" class="realCustomerSelectingTools">
        <tr>
           <td>      شماره مشتری:
           </td>
            <td>    <input type="text" name="customerNumber">
            </td>
        </tr>
        <tr>
            <td>      شماره ملی:
            </td>
            <td>    <input type="text" name="nationalCode">
            </td>
        </tr>
        <tr>
            <td>      نام:
            </td>
            <td>    <input type="text" name="customerName">
            </td>
        </tr>
        <tr>
            <td>      نام خانوادگی:
            </td>
            <td>    <input type="text" name="customerFamily">
            </td>
        </tr>
        <tr>
            <td>      تاریخ تولد:
            </td>
            <td>    <input type="date" name="dateOfBirth">
            </td>
        </tr>
        <tr>
            <td>      نام پدر:
            </td>
            <td>    <input type="text" name="customersFatherName">
            </td>
        </tr>
    </table>
    <input type="submit" value="جستجو" class="realCustomerSearching">
    <a href="RealCustomerInPut.jsp" style="text-decoration: none" class="realCustomerBackButtonToRealCustomerInPutInSelectTools">بازگشت</a>
</form>

</body>
</html>
