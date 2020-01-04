<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, main.*, DAO.*, controller.*, DTO.*, java.util.Vector, 
    java.text.SimpleDateFormat, java.util.Date, java.util.Locale "%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="author" content="Seok Kyung An">

  <title>예술의 전당</title>

  <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="/artcenter/images/sac_ci_favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="/artcenter/plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="/artcenter/plugins/bootstrap/css/bootstrap.min.css">

  <link rel="stylesheet" type="text/css" href="/artcenter/plugins/slick-carousel/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="/artcenter/plugins/slick-carousel/slick/slick-theme.css"/>
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="/artcenter/css/style.css">
  <script src="https://code.jquery.com/jquery-git.min.js"></script>
  
  <style>
  
   .category-box {
    width: 48%;
    display: inline-block;
    margin: 4px;
    }
  
  </style>
  
  <script type="text/javascript">
  $(document).ready(function(){
	  document.joinForm.day.focus();
	});
  
  var dd;
  var openWin;
  var con;
  var check = false;
  var i;
  
        function openChild(pno, dd)
        {
        	window.name = "parentForm";
        	url = "ticket_seat.jsp?pno=" + pno + "&dd=" + document.joinForm.day.value;
        	openWin = window.open(url,"childForm", "left="+(screen.availWidth-500)/2 + ",top="+(screen.availHeight-300)/2 + ", width=500px,height=400px");
        
        }
		function call(){
			if(con != true){
				alert('좌석을 선택해주세요!');
				return false;
			}

			return true;
		}

    </script>
</head>

<body id="body">

<%@include file="top.jsp" %>

<section class="page-header" style="padding-top:300px;margin-top:0px">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">티켓 에매</h1>
					<ol class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">티켓 예매</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="about section-sm mt100" id="about">
<div class="container">
			<%
				request.setCharacterEncoding("euc-kr");
				int pno = Integer.parseInt(request.getParameter("pno"));
				OpenPerformanceDTO tmp = SystemController.pDao.memberInquiryOpenPerformance(pno);

				String img = "'/artcenter/images/" + tmp.getName() + ".png'";
				PerformanceDTO pf = new PerformanceDTO();
				pf = SystemController.pDao.inquiryPerformance(tmp.getName());
				
				String msg = request.getParameter("msg");
				
				if(msg == null){
				
				out.print("<div class='row mb-50 justify-content-center'>");
				out.print("<div class='col-md-5 col-sm-12 text-center offset-md-1'>");
				out.print("<ul><li><img src=" + img + " class='img-fluid rounded shadow' alt=''></li>");
				out.print("</div>");

				out.print("<div class='col-md-5 col-sm-12'><div class='content' style='margin-top: -15px;'>");
				out.print("<h2>" + tmp.getName() + "</h2>");
				out.print("<table class='perfor_info mt80'>");
				out.print("<thead></thead><tfoot></tfoot><tbody>");
				out.print(tmp);
				%>
				<tr>
				<th>장르</th>
				<td><%=pf.getType() %></td>
			</tr>
			<tr>
				<th>상영시간</th>
				<td><%=pf.getTime() %>분</td>
			</tr>
				
				<%
				out.print("</tbody></table></div></div></div>");
				out.print("<hr>");
				
				Date d = new Date();
				
				SimpleDateFormat today = new SimpleDateFormat(); 
				today = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA); 
				today.format(d);
				
			%>
			
			
			
			<form name="joinForm" method="post" action="ticket_handling.jsp?pno=<%=pno %>" role="form" onsubmit="return call()">
						<div class="form-group">
							<ul class="join_list">
								<li class="ticket_field">날짜를 선택해주세요 >></li>
								<li class="ticket_input">
									<div class="input-group subscription-form">
									<input type="date" id="day" name="day" value="<%=today.format(d) %>" min="<%=today.format(d) %>" max="<%=tmp.getEdate()%>">
									</div>
								</li>
							</ul>
						</div>
						
						<div class="form-group">
							<ul class="join_list">
								<li class="ticket_field">좌석을 선택해주세요 >></li>
								<li class="ticket_input"><input type="button" value="좌석선택" class="form-control" name="seat" onclick="openChild(<%=tmp.getPno() %>)" ></li>
								<input type="hidden" name="check" >
							</ul>
						</div>

				<div id="cf-submit" class="text_right">
							<input type="submit" id="contact-submit" class="btn btn-main btn-large btn-round-full" value="예매하기">
						</div>						
						
					</form>
					
					<% 
				} else {
					if(msg.equals("1")){
						out.println("<center><h2> ☆★ 티켓이 예매가 되었습니다 ★☆ </h2></center>");
					}
					else{
						out.println("<center><h2> 다시 예매해주세요! </h2></center>");
					}
				}
				
				%>
	</div>
</section>   <!-- End section -->


<%@include file="bottom.jsp" %>

    <!-- 
    Essential Scripts
    =====================================-->
    

    <!-- Main jQuery -->
    <script src="https://code.jquery.com/jquery-git.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="/artcenter/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="/artcenter/plugins/instafeed.js/instafeed.min.js"></script>
    <!-- Slick Carousel -->
    <script src="/artcenter/plugins/slick-carousel/slick/slick.min.js"></script>
    <!-- Google Map js -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBItRd4sQ_aXlQG_fvEzsxvuYyaWnJKETk&callback=initMap"></script>

    <!-- Main Js File -->
    <script src="/artcenter/js/script.js"></script>
    
  </body>
  </html>