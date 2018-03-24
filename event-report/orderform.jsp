<%@ page session="true" %>
<%String active=""+session.getAttribute("UserActive");
//out.print(active);
	if(active.equals("null"))
	{
		response.sendRedirect("Login.jsp");
	}
%>	
	<script language = "javascript"> 
	function startingDate()   
	{	
		var startDate = new Date();
		var Day = startDate.getDate();
		var Month = startDate.getMonth();
		var Year = startDate.getFullYear(); 
		var newMonth = Month + 1;
	       
		document.Merchant.Start_Day.value = Day;
		document.Merchant.Start_Month.value = newMonth;
		document.Merchant.Start_Year.value = Year;
		document.Merchant.Ending_Day.value = Day;
		document.Merchant.Ending_Month.value = newMonth;
		document.Merchant.Ending_Year.value = Year;      
	}   
	
	function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "April" || WhichMonth == "June" || WhichMonth == "September" || WhichMonth == "November") DaysInMonth = 30;
  if (WhichMonth == "February" && (WhichYear/4) != Math.floor(WhichYear/4))	DaysInMonth = 28;
  if (WhichMonth == "February" && (WhichYear/4) == Math.floor(WhichYear/4))	DaysInMonth = 29;
  return DaysInMonth;
}

function ChangeOptionDays(Which)
{
  var todaydate = new Date();

var Day1 = todaydate.getDate();
var Month1 = todaydate.getMonth();
var Year1 = todaydate.getFullYear(); 
		
  DaysObject = eval("document.Merchant." + Which + "Day");
  MonthObject = eval("document.Merchant." + Which + "Month");
  YearObject = eval("document.Merchant." + Which + "Year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;

  DaysForThisSelection = DaysInMonth(Month, Year);
 // alert("DaysForThisSelection :"+DaysForThisSelection);
  CurrentDaysInSelection = DaysObject.length;
 // alert("CurrentDaysInSelection :"+CurrentDaysInSelection);
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
  
}


	</script>

	<BODY  onLoad = "startingDate()">
	<P>&nbsp;</P><P>&nbsp;</P>
	<table width="686" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor=lightblue bordercolor=blue>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	<tr><td  bgcolor=blue></td>
    <th><h3>ORDER REPORT<h3></th>
    <td  bgcolor=blue></td></tr>
	<tr><td  bgcolor=blue></td><td bgcolor=blue><font size=4 color=white>ORDER REPORT FROM</font></td><td  bgcolor=blue></td></tr>
	<tr valign="top" align="center" ><td  bgcolor=blue colspan=3></td></tr>
	</table>
<P>&nbsp;</P>
	<form name="Merchant" method="post" action="orderresult.jsp">
	<table width="386" border="0" cellspacing="2" cellpadding="1" align="center" >
	<tr> 
	<td> 
	<table width="381" border="1" cellspacing="0" cellpadding="0" align="right" height="105" bordercolor=blue>
	<tr> 
	<td  width="97" ><font  size="3">From Date</font></td>
	<td width="64" > 
	<div align="center"> 
	<select name="Start_Day" id="Start_Day" size="1" onChange="ChangeOptionDays('Start_')">
	<script>
	var startDate = new Date();
	var Month = startDate.getMonth()+1;
	var Year = startDate.getFullYear();
	for(j=1;j<=31;j++){
	
	if(Month==2 && Year%4==0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==29)break;
	continue;
	}
	if(Month==2 && Year%4!=0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==28)break;
	continue;
	}
	if(Month==9 || Month==4 ||Month==6 || Month==11){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==30)break;
	continue;
	}
	document.writeln("<option value="+j+">"+j+"</option>");

	}

	</script></select>
	</div>
	</td>

	<td width="104" > 
	<div align="center"> 
	<select name="Start_Month"  id="Start_Month" size="1" onChange="ChangeOptionDays('Start_')">
	<option value="1">January </option>
	<option value="2">February </option>
	<option value="3">March </option>
	<option value="4">April </option>
	<option value="5">May </option>

	<option value="6">June </option>
	<option value="7">July </option>
	<option value="8">August</option> 
	<option value="9">September</option> 
	<option value="10">October </option>
	<option value="11">November</option> 
	<option value="12">December</option> 
	</select>

	</div>
	</td>
	<td width="82" > 
	<div align="center">&nbsp; 
	<select name="Start_Year" id="Start_Year"  onchange="ChangeOptionDays('Start_')">
	<option value="2012"> 2012 </option>
	    <option value="2013"> 2013 </option>
 <option value="2014"> 2014 </option>
  <option value="2015"> 2015 </option>
            <option value="2016"> 2016 </option>
			<option value="2017"> 2017 </option>

	</select>
	</div>
	</td>
	</tr>

	<tr> 
	<td  width="97" ><font  size="3">End Date</font></td>
	<td width="64" > 
	<div align="center"> 
	<select name="Ending_Day" id="Ending_Day" size="1" onChange="ChangeOptionDays('Ending_')">
	<script>
	var startDate = new Date();
	var Month = startDate.getMonth()+1;
	var Year = startDate.getFullYear();
	for(j=1;j<=31;j++){
	
	if(Month==2 && Year%4==0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==29)break;
	continue;
	}
	if(Month==2 && Year%4!=0){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==28)break;
	continue;
	}
	if(Month==9 || Month==4 ||Month==6 || Month==11){
	document.writeln("<option value="+j+">"+j+"</option>");
	if(j==30)break;
	continue;
	}
	document.writeln("<option value="+j+">"+j+"</option>");

	}

	</script></select>
	</div>
	</td>

	<td width="104" > 
	<div align="center"> 
	<select name="Ending_Month"  id="Ending_Month" size="1" onChange="ChangeOptionDays('Ending_')">
	<option value="1">January </option>
	<option value="2">February </option>
	<option value="3">March </option>
	<option value="4">April </option>
	<option value="5">May </option>

	<option value="6">June </option>
	<option value="7">July </option>
	<option value="8">August</option> 
	<option value="9">September</option> 
	<option value="10">October </option>
	<option value="11">November</option> 
	<option value="12">December</option> 
	</select>

	</div>
	</td>
	<td width="82" > 
	<div align="center">&nbsp; 
	<select name="Ending_Year" id="Ending_Year"  onchange="ChangeOptionDays('Ending_')">
	<option value="2012"> 2012 </option>
	 <option value="2013"> 2013 </option>
 <option value="2014"> 2014 </option>
  <option value="2015"> 2015 </option>
            <option value="2016"> 2016 </option>
			<option value="2017"> 2017 </option>

	</select>
	</div>
	</td>
	</tr><tr valign="top" align="center"> 
	<td colspan="4" height="29"><b>Payment Status</B></td></tr>
	<tr valign="top" align="center"> 
	<td colspan="1" height="29"> <input type="radio" name="orderstatus" value="all" checked></td><td colspan="3" height="29" ><font  size="3">All Orders</font> </td></tr>
<tr valign="top" align="center">  <td colspan="1" height="29"> <input type="radio" name="orderstatus" value="Paygot" ></td><td colspan="3" height="29"><font  size="3">Payment Received</font></td></tr>
<tr valign="top" align="center">  <td colspan="1" height="29"> <input type="radio" name="orderstatus" value="Paynot" ></td><td colspan="3" height="29"><font  size="3">Payment Pending</font></td></tr>
	</tr>
	<tr valign="top" align="center"> 
	<td colspan="4" height="29"><b>Payment Type</B></td></tr>
	<!--
	<tr valign="top" align="center"> 
	<td colspan="1" height="29"> <input type="radio" name="paytype" value="all" checked></td><td colspan="3" height="29" ><font  size="3">All Orders</font> </td></tr>
	-->
<tr valign="top" align="center">  <td colspan="1" height="29"> <input type="radio" name="payType" value="online" checked ></td><td colspan="3" height="29"><font  size="3">Online Payment</font></td></tr>
<!--<tr valign="top" align="center">  <td colspan="1" height="29"> <input type="radio" name="payType" value="offline" ></td><td colspan="3" height="29"><font  size="3">Offline Payment</font></td></tr>-->

	</tr>
	<tr valign="top" align="center" bgcolor=lightblue> 
	<td colspan="1" height="29"> Excel</td><td colspan="1" height="29"> <input type=checkbox name=reportType value="excel"></td></tr>
	</table>
	</td>
	</tr>
	</tr>
	
	<tr valign="top" align="center"> 
	<td colspan="4" height="29"> <input type="submit" name="Submit" value="Submit" ></td></tr>
	</table>
	</td>
	</tr>
	</table>

	<P>&nbsp;</P>
	<P>&nbsp;</P>
	<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	</P>
	<P> </P>
	</FORM>	
	</BODY></HTML>
	