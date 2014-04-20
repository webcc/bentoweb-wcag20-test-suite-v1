<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title> Help avoid mistakes and make it easy to correct them</title>
       <style type="text/css">
		  .error { 
			  background-color: #FAFAD2;
			  color: 	#EE0000;
			  margin: 0em;
			  padding: 1em;
			  border: 1px dashed #EE0000;
			  font-weight: bold;
		  }
    </style>
  </head>
  <body>
    <p>
    <%
    if ((request.getMethod()=="POST") && (request.getParameter("username")!=""))
        out.println("<div><span class='error'>Error: The username is stored, but the password does not match</span></div>");
    %>
    </p>
    <p>
    Please, enter username and password.
    </p>
    <form method="post" action="xhtml1_wcag2_20050630_2.5_l2_sc2_001.jsp">
	<label for="id1">username </label><input type="text" name="username" id="id1" value="" /><br />
	<label for="id2">password </label><input type="password" name="pass" id="id2" value="" /><br />
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