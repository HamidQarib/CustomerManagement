<%@ page import="java.sql.DriverManager" %>
<%@ page import="LegalCustomer.To.LegalCustomer" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 12/13/2018
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="../CssFile/Style.css">

<html lang="fa" dir="rtl">
<head>
    <title> صفحه مشتری حقوقی</title>
    <script>
        function validLogin() {
            var a=document.forms["form"]["companyName"].value;
            var b=document.forms["form"]["economicCode"].value;
            var c=document.forms["form"]["dateOfRegisteration"].value;
            if (a==null || a==="" || b==null || b==="" || c==null || c===""){

                alert("لطفا فیلدها را با دقت پر کنید");
                return false;
            }
        }
    </script>
</head>
<body>

<p>
    توجه داشته باشید که این صفحه فقط برای ثبت مشتری جدید میباشد,برای ورود به صفحه جستجو بر روی دکمه آبی رنگ کلیک کنید
</p>

<form action="CRUD/LegalCustomerInsert.jsp" name="form" onsubmit="return validLogin();">
    <div>
    <table  class="legalCustomerInsertTable" border="1">


   <tr>
       <td>نام شرکت:</td>
   </tr>
    <tr>
        <td><input type="text" name="companyName" value=""></td>
    </tr>


        <tr>
            <td>کد اقتصادی:</td>
        </tr>
    <tr>
        <td><input type="text" name="economicCode"></td>
    </tr>


   <tr>
       <td>تاریخ ثبت:</td>
   </tr>
   <tr>
       <td><input type="date" name="dateOfRegisteration"></td>
   </tr>
        <input type="submit" value="ثبت مشتری جدید" class="legalCustomerRegistrationButton">

    </table>
    </div>


</form>

<a href="LegalCustomerSelectTools.jsp" style="text-decoration: none" class="legalCustomerSearchingButton">جستجومشتری</a>

<a href="../index.jsp" style="text-decoration: none" class="legalCustomerBackButtonToIndex"> بازگشت</a>


</body>
</html>
