package LegalCustomer.CRUD;

import ExceptionHandeling.InsertException;
import LegalCustomer.To.LegalCustomer;

import java.sql.*;
import java.util.ArrayList;

public class LegalCustomerCRUD {
    private LegalCustomer legalCustomer = new LegalCustomer();
    private Connection connection;
    private PreparedStatement preparedStatement;

    private void insert(LegalCustomer legalCustomer) throws InsertException {



        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        try {


            preparedStatement = connection.prepareStatement("insert into legalcustomer(companyName,dateOfRegisteration,economicCode)values (?,?,?)");

            preparedStatement.setString(1, legalCustomer.getCompanyName());
            preparedStatement.setString(2, legalCustomer.getDateOfRegistration());
            preparedStatement.setInt(3, Integer.parseInt(legalCustomer.getEconomicCode()));
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new InsertException("مقادیر ورودی را با دقت پر کنید"+e.getMessage());
        }
    }

    private void close() {
        try {


            connection.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<LegalCustomer> SearchingLegalCustomer(String customerNumber, String economicCode, String dateOfRegisteration, String companyName) {


        String sqlEqual = "";
        int parameterIndex = 1;
        int counter = 0;
        String[] fieldArr;
        fieldArr = new String[3];
        StringBuilder sql = new StringBuilder("select * from legalCustomer where");
        if (customerNumber != null && !customerNumber.equals("")) {
            sql.append(" customerNumber = ?");
            sqlEqual = customerNumber;
            counter++;
            fieldArr[counter] = customerNumber;

        }
        if (economicCode != null && !economicCode.equals("")) {
            if (counter > 0) {
                sql.append(" && economicCode = ?");
            } else {
                sql.append(" economicCode = ?");
                sqlEqual = economicCode;
            }
            counter++;
            fieldArr[counter] = economicCode;

        }
        if (dateOfRegisteration != null && !dateOfRegisteration.equals("")) {
            if (counter > 0) {
                sql.append(" && dateOfRegisteration = ?");
            } else {
                sql.append(" dateOfRegisteration = ?");
                sqlEqual = dateOfRegisteration;
            }
            counter++;
            fieldArr[counter] = dateOfRegisteration;
        }
        if (companyName != null && !companyName.equals("")) {
            if (counter > 0) {
                sql.append(" && companyName = ?");
            } else {
                sql.append(" companyName = ?");
                sqlEqual = companyName;
            }
            counter++;
            fieldArr[counter] = companyName;
        }

        ArrayList<LegalCustomer> legalCustomers = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
            if (economicCode.equals("") && companyName.equals("") && dateOfRegisteration.equals("") && customerNumber.equals("")) {
                preparedStatement = connection.prepareStatement("SELECT * FROM legalcustomer");
            } else if (counter >= 2) {
                preparedStatement = connection.prepareStatement(String.valueOf(sql));
                int memoryCounter = 1;
                for (int c = 1; c <= counter; c++) {
                    preparedStatement.setString(parameterIndex, fieldArr[memoryCounter]);
                    memoryCounter++;
                    parameterIndex++;
                }
            } else {
                preparedStatement = connection.prepareStatement(String.valueOf(sql));
                preparedStatement.setString(parameterIndex, sqlEqual);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {

                legalCustomer = new LegalCustomer();
                legalCustomer.setCustomerNumber(resultSet.getInt("customerNumber"));
                legalCustomer.setEconomicCode(String.valueOf(resultSet.getInt("economicCode")));
                legalCustomer.setCompanyName(resultSet.getString("companyName"));
                legalCustomer.setDateOfRegistration(resultSet.getString("dateOfRegisteration"));
                legalCustomers.add(legalCustomer);

            }


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return legalCustomers;
    }


    public void Update(int customerNumber, LegalCustomer legalCustomer) {

        try {


            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
            StringBuilder update = new StringBuilder("update legalcustomer set ");
            if (legalCustomer.getCompanyName() != null && !legalCustomer.getCompanyName().equals("")) {
                update.append("companyName = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setString(1, legalCustomer.getCompanyName());
                preparedStatement.executeUpdate();


            }
            if (legalCustomer.getEconomicCode() !=null && !legalCustomer.getEconomicCode().equals("")) {
                update = new StringBuilder("update legalcustomer set ");
                update.append("economicCode = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setInt(1, Integer.parseInt(legalCustomer.getEconomicCode()));
                preparedStatement.executeUpdate();

            }
            if (legalCustomer.getDateOfRegistration() != null && !legalCustomer.getDateOfRegistration().equals("")) {
                update = new StringBuilder("update legalcustomer set ");
                update.append("dateOfRegisteration = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setString(1, legalCustomer.getDateOfRegistration());
                preparedStatement.executeUpdate();
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void Delete(int customerNumber) {


        try {


            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
            preparedStatement = connection.prepareStatement("DELETE FROM legalcustomer WHERE customerNumber = ?");
            preparedStatement.setInt(1, customerNumber);
            preparedStatement.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    public ArrayList<LegalCustomer> SelectingForUpdate(int customerNumber) {

        ArrayList<LegalCustomer> legalCustomers = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
            preparedStatement = connection.prepareStatement("SELECT  * FROM legalcustomer where customerNumber = ?");
            preparedStatement.setInt(1, customerNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                legalCustomer = new LegalCustomer();
                legalCustomer.setCustomerNumber(resultSet.getInt("customerNumber"));
                legalCustomer.setEconomicCode(String.valueOf(resultSet.getInt("economicCode")));
                legalCustomer.setCompanyName(resultSet.getString("companyName"));
                legalCustomer.setDateOfRegistration(resultSet.getString("dateOfRegisteration"));
                legalCustomers.add(legalCustomer);

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return legalCustomers;

    }
    public void personManeger(LegalCustomer legalCustomer) throws InsertException {
        LegalCustomerCRUD selectLegalCustomerFromDB = new LegalCustomerCRUD();
        selectLegalCustomerFromDB.insert(legalCustomer);
        selectLegalCustomerFromDB.close();
    }
}
