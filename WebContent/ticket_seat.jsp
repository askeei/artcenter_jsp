<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="controller.*, java.sql.*, main.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<title>CSS seat booking</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>

<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/ticket.css">

<script src="https://code.jquery.com/jquery-git.min.js"></script>

<script language="javascript" type="text/javascript">
$(document).ready(function(){
	   $('input[name="check"]').click(function() {
	       if ($(this).prop('checked')) {
	    	   opener.check = $(this).val();
	    	   opener.document.joinForm.check.value = $(this).val();
	    	   opener.document.joinForm.seat.value = $(this).val();
	    	   alert($(this).val()+" 좌석을 선택하셨습니다!");
				setParentText();
	       }
	   });
	});

	function setParentText(){
		var i;
		
		//opener.check = document.getElementsByName("check");
		opener.con = true;
		window.close();
	}
	
</script>

</head>
<body>
<form name=joinForm2 >
		<div class="plane">
			<div class="exit exit--front fuselage"></div>
			<ol class="cabin fuselage">
				<%
					request.setCharacterEncoding("euc-kr");

					int pno = Integer.parseInt(request.getParameter("pno"));
					String dd = request.getParameter("dd");

					int[] rsaNum = new TicketController().showSeats(pno);
					int[] reserve = new int[3];

					char[] rsa = { 'R', 'S', 'A' };

					int index = 0;
					for (int[] a : SystemController.pDao.reseveSeats(rsaNum, dd)) {
				%>
				<li class="row row--1">
					<ol class="seats" type="A" style="text-align: center">
						<%
							for (int i = 0; i < a.length; i++) {
						%>
						<%
							if (a[i] == 1) {
						%>
						<li class="seat"><input name="check" type="checkbox"
							id="<%=rsa[index] + "" + (i + 1)%>"
							value="<%=rsa[index] + "" + (i + 1)%>" disabled /> <label
							for="<%=rsa[index] + "" + (i + 1)%>">&nbsp;&nbsp;<%=rsa[index] + "" + (i + 1)%>&nbsp;&nbsp;
						</label></li>
						<%
							} else {
						%>
						<li class="seat"><input name="check" type="checkbox"
							id="<%=rsa[index] + "" + (i + 1)%>"
							value="<%=rsa[index] + "" + (i + 1)%>" onChecked/> <label
							for="<%=rsa[index] + "" + (i + 1)%>">&nbsp;&nbsp;<%=rsa[index] + "" + (i + 1)%>&nbsp;&nbsp;
						</label></li>

						<%
							}
								}
								index++;
						%>
					</ol>
				</li>
				<%
					}
				%>

			</ol>
		</div>
		</form>
</body>
</html>