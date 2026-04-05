/*
    Compile:
    Windows:
    cd to C:\tomcat\webapps\lis4368\WEB-INF\classes
    javac -cp . crud/data/*.java

    Packages are used to organize classes into similar groupings and/or functionality
*/
package crud.data;

import java.sql.*;
import java.util.ArrayList;

import crud.business.Customer;

public class CustomerDB
{
    //insert method (pass customer object to parameter customer)
    public static int insert(Customer customer)
    {
        ConnectionPool pool = ConnectionPool.getInstance(); //create ConnectionPool object pool
        Connection connection = pool.getConnection(); //establish database connection
        PreparedStatement ps = null;
        //unfortunately, JDBC doesn't make it easy to use named parameters (:name) instead of indices (?). :(
        String query
            = "INSERT INTO customer (cus_fname, cus_lname, cus_street, cus_city, cus_state, cus_zip, cus_phone, cus_email, cus_balance, cus_total_sales, cus_notes) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try
        {
            ps = connection.prepareStatement(query);
            ps.setString(1, customer.getFname());
            ps.setString(2, customer.getLname());
            ps.setString(3, customer.getStreet());
            ps.setString(4, customer.getCity());
            ps.setString(5, customer.getState());
            ps.setString(6, customer.getZip());
            ps.setLong(7, Long.parseLong(customer.getPhone()));
            ps.setString(8, customer.getEmail());
            ps.setDouble(9, Double.parseDouble(customer.getBalance()));
            ps.setDouble(10, Double.parseDouble(customer.getTotalSales()));
            ps.setString(11, customer.getNotes());

            return ps.executeUpdate();
        }
        catch (SQLException e)
        {
            System.out.println(e);
            return 0;
        }
        finally
        {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
}