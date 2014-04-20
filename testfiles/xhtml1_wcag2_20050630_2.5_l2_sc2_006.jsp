<%@ page language="java" contentType="text/html; charset=utf-8" %><%@
  page import="java.io.File" %><%@
  page import="java.util.*" %><%
boolean errorFirstNameEmpty = false;
boolean errorSurnameEmpty = false;
boolean errorEmailEmpty = false;
boolean errorEmailInvalid = false;
boolean errorDepartureMonth = false;
boolean errorDepartureDay = false;
boolean errorDepartureYear = false;
boolean submitted = "Submit".equals(request.getParameter("submit"));
if (submitted)
{
  errorFirstNameEmpty = "".equals(request.getParameter("firstName"));
  errorSurnameEmpty = "".equals(request.getParameter("surname"));
  errorEmailEmpty = "".equals(request.getParameter("email"));
  if (!errorEmailEmpty)
  {
    errorEmailInvalid = !request.getParameter("email").matches("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");
  }
  try
  {
    int mm = Integer.parseInt(request.getParameter("departureMonth"));
    if ((mm < 1) || (mm > 12))
    {
      errorDepartureDay = true;
    }
  }
  catch (NumberFormatException e)
  {
    errorDepartureMonth = true;
  }
  try
  {
    int dd = Integer.parseInt(request.getParameter("departureDay"));
    if ((dd < 1) || (dd > 31))
    {
      errorDepartureDay = true;
    }
  }
  catch (NumberFormatException e)
  {
    errorDepartureDay = true;
  }
  try
  {
    int yyyy = Integer.parseInt(request.getParameter("departureYear"));
    if (yyyy < 2006)
    {
      errorDepartureYear = true;
    }
  }
  catch (NumberFormatException e)
  {
    errorDepartureYear = true;
  }
}
boolean errorEmail = errorEmailEmpty | errorEmailInvalid;
boolean errorDeparture = errorDepartureMonth | errorDepartureDay | errorDepartureYear;
boolean errors = errorFirstNameEmpty | errorSurnameEmpty | errorEmail | errorDeparture;
if (submitted && !errors)
{
  %><jsp:forward page="xhtml1_wcag2_20050630_2.5_l2_sc2_005-1.html" /><%
}
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/dtd/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
  <head>
    <title><% if (errors) { %>Error in <% } %>Test for error messages</title>
    <style type="text/css">
html {
  color: #000;
  background: #fff
}
.error {
  color: #f00;
}
th, td {
  vertical-align: top
}
th {
  font-weight: normal;
  text-align: left
}
tr.error th, tr.error td {
  padding-top: 1em
}
tr.error p {
  margin: 0 0 .5em 0
}
div {
  margin-top: 1em
}
    </style>
  </head>
  <body><% if (errors) { %>
    <p class="error">Not all of your input could be accepted. Fields that need corrections are marked with <strong>**</strong>.</p><% } %>
    <form action="xhtml1_wcag2_20050630_2.5_l2_sc2_006.jsp" method="post">
      <p>Mandatory fields are marked with <strong>*</strong>.</p>

      <table>
        <tbody><%
if (errorFirstNameEmpty)
{
%>
          <tr class="error"><th>Error:</th><td><p>First name must not be empty.</p></td></tr><%
}
%>
          <tr><th><%
if (errorFirstNameEmpty)
{
              %><strong>**</strong> <%
}
              %><label for="firstName">First name <strong>*</strong></label></th><td><input id="firstName" name="firstName" value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>" /></td></tr><%
if (errorSurnameEmpty)
{
%>
          <tr class="error"><th>Error:</th><td><p>Surname must not be empty.</p></td></tr><%
}
%>
          <tr><th><%
if (errorSurnameEmpty)
{
              %><strong>**</strong> <%
}
              %><label for="surname">Surname <strong>*</strong></label></th><td><input id="surname" name="surname" value="<%= request.getParameter("surname") != null ? request.getParameter("surname") : "" %>" /></td></tr>
          <tr><th><label for="profession">Profession</label></th><td><input id="profession" name="profession" value="<%= request.getParameter("profession") != null ? request.getParameter("profession") : "" %>" /></td></tr><%
if (errorEmail)
{
%>
          <tr class="error"><th>Error:</th><td><%
  if (errorEmailEmpty)
  {
            %><p>Email address must not be empty.</p><%
  }
  if (errorEmailInvalid)
  {
            %><p>Email address is not valid.</p><%
  }
          %></td></tr><%
}
%>
          <tr><th><%
if (errorEmail)
{
              %><strong>**</strong> <%
}
              %><label for="email">Email address <strong>*</strong></label></th><td><input id="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" /></td></tr>
          <tr><th><label for="destination">Destination <strong>*</strong></label></th><%
String destination = request.getParameter("destination");
            %><td><select id="destination" name="destination"><option value="d1"<% if ((destination == null) || "d1".equals(destination)) { %> selected="selected"<% } %>>London</option><option value="d2"<% if ("d2".equals(destination)) { %> selected="selected"<% } %>>Paris</option><option value="d3"<% if ("d3".equals(destination)) { %> selected="selected"<% } %>>Brussels</option></select></td></tr><%
if (errorDeparture)
{
%>
          <tr class="error"><th>Error:</th><td><%
  if (errorDepartureMonth)
  {
            %><p>Month (MM) must be a number between 1 and 12.</p><%
  }
  if (errorDepartureDay)
  {
            %><p>Day (DD) must be a number between 1 and 31.</p><%
  }
  if (errorDepartureYear)
  {
            %><p>Year (YYYY) must be 2006 or later.</p><%
  }
          %></td></tr><%
}
%>
          <tr><th><%
if (errorDeparture)
{
              %><strong>**</strong> <%
}
              %>Departure date <strong>*</strong></th><td><label for="departureMonth">MM</label>-<label for="departureDay">DD</label>-<label for="departureYear">YYYY</label> <input id="departureMonth" name="departureMonth" size="2" maxlength="2" value="<%= request.getParameter("departureMonth") != null ? request.getParameter("departureMonth") : "" %>" />-<input id="departureDay" name="departureDay" size="2" maxlength="2" value="<%= request.getParameter("departureDay") != null ? request.getParameter("departureDay") : "" %>" />-<input id="departureYear" name="departureYear" size="4" maxlength="4" value="<%= request.getParameter("departureYear") != null ? request.getParameter("departureYear") : "" %>" /></td></tr>
        </tbody>
      </table>
      <div><input type="submit" name="submit" value="Submit" /></div>
    </form>
  </body>
</html>
