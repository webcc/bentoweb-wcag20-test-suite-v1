<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@
    page import="java.util.*"
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title> Help avoid mistakes and make it easy to correct them</title>
        <style type="text/css">
		  .error { 
			  background-color: #FAFAD2;
			  color: 	#EE0000;
			  margin: 0em;
			  padding: 0.5em;
			  border: 1px dashed #EE0000;
			  font-weight: bold;
			  width: 18em;
		  }
		  ul {
			  margin:  0em 0em 0em 0em;
			  padding: 0.5em 0em 0.5em 1.5em;
		  }
    </style>
  </head>
  <body>
    <p><%
    if (request.getMethod()=="POST") {
    if ((request.getParameter("month")!="")&&(request.getParameter("day")!="")&&(request.getParameter("year")!="")) {
        String strOut="<ul>";
        int month=0;
        int day=0;
        int year=0;
        boolean err = false;
        
        try {
            month = Integer.parseInt(request.getParameter("month"));
            if ((month<1)||(month>12)) {
                strOut+=("<li>'month' must lie between 1 and 12</li>");
                err=true;
            }
        } catch (NumberFormatException e) {
             strOut+=("<li>'month' seems not to be a number</li>");
             err=true;
        }
        
       try {
            day = Integer.parseInt(request.getParameter("day"));
       } catch (NumberFormatException e) {
            strOut+=("<li>'day' seems not to be a number</li>");
            err=true;
       }
       
       try {
            year = Integer.parseInt(request.getParameter("year"));
            if ((year<1900)||(year>2999)) {
                strOut+=("<li>'year' must lie between 1900 and 2099</li>");
                err=true;
            }
       } catch (NumberFormatException e) {
            strOut+=("<li>'year' seems not to be a number</li>");
            err=true;
       }

       GregorianCalendar gc = new GregorianCalendar(year, (month-1), day);
       if (day<gc.getActualMinimum(Calendar.DAY_OF_MONTH)||day>gc.getActualMaximum(Calendar.DAY_OF_MONTH)) {
            strOut+=("<li>'day' must lie between "+gc.getActualMinimum(Calendar.DAY_OF_MONTH)+" and "+gc.getActualMaximum(Calendar.DAY_OF_MONTH)+"</li>");
            err=true;
       }

        if (err)
            out.println("<div class='error'>Error: Please, check the <a href='#did'>date</a> field."+strOut+"</ul></div>");

    } else {
      out.println("<div class='error'>Error:Please, check the <a href='#did'>date</a> field. <ul><li> Date is incomplete</li></ul></div>");
    }
    }  //if POST
    
    %></p>
    <p>Fields marked with '*' must be filled in.</p>
    <form method="post" action="xhtml1_wcag2_20050630_2.5_l2_sc2_003.jsp">
    <span id="did">date*:</span>
    <label for="id1">MM-</label><label for="id2">DD-</label><label for="id3">YYYY</label>
	<input type="text" name="month" id="id1" size="1" maxlength="2" value="<%= (request.getMethod()=="POST")?request.getParameter("month"):"" %>" />-
    <input type="text" name="day" id="id2" size="1" maxlength="2" value="<%= (request.getMethod()=="POST")?request.getParameter("day"):""%>" />-
    <input type="text" name="year" id="id3" size="2" maxlength="4" value="<%= (request.getMethod()=="POST")?request.getParameter("year"):""%>" /><br />
    ...<br/>
	<input type="submit" value="submit" />
	</form>
  </body>

<!--
 Copyright &#169; BenToWeb Consortium 2004-2007

 Licensed under the BenToWeb License, Version 1.0 (the "License"); you may
 not use this file except in compliance with the License. You may obtain
 a copy of the License at http://bentoweb.org/refs/LICENSE.html

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
</html>
