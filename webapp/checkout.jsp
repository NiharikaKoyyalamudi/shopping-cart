<%@ page import="java.util.List" %>
<%@ page import="mvc.products" %>

<%
double totalBill = (double) request.getSession().getAttribute("totalBill");
%>

<h2>Total Bill: $<%= totalBill %></h2>
