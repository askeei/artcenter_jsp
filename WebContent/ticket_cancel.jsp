<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controller.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>티켓 예매 취소</title>
</head>
<body>
<%
	String id = session.getAttribute("id").toString();
	int tno = Integer.parseInt(request.getParameter("tno"));
	
	if(SystemController.tDao.cancelTicket(id, tno))
		response.sendRedirect("ticket_list.jsp");
	else
		response.sendRedirect("ticket_list.jsp?msg=1"+tno);
%>
</body>
</html>