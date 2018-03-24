<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="conn.*" %>
<%
Statement stmt =null;
ResultSet rs =null;
Connection cn = null; 
try
{

	String u_name= request.getParameter("TR_u_name");
	String pass =request.getParameter("TR_pass");
	String igologin =request.getParameter("igologin");
		
	if(igologin!=null)
	{
		if(!u_name.equals("") && !pass.equals(""))
		{
			session.putValue("UserActive","1");
			String active=""+session.getAttribute("UserActive");
			String selectQuery=null;
			if(active.equals("null"))
			{
				response.sendRedirect("Login_TT.jsp");
			}
		
			selectQuery="SELECT * FROM subscribe.employee WHERE STATUS='ACTIVE' AND UNAME='"+u_name+"' AND PWD='"+pass+"'";
					
	try
	{
			AdminConnSubscriptions adminConn = AdminConnSubscriptions.getInstance();
			cn = adminConn.getConnection();
			stmt=cn.createStatement();
			rs=stmt.executeQuery(selectQuery);
			if(rs.next())
			{
				response.sendRedirect("orderform_TT.jsp");	
			}
			
	}

	catch(Exception ee)
	{
		
	}
		}
		
	}
		
}catch(Exception ex)
{
	out.print("DD"+ex);
}
finally
{
	try
	{
		if(rs != null)
			rs.close();
		if(stmt != null)
			stmt.close();
		if (cn != null)
			cn.close();
	}

	catch(Exception ex)
	{
		out.print("Error:"+ex.toString());
	}

}	
%>



<html>
<head>
<title>India Today</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.Role {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; text-decoration: none}
.navi {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; text-decoration: none}
-->
</style>
<script language="javascript">
/*function check_form()
{
	if(validate(document.myloginform))
		return true;
	else
		return false;
}*/


function check_form()
{
	if(document.myloginform.TR_u_name.value=="")
	{
		alert("Please enter user name!")
		document.myloginform.TR_u_name.focus();
		return false;
	}
	
	if(document.myloginform.TR_pass.value=="")
	{
		alert("Please enter password !")
		document.myloginform.TR_pass.focus();
		return false;
	}


}
function focusDefault()
{
	document.forms[0].TR_u_name.focus();
}
</script>
</head>

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="focusDefault()">

<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">

  <tr align="center" bgcolor="black"> 
    <td colspan="3"><font color="#CC0000">

    <h3><font size="+5"
	>Report</font></h3>
    </font></td>
</tr>
<tr align="center"> 
    <td colspan="3" >&nbsp; </td>
  </tr>

</table>
<FORM action="Login_TT.jsp" method= "post" name = "myloginform" onsubmit = "return check_form()">
	  
  <table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>

          <td>&nbsp;</td>
        </tr>
        <!--<tr> 
          <td><img src="images/stories.gif" width="117" height="31"></td>
        </tr>-->
         
          <td width="100%"> 
            <table cellspacing=1 cellpadding=4 width="100%">
              <tbody> 
              <tr > 
                <td align="center" colspan=2>
				<span class="navi">
			 <table>

									<TR>
						<TD class="navi" colSpan = "2"><font color="#FFFFFF"><B>LOG-IN</B></font></TD>
					</TR>
					<TR>
						<TD class="navi"><font color="black"><b>User name:</b></font></TD>
						<TD>
							<INPUT maxLength = "16" name = "TR_u_name" size = "16">
						</TD>

					 </TR>
					 <TR>
						<TD vAlign = "top" class="navi"><font color="black"><b>Password:</b></font></TD>
						<TD><INPUT maxLength = "16" name = "TR_pass" size = "16" type = "password">
						</TD>
					</TR>
					
					<TR>
						<TD colspan="2">
						<IMG alt="" border=0 height=3 src="" width=1><BR>
						<INPUT type = "submit" value = "Log-in..." name="igologin"> 
						</TD>
					</TR>
					</table>
                </td>
              </tr>
              </tr>
              </tbody> 
            </table>

          </td>
        
      </table>
    <td width="25" >&nbsp;</td>
  <tr> 
    <td width="140" bgcolor="#828282">&nbsp;</td>
    <td width="540" bgcolor="#828282">&nbsp;</td>
    <td width="25" bgcolor="#828282">&nbsp;</td>
  </tr>
</FORM>
</body>

</html>
