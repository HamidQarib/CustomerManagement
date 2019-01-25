<%--
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

    <title>صفحه مشتری حقیقی</title>
    <script>
        function validLogin() {
            var a = document.forms["form"]["customerName"].value;
            var b = document.forms["form"]["customerFamily"].value;
            var c = document.forms["form"]["customersFatherName"].value;
            var d = document.forms["form"]["nationalCode"].value;
            var e = document.forms["form"]["dateOfBirth"].value;
            if (a == null || a === "" || b == null || b === "" || c == null || c === "" || d == null || d === "" || e == null || e === "") {

                alert("لطفا فیلدها را با دقت پر کنید");
                return false;
            }
        }
    </script>
</head>
<body>
<%

%>

<form action="CRUD/RealCustomerInsert.jsp" name="form" onsubmit="return validLogin();" >

  <div>
    <table border="1" class="realCustomerInsertTable">
        <tr>
            <td> نام :</td>
            <td><input type="text" name="customerName">
            </td>
        </tr>
        <tr>
            <td> نام خانوادگی:
            </td>
            <td><input type="text" name="customerFamily">
            </td>
        </tr>
        <tr>
            <td> نام پدر:
            </td>
            <td><input type="text" name="customersFatherName">
            </td>
        </tr>
        <tr>
            <td> شماره ملی:
            </td>
            <td><input type="text" name="nationalCode">
            </td>
        </tr>
        <tr>
            <td> تاریخ تولد:
            </td>
            <td><input type="date" name="dateOfBirth">
            </td>
        </tr>

    </table>
  </div>


    <br/>

    <input type="submit" value="ثبت مشتری جدید" class="realCustomerRegsterationButton">
    <a href="RealCustomerSelectTools.jsp" style="text-decoration: none" class="realCustomerSearchingButton">جستجو</a>
    <a href="../index.jsp" style="text-decoration: none" class="realCustomerBackToIndex">بازگشت</a>


</form>

</body>


</html>