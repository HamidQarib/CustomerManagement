<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 12/19/2018
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="../CssFile/Style.css">
<html lang="fa" dir="rtl">
<body>
<p class="legalCustomerSelectingToolsParagraph">جستجوی شما بر اساس فیلدهای زیر میباشد..</p>

<form action="CRUD/LegalCustomerSelect.jsp">
    <table class="legalCustomerSelectingTools" border="1">
        <tr>
            <td>شماره مشتری:</td>
            <td><input type="text" name="customerNumber"></td>
        </tr>

       <tr>
           <td>کد اقتصادی:</td>
           <td><input type="text" name="economicCode"></td>
       </tr>
        <tr>
            <td>تاریخ ثبت:</td>
            <td><input type="date" name="dateOfRegisteration"></td>
        </tr>

        <tr>
            <td>نام شرکت:</td>
            <td><input type="text" name="companyName"></td>
        </tr>

    </table>
    <input type="submit" value="جستجو" class="LegalCustomerSearching">
</form>
<a href="../LegalCustomer/LegalCustomerInPut.jsp" style="text-decoration: none" class="legalCustomerBackButtonToLegalCustomerInPutInSelectTools">بازگشت</a>

</body>
<head>
    <title> صفحه جستجوی مشتری حقوقی</title>
</head>
</html>
