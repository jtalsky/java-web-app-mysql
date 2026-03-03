<style>
/* Navbar background */
nav.navbar.navbar-inverse
{
    background-color: #782F40 !important;
    background-image: none !important;
    border-color: #CEB888 !important;
    border-bottom: 3px solid #CEB888;
}

/* Brand text (Home) */
.navbar-inverse .navbar-brand
{
    color: #CEB888;
    font-weight: bold;
}

/* Brand hover */
.navbar-inverse .navbar-brand:hover
{
    color: white;
}

/* Nav links */
.navbar-inverse .navbar-nav > li > a
{
    color: white;
}

/* Hover effect */
.navbar-inverse .navbar-nav > li > a:hover
{
    color: #CEB888;
    background-color: transparent;
}

/* Active page tab */
.navbar-inverse .navbar-nav > .active > a
{
    background-color: #5a2330;
    color: #CEB888;
}

/* Mobile menu button bars */
.navbar-inverse .navbar-toggle .icon-bar
{
    background-color: #CEB888;
}
</style>

<%@ page import="java.util.Date, java.util.TimeZone, java.text.SimpleDateFormat" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">			
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.jsp" target="_self">Home</a>
			</div>

			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="../index.jsp">LIS4368</a></li>
					<li><a href="../a1/index.jsp">A1</a></li>
					<li><a href="../a2/index.jsp">A2</a></li>
					<li><a href="../a3/index.jsp">A3</a></li>
					<li><a href="../customerform.jsp?assign_num=a4">A4</a></li>
					<li><a href="../customerform.jsp?assign_num=a5">A5</a></li>
					<li><a href="../p1/index.jsp">P1</a></li>
					<li><a href="../customerform.jsp?assign_num=p2">P2</a></li>
					<li><a href="../test/index.jsp">Test</a></li>					
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>

<%
//https://docs.oracle.com/javase/6/docs/api/java/text/SimpleDateFormat.html
SimpleDateFormat timeFormat = new SimpleDateFormat("M/d/yy h:m a ");
timeFormat.setTimeZone(TimeZone.getTimeZone("America/New_York"));
String time = timeFormat.format(new Date());
%>
<%= time %>