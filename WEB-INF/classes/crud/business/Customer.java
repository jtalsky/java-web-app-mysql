// save as "<TOMCAT_HOME>\webapps\lis4368\WEB-INF\classes\crud\business\Customer.java"
/*
 *After* making necessary changes, compile:
Windows:
  cd to C:\tomcat\webapps\lis4368\WEB-INF\classes
  javac -cp . crud/business/Customer.java

Mac:
  cd to /Applications/tomcat/webapps/lis4368/WEB-INF/classes
  javac -cp . crud/business/Customer.java
*/

package crud.business;

import java.io.Serializable;

//Reality-check: zip should be int, phone long, balance and totalSales BigDecimal data types
public class Customer implements Serializable
{
	private String fname;
	private String lname;
	private String email;

	//default constructor
	public Customer()
	{
		fname = "";
		lname = "";
		email = "";
	}

	public Customer(String parFirstName, String parLastName, String parEmail)
	{
		this.fname = parFirstName;
		this.lname = parLastName;
		this.email = parEmail;
	}

/*
	Note: Java getter/setter method names must start with get/set, followed by the capitalized property name, example:
	public String getFoo() {
  return foo;
	}
*/
	
	//getter/setter methods:
	//fname
	public String getFname()
	{
		return fname;
	}

	public void setFname(String parFirstName)
	{
		this.fname = parFirstName;
	}

	//lname
	public String getLname()
	{
		return lname;
	}

	public void setLname(String parLastName)
	{
		this.lname = parLastName;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String parEmail)
	{
		this.email = parEmail;
	}
}
