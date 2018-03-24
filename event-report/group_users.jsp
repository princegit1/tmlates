<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="conn.*" %>
<%
int error=0;
double total=0;
int i=0;
PreparedStatement pstmt =null;
ResultSet rs =null;
Connection cn = null; 
String  title1="";
String name1="";
String designation1="";
String email1="";
String company1="";
String phone1="";
String mobile1="";
String fax1="";
 String address1="";
String city1="";
String state1="";
String pincode1="";
String country1="";

String  title="";
String name="";
String designation="";
String email="";
String company="";
String phone="";
String mobile="";
String fax="";
 String address="";
String city="";
String state="";
String pincode="";
String country="";


String  title2="";
String name2="";
String designation2="";
String email2="";
String company2="";
String phone2="";
String mobile2="";
String fax2="";
 String address2="";
String city2="";
String state2="";
String pincode2="";
String country2="";
String show_records="";

try
{

	String invoiceNumber=request.getParameter("invoicenumber");
	
	String selectQuery=null;
	
	
		selectQuery =" select title,`name`,designation,email,office,phone_office,mobile,fax,address,city,state,postcode,country from youth_summit_subscription where invoice_number='"+invoiceNumber+"'";
		
	try
	{
		AdminConnSubscriptions adminConn = AdminConnSubscriptions.getInstance();
		cn = adminConn.getConnection();
		pstmt=cn.prepareStatement(selectQuery);
		rs=pstmt.executeQuery();
		while(rs.next())
	{
	
	   

  title=rs.getString("title");
 name=rs.getString("name");
 designation=rs.getString("designation");
 email=rs.getString("email");
 company=rs.getString("office");
 phone=rs.getString("phone_office");
 mobile=rs.getString("mobile");
 fax=rs.getString("fax");
  address=rs.getString("address");
 city=rs.getString("city");
 state=rs.getString("state");
 pincode=rs.getString("postcode");
 country=rs.getString("country");
 

	 show_records += "<tr valign='top'><td>"+title+"</td><td>"+name+"</td><td>"+designation+"</td><td>"+email+"</td><td>"+company+"</td><td>"+mobile+"</td><td>"+address+"</td><td>"+city+"</td><td>"+state+"</td><td>"+country+"</td></tr>";

	
	
	
	
	}
	}
	catch(Exception ee)
	{
		out.println("ERROR"+ee.toString());
	}

	
%>
	<BODY>
	<P>
	<table width="686" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	<tr><td  bgcolor=blue></td><th><h3>GROUP ORDER REPORT<h3></th><td  bgcolor=blue></td></tr>
		<tr><td  bgcolor=blue></td><th><h3>INVOICE NO-<%=invoiceNumber %><h3></th><td  bgcolor=blue></td></tr>
	
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	</table>
<P>
	<table WIDTH="100%" cellspacing="0" cellpadding="3" border="1" bordercolorlight="#999999" bordercolordark="#ffffff">
<%
	
	

%>

			<tr>
			<th bgcolor="blue"><font size=3 color=white>Title</font></th>
			<th bgcolor="blue"><font size=3 color=white>Name</font></th>
            <th bgcolor="blue"><font size=3 color=white>Designation</font></th>
			<th bgcolor="blue"><font size=3 color=white>Email</font></th>
            <th bgcolor="blue"><font size=3 color=white>Company</font></th>            
			<th bgcolor="blue"><font size=3 color=white>Mobile</font></th>
			<th bgcolor="blue"><font size=3 color=white>Address</font></th>
			<th bgcolor="blue"><font size=3 color=white>City</font></th>
			<th bgcolor="blue"><font size=3 color=white>State</font></th>
			<th bgcolor="blue"><font size=3 color=white>Country</font></th>
			
			
	
</tr>

<%
	
out.print(""+show_records);
	
}
catch(Exception ee)
{
	out.print("exc="+ee+"<br>"+error);
}
finally
{
	try
	{
		rs.close();
		pstmt.close();
		cn.close();
	}
	catch(Exception eee)
	{
	}
}
%>
</tr>

</table>
</BODY>