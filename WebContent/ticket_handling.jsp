<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controller.*, DTO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = session.getAttribute("id").toString();
	int pno = Integer.parseInt(request.getParameter("pno"));
	String date = request.getParameter("day");
	String seat = request.getParameter("check");
	
	TicketDTO t = new TicketDTO();
	t.setId(id);
	t.setPno(pno);
	t.setSeat(seat);
	t.setTdate(date);

	String msg = null;
	if(SystemController.tDao.ticketingRegist(t))
		msg="ticketing.jsp?msg=1&pno="+pno;
	else
		msg="ticketing.jsp?msg=0&pno="+pno;
	
	response.sendRedirect(msg);
%>
</body>
</html>