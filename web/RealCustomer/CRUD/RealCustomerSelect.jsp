<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 1/1/2019
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="RealCustomer.CRUD.RealCustomerCRUD" %>
<%@ page import="RealCustomer.To.RealCustomer" %>
<%@ page import="java.util.ArrayList" %>
<link rel="stylesheet" type="text/css" href="../../CssFile/Style.css">
<html lang="fa" dir="rtl">
<head>
    <title>صفحه جستوجوی مشتری حقیقی</title>
    <script>
        function confirmComplete(element) {
            var answer=confirm("آیا مطمئن هستید که میخواهید به عملیات حذف مشتری("+element.value+")ادامه دهید؟");
            if (answer===true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    </script>
</head>
<body>
<table border="1" class="realCustomerSearchingTable">
    <tr>
        <td>شماره مشتری</td>
        <td>نام</td>
        <td>نام خانوادگی</td>
        <td>شماره ملی</td>
        <td>تاریخ تولد</td>
        <td>نام پدر</td>
        <td>ویرایش</td>
        <td>حذف</td>
    </tr>
        <%
    RealCustomerCRUD realCustomerCRUD=new RealCustomerCRUD();
   ArrayList<RealCustomer> list= realCustomerCRUD.SearchRealCustomer(request.getParameter("customerNumber"),request.getParameter("customerName"),request.getParameter("dateOfBirth"),request.getParameter("customersFatherName"),request.getParameter("nationalCode"),request.getParameter("customerFamily"));
   for (RealCustomer realCustomer : list){

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
        <td>
            <%=realCustomer.getDateOfBirth()%>
        </td>
        <td>
            <%=realCustomer.getCustomersFatherName()%>
        </td>
        <td>
            <form action="RealCustomerUpdating/RealCustomerSelectForUpdate.jsp">
                <button type="submit" value="<%=realCustomer.getCustomerNumber()%>" name="selectingForUpdate" class="realCustomerEditButton">ویرایش</button>
            </form>
        </td>

        <td>
            <form action="RealCustomerDelete.jsp">
                <button type="submit" value="<%=realCustomer.getCustomerNumber()%>" onclick="return confirmComplete(this);" name="deletingDataButton" class="realCustomerDeleteButton">حذف</button>
            </form>

        </td>
    </tr>
        <%
    }
%>

    <a href="../RealCustomerSelectTools.jsp" style="text-decoration: none" class="realCustomerBackButtonToRealCustomerInPutInSearchedPage">بازگشت</a>
</body>
</html>
