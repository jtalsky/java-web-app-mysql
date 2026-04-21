// save as "<TOMCAT_HOME>\webapps\lis4368\WEB-INF\classes\crud\admin\CustomerServlet.java"
/*
	1. Compile:
	NOTE: *YOUR* path will more than likely be *different*--depending upon where tomcat is installed!

	Windows:
  cd to C:\tomcat\webapps\lis4368\WEB-INF\classes
  javac -cp .;c:\tomcat\lib\servlet-api.jar crud/admin/CustomerServlet.java

	Mac: 	
  cd to /Applications/tomcat/webapps/lis4368/WEB-INF/classes
  javac -cp .:/Applications/tomcat/lib/servlet-api.jar crud/admin/CustomerServlet.java

	2. Run: http://localhost:9999/lis4368/customerAdmin
*/
package crud.admin;

import java.io.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import crud.business.Customer;
import crud.data.CustomerDB;

@WebServlet("/customerAdmin")
public class CustomerServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();

		String url = "/index.jsp";
		String message = "";
		String action = null;
		String cid = null;
		action = request.getParameter("action");

		if (request.getParameter("modify_customer") != null) 
			{
				action = "modify_customer";
				cid = request.getParameter(action); 
			}
		else if (request.getParameter("delete_customer") != null) 
			{
				action = "delete_customer";
				cid = request.getParameter(action); 
			}
		else if (request.getParameter("update_customer") != null) 
			{
				action = "update_customer";
				cid = request.getParameter(action);						
			}
		else
			{
				url = "/index.jsp";
			}

		if (action == null || action.equals("join"))
			{
				url = "/customerform.jsp";
			}
		else if (action.equals("modify_customer"))
			{
				Customer user = CustomerDB.selectCustomer(cid);
				session.setAttribute("user", user);
				url = "/modify.jsp";
			}
		else if (action.equals("display_customers"))
			{
				ArrayList<Customer> users = CustomerDB.selectCustomers();            
				request.setAttribute("users", users);
				url = "/customers.jsp";
			}
		else if (action.equals("add_customer"))
			{
				String id_v = request.getParameter(null);
				String firstName_v = request.getParameter("fname");
				String lastName_v = request.getParameter("lname");
				String street_v = request.getParameter("street");
				String city_v = request.getParameter("city");
				String state_v = request.getParameter("state");
				String zip_v = request.getParameter("zip");
				String phone_v = request.getParameter("phone");
				String email_v = request.getParameter("email");
				String balance_v = request.getParameter("balance");
				String totalSales_v = request.getParameter("total_sales");
				String notes_v = request.getParameter("notes");
				
				Customer user = new Customer(id_v, firstName_v, lastName_v, street_v, city_v, state_v, zip_v, phone_v, email_v, balance_v, totalSales_v, notes_v);

				//collect individual error messages
				String errors = getValidationErrors(firstName_v, lastName_v, street_v, city_v, state_v, zip_v, phone_v, email_v, balance_v, totalSales_v, notes_v);

				if (!errors.isEmpty())
					{
						message = errors;
						url = "/customerform.jsp";
					}
				else
					{
						CustomerDB.insert(user);
						message = "";
						url = "/thanks.jsp";
					}

				request.setAttribute("user", user);
				request.setAttribute("message", message);
			}

		else if (action.equals("update_customer"))
			{
				String firstName_v = request.getParameter("fname");
				String lastName_v = request.getParameter("lname");
				String street_v = request.getParameter("street");
				String city_v = request.getParameter("city");
				String state_v = request.getParameter("state");
				String zip_v = request.getParameter("zip");
				String phone_v = request.getParameter("phone");
				String email_v = request.getParameter("email");
				String balance_v = request.getParameter("balance");
				String totalSales_v = request.getParameter("total_sales");
				String notes_v = request.getParameter("notes");
				
				if(!isValidInput(firstName_v, lastName_v, street_v, city_v, state_v, zip_v, phone_v, email_v, balance_v, totalSales_v, notes_v))
					{
						url = "/modify.jsp";
					}
				else
					{
						Customer user = (Customer) session.getAttribute("user");        

						user.setId(cid);
						user.setFname(firstName_v);
						user.setLname(lastName_v);
						user.setStreet(street_v);
						user.setCity(city_v);
						user.setState(state_v);
						user.setZip(zip_v);
						user.setPhone(phone_v);
						user.setEmail(email_v);
						user.setBalance(balance_v);
						user.setTotalSales(totalSales_v);
						user.setNotes(notes_v);

						CustomerDB.update(user);
						
						ArrayList<Customer> users = CustomerDB.selectCustomers();            
						request.setAttribute("users", users);
						url = "/customers.jsp";
					}				
			}
			
		else if (action.equals("delete_customer"))
			{
				Customer user = CustomerDB.selectCustomer(cid);
				CustomerDB.delete(user);
				ArrayList<Customer> users = CustomerDB.selectCustomers();            
				request.setAttribute("users", users);
				url = "/customers.jsp";
			}

		getServletContext()
			.getRequestDispatcher(url)
			.forward(request, response);
	}    

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
		doPost(request, response);
	}

	// original isValidInput — kept as provided by professor
	private boolean isValidInput(String fname, String lname, String street, String city, String state, String zip, String phone, String email, String balance, String totalSales, String notes)
	{
    	if
		(
			fname == null ||
			lname == null ||
			street == null ||
			city == null ||
        	state == null ||
			zip == null ||
			phone == null ||
			email == null ||
        	balance == null ||
			totalSales == null
		)
		{
    	    return false;
    	}

    	// fname - letters and hyphens only, 1–15 chars
    	if (!fname.matches("^[a-zA-Z\\-]{1,15}$"))
			return false;

    	// lname - letters and hyphens only, 1–30 chars
    	if (!lname.matches("^[a-zA-Z\\-]{1,30}$"))
			return false;

    	// street - letters, numbers, spaces, commas, hyphens, periods, 1–30 chars
    	if (!street.matches("^[a-zA-Z0-9\\s,\\-\\.]{1,30}$"))
			return false;

    	// city - letters, numbers, hyphens, spaces, 1–30 chars
    	if (!city.matches("^[a-zA-Z0-9\\s\\-]{1,30}$"))
			return false;

    	// state - letters only, exactly 2 chars
    	if (!state.matches("^[a-zA-Z]{2}$"))
			return false;

    	// zip - numbers only, 5–9 chars
    	if (!zip.matches("^[0-9]{5,9}$"))
			return false;

    	// phone - numbers only, exactly 10 chars
    	if (!phone.matches("^[0-9]{10}$"))
			return false;

    	// email - standard email format, 1–100 chars
    	if (!email.matches("^([a-z0-9_\\.\\-]+)@([\\da-z\\.\\-]+)\\.([a-z\\.]{2,6})$"))
			return false;

    	// balance - numbers and decimal, 1–7 chars
    	if (!balance.matches("^[0-9\\.]{1,7}$"))
			return false;

    	// total sales - numbers and decimal, 1–7 chars
    	if (!totalSales.matches("^[0-9\\.]{1,7}$"))
			return false;

    	// notes - optional, cap at 255
    	if (notes != null && notes.length() > 255)
			return false;

    	return true;
	}

	// new method — returns individual error messages as an HTML string
	private String getValidationErrors(String fname, String lname, String street, String city,
                                        String state, String zip, String phone, String email,
                                        String balance, String totalSales, String notes)
	{
		StringBuilder errors = new StringBuilder();
		errors.append("<ul style='color: red; background-color: yellow; font-weight: bold; font-variant:small-caps;'>");

		// fname - check empty first, then validate
		if (fname == null || fname.isEmpty())
			errors.append("<li>First name required</li>");
		else if (!fname.matches("^[a-zA-Z\\-]{1,15}$"))
			errors.append("<li>First name can only contain letters and hyphens, no more than 15 characters</li>");

		// lname - check empty first, then validate
		if (lname == null || lname.isEmpty())
			errors.append("<li>Last name required</li>");
		else if (!lname.matches("^[a-zA-Z\\-]{1,30}$"))
			errors.append("<li>Last name can only contain letters and hyphens, no more than 30 characters</li>");

		// street - check empty first, then validate
		if (street == null || street.isEmpty())
			errors.append("<li>Street required</li>");
		else if (!street.matches("^[a-zA-Z0-9\\s,\\-\\.]{1,30}$"))
			errors.append("<li>Street can only contain letters, numbers, commas, hyphens, or periods, no more than 30 characters</li>");

		// city - check empty first, then validate
		if (city == null || city.isEmpty())
			errors.append("<li>City required</li>");
		else if (!city.matches("^[a-zA-Z0-9\\s\\-]{1,30}$"))
			errors.append("<li>City can only contain letters, numbers, hyphens, and space character, no more than 30 characters</li>");

		// state - check empty first, then validate
		if (state == null || state.isEmpty())
			errors.append("<li>State required</li>");
		else if (!state.matches("^[a-zA-Z]{2}$"))
			errors.append("<li>State can only contain letters, must be 2 characters</li>");

		// zip - check empty first, then validate
		if (zip == null || zip.isEmpty())
			errors.append("<li>Zip required, only numbers</li>");
		else if (!zip.matches("^[0-9]{5,9}$"))
			errors.append("<li>Zip can only contain numbers, must be between 5 and 9 characters, inclusive</li>");

		// phone - check empty first, then validate
		if (phone == null || phone.isEmpty())
			errors.append("<li>Phone required, including area code, only numbers</li>");
		else if (!phone.matches("^[0-9]{10}$"))
			errors.append("<li>Phone can only contain numbers, must be 10 characters including area code</li>");

		// email - check empty first, then validate
		if (email == null || email.isEmpty())
			errors.append("<li>Email address is required</li>");
		else if (!email.matches("^([a-z0-9_\\.\\-]+)@([\\da-z\\.\\-]+)\\.([a-z\\.]{2,6})$"))
			errors.append("<li>Must include valid email</li>");

		// balance - check empty first, then validate
		if (balance == null || balance.isEmpty())
			errors.append("<li>Balance is required</li>");
		else if (!balance.matches("^[0-9\\.]{1,7}$"))
			errors.append("<li>Balance can only contain numbers and decimal point, no more than 6 digits including decimal point</li>");

		// total_sales - check empty first, then validate
		if (totalSales == null || totalSales.isEmpty())
			errors.append("<li>Total sales is required</li>");
		else if (!totalSales.matches("^[0-9\\.]{1,7}$"))
			errors.append("<li>Total sales can only contain numbers and decimal point, no more than 6 digits including decimal point</li>");

		// notes - optional, cap at 255
		if (notes != null && notes.length() > 255)
			errors.append("<li>Notes cannot exceed 255 characters</li>");

		errors.append("</ul>");

		// if only the ul tags are present, no errors were found
		if (errors.toString().equals("<ul style='color: red; background-color: yellow; font-weight: bold; font-variant:small-caps;'></ul>"))
			return "";

		return errors.toString();
	}
}