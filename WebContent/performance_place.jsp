<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, main.*, DAO.*, controller.*, DTO.*, java.util.Vector"%>

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
  <link rel="shortcut icon" type="image/x-icon" href="images/sac_ci_favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">

  <link rel="stylesheet" type="text/css" href="plugins/slick-carousel/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="plugins/slick-carousel/slick/slick-theme.css"/>
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
  <script src="https://code.jquery.com/jquery-git.min.js"></script>
  <style>
  
   .category-box {
    width: 48%;
    display: inline-block;
    margin: 4px;
    }
  
  </style>
  <script>
	function openPlace(placeName) {
	    var i;
	    
	    var x = document.getElementsByClassName("place");
	    for (i = 0; i < x.length; i++) {
	       x[i].style.display = "none";  
	    }
	    document.getElementById(placeName).style.display = "block";  
	}
  </script>
</head>

<body id="body">

<%@include file="top.jsp" %>

<section class="page-header sub_page" style="padding-top:300px;margin-top:0px">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">공연장조회</h1>
					<ol class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">공연장조회</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="about section-sm mt100" id="about">
	<div class="container">
		<div class="row mb-50 justify-content-center">
		
			<div class="performance_place col-sm-12">
				<div class="content">
					<ul class="place_link">
					<%
					Vector<StagePerformanceDTO> data = SystemController.pDao.totalInquiryStagePerformance();
					for(int i =0; i<data.size();i+=1){
						if( i== 0){
							out.print("<li><a href='#place_title' class='defaultOpen' onclick="+" 'openPlace(\""+data.get(i).getPlace()+"\")'>"+data.get(i).getPlace()+"</a></li>");
						}else{
							out.print("<li><a href='#place_title' onclick="+" 'openPlace(\""+data.get(i).getPlace()+"\")'>"+data.get(i).getPlace()+"</a></li>");
						}
					}
					//for(StagePerformanceDTO stage:SystemController.pDao.totalInquiryStagePerformance()){
					//	out.print("<li><a href='#place_title' class='deafultOpen' onclick="+" 'openPlace(\""+stage.getPlace()+"\")'>"+stage.getPlace()+"</a></li>");
					//}
					%>
						
						
					</ul>
				</div>
			</div> 	
	
		</div>
</section>   <!-- End section -->



		
	<%  
		
   		request.setCharacterEncoding("euc-kr");
			
		//StagePerformanceDTO tmp = SystemController.pDao.inquiryStagePerformanceByPlace("오페라극장");
		//StagePerformanceDTO tmp1 = SystemController.pDao.inquiryStagePerformanceByPlace("오페라극장");
		//StagePerformanceDTO tmp2 = SystemController.pDao.inquiryStagePerformanceByPlace("오페라극장");
		Vector<StagePerformanceDTO> list = SystemController.pDao.totalInquiryStagePerformance();
		for(int i =0; i<list.size(); i+=1){
			out.print("<section class='about section-sm mt20' id='about'>");
			out.print("<div class='container'>");
			String img = "'images/performance_place/"+ list.get(i).getPlace() + ".png'";
			out.print("<div class='row mb-50 justify-content-center'>");
				out.print("<div class='performance_place col-sm-12 place' id='"+list.get(i).getPlace()+"'>");
					out.print("<div class='content'>");
						out.print("<h2 id='place_title'>"+ list.get(i).getPlace() +"</h2>");
						out.print("<ul class='place_seat'>");
							out.print("<li class='seat_left'><img src='images/performance_place/seat.png'>");
							out.print("<span>관람석 : 총 " + (list.get(i).getSeatOfR()+list.get(i).getSeatOfS()+list.get(i).getSeatOfA()) + "석</span></li>");
							out.print("<li style='padding-left:25px;'>" + list.get(i)+"</li>");
						out.print("</ul>");
						out.print("<div class='place_img'>");
							out.print("<img src=" + img + ">");
						out.print("</div></div></div></div></div>");
		}
	%>
</section>   <!-- End section -->
<script>
	$(document).ready(function(){
		$('.defaultOpen').click();
	})
</script>
<%@include file="bottom.jsp" %>

    <!-- 
    Essential Scripts
    =====================================-->
    

    <!-- Main jQuery -->
    
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="plugins/instafeed.js/instafeed.min.js"></script>
    <!-- Slick Carousel -->
    <script src="plugins/slick-carousel/slick/slick.min.js"></script>
    <!-- Google Map js -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBItRd4sQ_aXlQG_fvEzsxvuYyaWnJKETk&callback=initMap"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    


  </body>
  </html>