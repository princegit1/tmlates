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
try
{

	String day1=request.getParameter("Start_Day");
	String month1=request.getParameter("Start_Month");
	String year1=request.getParameter("Start_Year");
	String day2=request.getParameter("Ending_Day");
	String month2=request.getParameter("Ending_Month");
	String year2=request.getParameter("Ending_Year");
	String reportType=request.getParameter("reportType");
	String date1=year1+"-"+month1+"-"+day1;
	String date2=year2+"-"+month2+"-"+day2;	
	String active=""+session.getAttribute("UserActive");
	String selectQuery=null;
	
	if(active.equals("null"))
	{
		response.sendRedirect("Login_TT.jsp");
	}
	
    
	if(request.getParameter("orderstatus").equals("all"))
	{
		selectQuery="SELECT su.email_id,su.fname fname, su.mname mname, su.lname lname, su.sex sex, su.phone phone, su.dob dob,su.user_comment, od.record_date record_date,sud.bill_address_line1 bill_address_line1, sud.bill_address_line2 bill_address_line2, sud.bill_city bill_city, sud.bill_state bill_state, sud.bill_country bill_country, sud.bill_pin bill_pin, sud.user_profession user_profession, sud.user_designation user_designation, sud.user_education user_education, sud.user_monthly_income user_monthly_income , od.gift,od.order_id order_id, ppm.payment_mode payment_mode, od.payment_status payment_status, od.price price, od.discount discount, od.payment payment , od.shipping_name shipping_name, od.shipping_address shipping_address, od.shipping_city shipping_city, od.shipping_pin shipping_pin, od.shipping_state shipping_state, od.shipping_country shipping_country,od.prod_term_yr prod_term_yr, od.no_of_issue no_of_issue, od.auth_code auth_code, od.subscription_type subscription_type FROM sub_user su, sub_user_details sud, order_details od, prod_payment_mode ppm WHERE su.user_id=sud.user_id AND sud.user_id=od.user_id and ppm.prod_pay_mode_id = od.payment_mode_id AND prod_price_id IN(152) and od.order_id>33465 and od.record_date BETWEEN '"+date1+"' AND '"+date2+"' ";
	}

	else
	{
		selectQuery="SELECT su.email_id,su.fname fname, su.mname mname, su.lname lname, su.sex sex, su.phone phone, su.dob dob,su.user_comment, od.record_date record_date,sud.bill_address_line1 bill_address_line1, sud.bill_address_line2 bill_address_line2, sud.bill_city bill_city, sud.bill_state bill_state, sud.bill_country bill_country, sud.bill_pin bill_pin, sud.user_profession user_profession, sud.user_designation user_designation, sud.user_education user_education, sud.user_monthly_income user_monthly_income , od.order_id order_id, ppm.payment_mode payment_mode, od.payment_status payment_status, od.price price, od.discount discount,  od.gift,od.payment payment , od.shipping_name shipping_name, od.shipping_address shipping_address, od.shipping_city shipping_city, od.shipping_pin shipping_pin, od.shipping_state shipping_state, od.shipping_country shipping_country,od.prod_term_yr prod_term_yr, od.no_of_issue no_of_issue, od.auth_code auth_code, od.subscription_type subscription_type FROM sub_user su, sub_user_details sud, order_details od, prod_payment_mode ppm WHERE su.user_id=sud.user_id and od.order_id>33465 and  sud.user_id=od.user_id and ppm.prod_pay_mode_id = od.payment_mode_id AND prod_price_id IN(152) and od.record_date BETWEEN '"+date1+"' AND '"+date2+"' ";
	}
		
	if(request.getParameter("orderstatus").equals("Paygot"))
	{
		selectQuery=selectQuery+" AND od.payment_status='REALIZED'";
	}
	
	else if(request.getParameter("orderstatus").equals("Paynot"))
	{
		selectQuery=selectQuery+" AND (od.payment_status='PENDING' OR od.payment_status='FAILED') ";
	}

	if(request.getParameter("payType").equals("online"))
	{
		selectQuery=selectQuery+"AND ppm.payment_mode='ONLINE_CC' ";
	}
	
	else if(request.getParameter("payType").equals("offline"))
	{
		selectQuery=selectQuery+"AND (ppm.payment_mode='OFFINE_CHEQUE' OR ppm.payment_mode='OFFLINE_DD') ";
	}
		selectQuery = selectQuery+" order by od.record_date";

	try
	{
		AdminConnSubscriptions adminConn = AdminConnSubscriptions.getInstance();
		cn = adminConn.getConnection();
		pstmt=cn.prepareStatement(selectQuery);
		rs=pstmt.executeQuery();
		//out.println(selectQuery);
	}
	catch(Exception ee)
	{
		out.println("ERROR"+ee.toString());
	}

	try
	{
	if(reportType.equals("excel")){
	  response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-disposition","attachment;filename=ConclaveReport.xls");	
		
	 }
	}
	catch(Exception e){}
%>
	<BODY>
	<P>
	<table width="686" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	<tr><td  bgcolor=blue></td><th><h3>ORDER REPORT<h3></th><td  bgcolor=blue></td></tr>
	<tr><td  bgcolor=blue></td><td bgcolor=blue><font size=4 color=white>ORDER REPORT RESULT</font></td><td  bgcolor=blue></td></tr>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	</table>
<P>
	<table WIDTH="100%" cellspacing="0" cellpadding="3" border="1" bordercolorlight="#999999" bordercolordark="#ffffff">
<%
	
	out.println("<tr><th colspan=18> From "+day1+"-"+month1+"-"+year1+"  To "+day2+"-"+month2+"-"+year2+" </th></tr><tr></tr>");

%>

			<tr>
			<th bgcolor="blue">SL. No</th>
			<th bgcolor="blue"><font size=3 color=white>fname</font></th>
			<th bgcolor="blue"><font size=3 color=white>Email</font></th>
			<th bgcolor="blue"><font size=3 color=white>Phone No</font></th>
			<th bgcolor="blue"><font size=3 color=white>Company</font></th>
			<th bgcolor="blue"><font size=3 color=white>Designation</font></th>
			<th bgcolor="blue"><font size=3 color=white>su.record_date</font></th>
			<th bgcolor="blue"><font size=3 color=white>bill_address_line1</font></th>
			<th bgcolor="blue"><font size=3 color=white>bill_city</font></th>
			<th bgcolor="blue"><font size=3 color=white>bill_address</font></th>
			<th bgcolor="blue"><font size=3 color=white>bill_country</font></th>
			<th bgcolor="blue"><font size=3 color=white>order_id</font></th>
			<th bgcolor="blue"><font size=3 color=white>payment_mode</font></th>
			<th bgcolor="blue"><font size=3 color=white>payment_status</font></th>
			<th bgcolor="blue"><font size=3 color=white>payment</font></th>
			<th bgcolor="blue"><font size=3 color=white>shipping_name</font></th>
			<th bgcolor="blue"><font size=3 color=white>shipping_address</font></th>
					<th bgcolor="blue"><font size=3 color=white>shipping_city</font></th>
			<th bgcolor="blue"><font size=3 color=white>shipping_state</font></th>
			<th bgcolor="blue"><font size=3 color=white>shipping_country</font></th>
            <th bgcolor="blue"><font size=3 color=white>Photo Id Details</font></th>
			
	
</tr>

<%
	
	while(rs.next())
	{
			i++;
%>
			<tr valign="top" <%if(rs.getString("payment_status").equals("REALIZED")){%>bgcolor="yellow"<%}else{}%>>
			<td><%=i%></td>
			<td><%=rs.getString("fname")%>&nbsp;</td>
			<td><%=rs.getString("email_id")%>&nbsp;</td>
			<td><%=rs.getString("phone")%>&nbsp;</td>
			<td><%=rs.getString("user_profession")%>&nbsp;</td>
			<td><%=rs.getString("user_designation")%>&nbsp;</td>
			<td><%=rs.getString("record_date")%>&nbsp;</td>
			<td><%=rs.getString("bill_address_line1")%>&nbsp;</td>
			<td><%=rs.getString("bill_country")%>&nbsp;</td>
			<td><%=rs.getString("bill_city")%>&nbsp;</td>
			<td><%=rs.getString("bill_state")%>&nbsp;</td>
			<td><%="CTT-WEB-"+rs.getString("order_id")%>&nbsp;</td>
			<td><%=rs.getString("payment_mode")%>&nbsp;</td>
			<td ><%=rs.getString("payment_status")%>&nbsp;</td>
			<td><%=rs.getString("payment")%>&nbsp;</td>
			<td><%=rs.getString("shipping_name")%>&nbsp;</td>
			<td><%=rs.getString("shipping_address")%>&nbsp;</td>
			<td><%=rs.getString("shipping_city")%>&nbsp;</td>
			<td><%=rs.getString("shipping_state")%>&nbsp;</td>
			<td><%=rs.getString("shipping_country")%>&nbsp;</td>
            <td><%=rs.getString("user_comment")%>&nbsp;</td>
			</tr>
<%
		}
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
<%
if(i<1)
{%>
<tr>
			<th bgcolor="blue" colspan="14"><font color="white" align="center"><h2>Searched found no result.</h2></font></th>
			
			
	
</tr>
<%}%>
</table>
</BODY>