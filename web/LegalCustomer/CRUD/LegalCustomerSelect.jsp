<%--
  Created by IntelliJ IDEA.
  User: hamid
  Date: 12/14/2018
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="LegalCustomer.CRUD.LegalCustomerCRUD" %>
<%@ page import="LegalCustomer.To.LegalCustomer" %>
<%@ page import="java.util.ArrayList" %>
<link rel="stylesheet" type="text/css" href="../../CssFile/Style.css">

<html lang="fa" dir="rtl">
<head>
    <title>نتایج جستجو مشتری حقوقی</title>
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
<a href="../LegalCustomerSelectTools.jsp" style="text-decoration: none" class="legalCustomerBackButtonToLegalCustomerInPutInSearchedPage">بازگشت</a>
<table border="1" class="legalCustomerSearchingTable">
    <tr>
        <td>شماره مشتری</td>
        <td>نام شرکت</td>
        <td>شماره اقتصادی</td>
        <td>تاریخ ثبت</td>
        <td>ویرایش</td>
        <td>حذف</td>

    </tr>
        <%

  LegalCustomerCRUD selectLegalCustomerFromDB=new LegalCustomerCRUD();


    ArrayList<LegalCustomer> list=selectLegalCustomerFromDB.SearchingLegalCustomer(request.getParameter("customerNumber"),request.getParameter("economicCode"),request.getParameter("dateOfRegisteration"),request.getParameter("companyName"));


for (LegalCustomer legalCustomer:list ){


%>
    <tr>

        <td><%=legalCustomer.getCustomerNumber()%>
        </td>
        <td><%=legalCustomer.getCompanyName()%>
        </td>
        <td><%=legalCustomer.getEconomicCode()%>
        </td>
        <td><%=legalCustomer.getDateOfRegistration()%>
        </td>

        <td>
            <form action="LegalCustomerUpdating/LegalCustomerSelectingForUpdate.jsp">
                <button type="submit" value="<%=legalCustomer.getCustomerNumber()%>" class="legalCustomerEditButton"  name="selectingForUpdate">ویرایش</button>
            </form>
        </td>

        <td>
            <form action="LegalCustomerDelete.jsp" >
                <button type="submit" value="<%=legalCustomer.getCustomerNumber()%>"  class="legalCustomerDeleteButton"  onclick="return confirmComplete(this);"  name="deletingDataButton">حذف</button>
            </form>
        </td>

    </tr>


        <%
    }
%>

</body>
</html>
