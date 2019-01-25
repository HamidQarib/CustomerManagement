package RealCustomer.CRUD;


import RealCustomer.To.RealCustomer;

import java.sql.*;
import java.util.ArrayList;


public class RealCustomerCRUD {
    private Connection connection;
    private PreparedStatement preparedStatement;
    RealCustomer realCustomer = new RealCustomer();

    private void insert(RealCustomer realCustomer) throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
        preparedStatement = connection.prepareStatement("insert into realcustomer(customerName, customerFamily, customersFatherName, nationalCode, dateOfBirth) values (?,?,?,?,?)");
        preparedStatement.setString(1, realCustomer.getCustomerName());
        preparedStatement.setString(2, realCustomer.getCustomerFamily());
        preparedStatement.setString(3, realCustomer.getCustomersFatherName());
        preparedStatement.setInt(4, realCustomer.getNationalCode());
        preparedStatement.setString(5, realCustomer.getDateOfBirth());
        preparedStatement.executeUpdate();

    }

   private  void close() throws Exception {
        connection.close();
        preparedStatement.close();
    }


    public ArrayList<RealCustomer> SearchRealCustomer(String customerNumber, String customerName, String dateOfBirth, String customersFatherName, String nationalCode, String customerFamily) {
        String sqlEqual = "";
        int parameterIndex = 1;
        int counter = 0;
        String[] fieldArr;
        fieldArr = new String[3];
        StringBuilder sql = new StringBuilder("select * from realCustomer where ");
        if (customerNumber != null && !customerNumber.equals("")) {
            sql.append("customerNumber = ?");
            sqlEqual = customerNumber;
            counter++;
            fieldArr[counter] = customerNumber;

        }
        if (customerName != null && !customerName.equals("")) {
            if (counter > 0) {
                sql.append(" && customerName = ?");
            } else {
                sql.append("customerName = ?");
                sqlEqual = customerName;
            }
            counter++;
            fieldArr[counter] = customerName;
        }
        if (dateOfBirth != null && !dateOfBirth.equals("")) {
            if (counter > 0) {
                sql.append(" && dateOfBirth = ?");

            } else {
                sql.append("dateOfBirth = ?");
                sqlEqual = dateOfBirth;
            }
            counter++;
            fieldArr[counter] = dateOfBirth;
        }
        if (customersFatherName != null && !customersFatherName.equals("")) {
            if (counter > 0) {
                sql.append(" && customersFatherName = ?");

            } else {
                sql.append("customersFatherName = ?");
                sqlEqual = customersFatherName;
            }
            counter++;
            fieldArr[counter] = customersFatherName;
        }
        if (nationalCode != null && !nationalCode.equals("")) {
            if (counter > 0) {
                sql.append(" && nationalCode = ?");
            } else {
                sql.append("nationalCode = ?");
                sqlEqual = nationalCode;
            }
            counter++;
            fieldArr[counter] = nationalCode;
        }
        if (customerFamily != null && !customerFamily.equals("")) {
            if (counter > 0) {
                sql.append(" && customerFamily = ?");
            } else {
                sql.append("customerFamily = ?");
                sqlEqual = customerFamily;
            }
            counter++;
            fieldArr[counter] = customerFamily;
        }

        ArrayList<RealCustomer> realCustomers = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
            if (customerName.equals("") && customerFamily.equals("") && customerNumber.equals("") && customersFatherName.equals("") && nationalCode.equals("") && dateOfBirth.equals("")) {
                preparedStatement = connection.prepareStatement("select * from realcustomer");
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

                realCustomer = new RealCustomer();
                realCustomer.setCustomerNumber(resultSet.getInt("customerNumber"));
                realCustomer.setCustomerName(resultSet.getString("customerName"));
                realCustomer.setCustomerFamily(resultSet.getString("customerFamily"));
                realCustomer.setCustomersFatherName(resultSet.getString("customersFatherName"));
                realCustomer.setNationalCode(resultSet.getInt("nationalCode"));
                realCustomer.setDateOfBirth(resultSet.getString("dateOfBirth"));

                realCustomers.add(realCustomer);

            }


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return realCustomers;
    }


    public void Update(int customerNumber, RealCustomer realCustomer) {

        try {


            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
            StringBuilder update = new StringBuilder("update realCustomer set ");
            if (realCustomer.getCustomerName() != null && !realCustomer.getCustomerName().equals("")) {
                update.append("customerName = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setString(1, realCustomer.getCustomerName());
                preparedStatement.executeUpdate();


            }
            if (realCustomer.getNationalCode() > 10) {
                update = new StringBuilder("update realCustomer set ");
                update.append("nationalCode = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setInt(1, realCustomer.getNationalCode());
                preparedStatement.executeUpdate();

            }
            if (realCustomer.getDateOfBirth() != null && !realCustomer.getDateOfBirth().equals("")) {
                update = new StringBuilder("update realCustomer set ");
                update.append("dateOfBirth = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setString(1, realCustomer.getDateOfBirth());
                preparedStatement.executeUpdate();
            }
            if (realCustomer.getCustomersFatherName() != null && !realCustomer.getCustomersFatherName().equals("")) {
                update = new StringBuilder("update realCustomer set ");
                update.append("customersFatherName = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setString(1, realCustomer.getCustomersFatherName());
                preparedStatement.executeUpdate();
            }
            if (realCustomer.getCustomerFamily() != null && !realCustomer.getCustomerFamily().equals("")) {
                update = new StringBuilder("update realCustomer set ");
                update.append("customerFamily = ? where customerNumber = ?");
                preparedStatement = connection.prepareStatement(String.valueOf(update));
                preparedStatement.setInt(2, customerNumber);
                preparedStatement.setString(1, realCustomer.getCustomerFamily());
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
            preparedStatement = connection.prepareStatement(" delete from realcustomer where customerNumber = ?");
            preparedStatement.setInt(1, customerNumber);
            preparedStatement.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    public ArrayList<RealCustomer> SelectingForUpdate(int customerNumber) {

        ArrayList<RealCustomer> realCustomers = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/information?user=root&password=12345");
            preparedStatement = connection.prepareStatement("SELECT  * FROM realcustomer where customerNumber = ?");
            preparedStatement.setInt(1, customerNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                realCustomer = new RealCustomer();
                realCustomer.setCustomerNumber(resultSet.getInt("customerNumber"));
                realCustomer.setCustomerName(resultSet.getString("customerName"));
                realCustomer.setCustomerFamily(resultSet.getString("customerFamily"));
                realCustomer.setCustomersFatherName(resultSet.getString("customersFatherName"));
                realCustomer.setNationalCode(resultSet.getInt("nationalCode"));
                realCustomer.setDateOfBirth(resultSet.getString("dateOfBirth"));
                realCustomers.add(realCustomer);

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return realCustomers;

    }
    public void person(RealCustomer realCustomer)throws Exception{
        RealCustomerCRUD realCustomerCRUD=new RealCustomerCRUD();
        realCustomerCRUD.insert ( realCustomer );
        realCustomerCRUD.close ();

    }

}
