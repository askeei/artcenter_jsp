<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

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
  <style>
  
   .category-box {
    width: 48%;
    display: inline-block;
    margin: 4px;
    }
  
  </style>
</head>

<body id="body">

<%@ include file="top.jsp"%>

<section class="page-wrapper location" style="padding-top:200px;margin-top:0px">
	<div class="contact-section">
		<div class="container">
			<div class="row">
			
		<section class="team" id="team">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="title text-center">
						<h2 style="font-size:1.8em;">TEAM MEMBER</h4>
						
						<p>예전에 내가 - 고기4조</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- team member -->
				<div class="col-12  col-sm-6" >
			               <div class="team-member text-center">
					<div class="member-photo">
						<!-- member photo -->
						<img class="img-fluid" src="/artcenter/images/team/ask.png" alt="안석경" style="height:400px;">
						<!-- /member photo -->
					</div>
					
					<!-- member name & designation -->
					<div class="member-content">
						<h3>An Seok Kyung</h3>
						<span>Team Leader &amp; Project Manager(PM)</span>
						<ul class="team_intro">
							<li>전체적인 역할분담</li>
							<li>HTML, CSS, Javascript 코딩</li>
							<li>JDBC 코딩</li>
						</ul>
					</div>
					<!-- /member name & designation -->	   
			               </div>
		                 </div>
				<!-- end team member -->
				<!-- team member -->
				<div class="col-12  col-sm-6" >
			               <div class="team-member text-center">
					<div class="member-photo">
						<!-- member photo -->
						<img class="img-fluid" src="/artcenter/images/team/lee.png" alt="이용주" style="height:400px;">
						<!-- /member photo -->
					</div>
					
					<!-- member name & designation -->
					<div class="member-content">
						<h3>Lee Yong Joo</h3>
						<span>Project Leader(PL)</span>
						<ul class="team_intro">
							<li>메인 코더</li>
							<li>코딩파트 분담</li>
							<li>JDBC,JSP 코딩</li>
						</ul>
					</div>
					<!-- /member name & designation -->	   
			               </div>
		                 </div>
				<!-- end team member -->

				
				

			</div>  	<!-- End row -->
			<div class="row" style="margin-top:100px;">
				<!-- team member -->
				<div class="col-12  col-sm-6" >
			               <div class="team-member text-center">
					<div class="member-photo">
						<!-- member photo -->
						<img class="img-fluid" src="/artcenter/images/team/moon.jpg" alt="문은경">
						<!-- /member photo -->
					</div>
					
					<!-- member name & designation -->
					<div class="member-content">
						<h3>Moon Eun Kyoung</h3>
						<span>Team Member</span>
						<ul class="team_intro">
							<li>PPT, 문서작업</li>
							<li>홈페이지 UI 작업</li>
							<li>JDBC 코딩</li>
						</ul>
					</div>
					<!-- /member name & designation -->	   
			               </div>
		                 </div>
				<!-- end team member -->
				<!-- team member -->
				<div class="col-12  col-sm-6" >
			               <div class="team-member text-center">
					<div class="member-photo">
						<!-- member photo -->
						<img class="img-fluid" src="/artcenter/images/team/jung.jpg" alt="정주훈">
						<!-- /member photo -->
					</div>
					
					<!-- member name & designation -->
					<div class="member-content">
						<h3>Jeong Ju Hoon</h3>
						<span>Team Member</span>
						<ul class="team_intro">
							<li>JDBC, MySQL, JSP</li>
							<li>DB설계</li>
							<li>파일관리</li>
							
						</ul>
					</div>
					<!-- /member name & designation -->	   
			               </div>
		                 </div>
				<!-- end team member -->
				

			</div>  	<!-- End row -->
		</div>   	<!-- End container -->
	</section>   <!-- End section -->
					
				
			
			</div> <!-- end row -->
		</div> <!-- end container -->
	</div>
</section>
	
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