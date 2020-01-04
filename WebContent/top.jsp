<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/hanna.css" />



</head>
<body id="body">
<!-- Start Top Header Bar -->
<div class="header_area">
<section class="top-header">
	<div class="container" style="padding-top:15px; padding-bottom:5px;">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				<div class="contact-number leftlogo">
					<a href="team.jsp"><img src="/artcenter/images/gogi4.png" alt="고기4조"></a>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Site Logo -->
				<div class="logo text-center">
					<a href="index.jsp">
						<img src="/artcenter/images/logo.png" alt="예술의 전당">
					</a>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
			<!-- Cart -->
		<ul class="top-menu text-right list-inline" style="font-family:'Hanna', sans-serif;">
		
		<%
			if(session.getAttribute("type") == null){
				out.print("<li class='dropdown search dropdown-slide'>");
				out.print("<a href='login.jsp'>로그인</a></li>");
				out.print("<li class='dropdown search dropdown-slide'>");
				out.print("<a href='join.jsp'>회원가입</a></li>");
			}
			else if(session.getAttribute("type").equals(2)){
				out.print("<li class='dropdown search dropdown-slide'>");
				out.print("반갑습니다! <a href='user_info.jsp' style='color:#2457BD;'><ins>");
				out.print(session.getAttribute("name")+"</ins></a> 님");
				out.print("</li><li class='dropdown search dropdown-slide'>");
				out.print("<a href='logout.jsp'><ins>로그아웃</ins></a></li>");
			}
			else if(session.getAttribute("type").equals(1)){
				out.print("<li class='dropdown search dropdown-slide'>");
				out.print("반갑습니다! admin관리자 <a href='user_info.jsp' style='color:#2457BD;'><ins>");
				out.print(session.getAttribute("name")+"</ins></a> 님");
				out.print("</li><li class='dropdown search dropdown-slide'>");
				out.print("<a href='logout.jsp'><ins>로그아웃</ins></a></li>");
			}
			else if(session.getAttribute("type").equals(0)){
				out.print("<li class='dropdown search dropdown-slide'>");
				out.print("환영합니다! 회원  <a href='user_info.jsp' style='color:#2457BD;'><ins>");
				out.print(session.getAttribute("name")+"</ins></a> 님");
				out.print("</li><li class='dropdown search dropdown-slide'>");
				out.print("<a href='logout.jsp'><ins>로그아웃</ins></a></li>");
			}
		
		
		%>

	        </ul><!-- / .nav .navbar-nav .navbar-right -->
			</div>
		</div>
	</div>
</section><!-- End Top Header Bar -->


<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation" style="padding:0px;">
	    <div class="container">
	      <div class="navbar-header">
	      	<h2 class="menu-title">Main Menu</h2>
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	          <span class="sr-only">Toggle navigation</span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	        </button>

	      </div><!-- / .navbar-header -->

	      <!-- Navbar Links -->
	      <div id="navbar" class="navbar-collapse collapse text-center">
	        <ul class="nav navbar-nav">
	          <!-- 공연 -->
	          <li class="dropdown dropdown-slide">
	            <a href="performance.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">공연 <span class="tf-ion-ios-arrow-down"></span></a>
	            <ul class="dropdown-menu">
					<li><a href="performance.jsp">공연조회</a></li>
					<li><a href="performance_place.jsp">공연장조회</a></li>
	            </ul>
	          </li><!-- / 공연 -->

	          <!-- 전시 -->
	          <li class="dropdown dropdown-slide">
	            <a href="exhibition.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">전시 <span class="tf-ion-ios-arrow-down"></span></a>
	            <ul class="dropdown-menu">
					<li><a href="exhibition.jsp">전시조회</a></li>
					<li><a href="exhibition_place.jsp">전시장조회</a></li>
	            </ul>
	          </li><!-- / 전시 -->
				
				
				
			<%
			
			out.print("<li class='dropdown dropdown-slide'>");
			out.print("<a href='#' class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown' data-delay='350' role='button' aria-haspopup='true' aria-expanded='false'>안내 <span class='tf-ion-ios-arrow-down'></span></a>");
			out.print("<ul class='dropdown-menu'>");
			out.print("<li><a href='rent.jsp'>대관안내</a></li>");
			out.print("<li><a href='location.jsp'>오시는길</a></li>");
			out.print("<li><a href='contact.jsp'>문의</a></li></ul></li>");
			
				if(session.getAttribute("type") == null){
				}
				else if (session.getAttribute("type").equals(2)){
		               out.print("<li class='dropdown full-width dropdown-slide'>");
		               out.print("<a href='#' class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown' data-delay='350' role='button' aria-haspopup='true' aria-expanded='false'>관리 <span class='tf-ion-ios-arrow-down'></span></a>");
		               
		               out.print("<div class='dropdown-menu'>");
		               out.print("<div class='row'>");
		               
		               out.print("<div class='col-sm-3 col-xs-12' >");
		            		   out.print("<a href='#'>");
		            				   out.print("	<img class='img-responsive' src='images/menu2.jpg' alt='menu image' />");
		            						   out.print("</a>");
		            								   out.print("</div>");
		               
		               
		               
		               out.print("<div class='col-sm-3 col-xs-12'><ul>");
		               out.print("<li class='dropdown-header'>공연,전시 관리</li>");
		               out.print("<li role='separator' class='divider'></li>");
		               out.print("<li><a href='rt_pf_list.jsp'>공연 조회</a></li>");
		               out.print("<li><a href='rt_ex_list.jsp'>전시 조회</a></li></ul></div>");
		               
		               
		               out.print("<div class='col-sm-3 col-xs-12'><ul>");
		               out.print("<li class='dropdown-header'>장소 관리</li>");
		               out.print("<li role='separator' class='divider'></li>");
		               out.print("<li><a href='rt_place_list.jsp'>조회</a></li>");
		               out.print("<li><a href='rt_pfp_add.jsp'>등록</a></li></ul></div>");
		               
		               out.print("<div class='col-sm-3 col-xs-12'><ul>");
		               out.print("<li class='dropdown-header'>회원 관리</li>");
		               out.print("<li role='separator' class='divider'></li>");
		               out.print("<li><a href='rt_member_list.jsp'>조회</a></li>");
		               out.print("<li><a href='rt_member_add.jsp'>관리자등록</a></li></ul></div>");

				}
				else if (session.getAttribute("type").equals(1)){
					out.print("<li class='dropdown full-width dropdown-slide'>");
					out.print("<a href='#' class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown' data-delay='350' role='button' aria-haspopup='true' aria-expanded='false'>관리 <span class='tf-ion-ios-arrow-down'></span></a>");
					
					%>
					<!--  
					<div class="dropdown-menu">
		              	<div class="row">
			                <div class="col-sm-3 col-xs-12" style="width:35%;">
			                	<ul>
									<li class="dropdown-header">공연 관리</li>
									<li role="separator" class="divider"></li>
									<li><a href="#">조회</a></li>
									<li><a href="#">등록</a></li>
			                	</ul>
			                </div>
	
			                <div class="col-sm-3 col-xs-12" style="width:35%;">
			                	<ul>
									<li class="dropdown-header">전시 관리</li>
									<li role="separator" class="divider"></li>
									<li><a href="#">조회</a></li>
									<li><a href="#">등록</a></li>
			                	</ul>
			                </div>
			                <div class="col-sm-3 col-xs-12" style="width:35%;">
			                	<ul>
									<li class="dropdown-header">장소 관리</li>
									<li role="separator" class="divider"></li>
									<li><a href="#">조회</a></li>
									<li><a href="#">등록</a></li>
			                	</ul>
			                </div>
			                <div class="col-sm-3 col-xs-12" style="width:35%;">
			                	<ul>
									<li class="dropdown-header">회원 관리</li>
									<li role="separator" class="divider"></li>
									<li><a href="#">조회</a></li>
									<li><a href="#">관리자 등록</a></li>
			                	</ul>
			                </div>     
		              	</div>
	            	</div>-->
					
					
					<div class="dropdown-menu">
		              	<div class="row">
		              	
		              		<div class="col-sm-3 col-xs-12" >
			                	<a href="shop.html">
				                	<img class="img-responsive" src="images/menu.jpg" alt="menu image" />
			                	</a>
			                </div>
			                <!-- Introduction -->
			                <div class="col-sm-3 col-xs-12" style="width:35%;">
			                	<ul>
									<li class="dropdown-header">Performance</li>
									<li role="separator" class="divider"></li>
									<li><a href="ad_pf_list.jsp">조회</a></li>
									<li><a href="ad_pf_add.jsp">등록</a></li>
			                	</ul>
			                </div>
	
			                <!-- Contact -->
			                <div class="col-sm-3 col-xs-12" style="width:35%;">
			                	<ul>
									<li class="dropdown-header">Exhibition</li>
									<li role="separator" class="divider"></li>
									<li><a href="ad_ex_list.jsp">조회</a></li>
									<li><a href="ad_ex_add.jsp">등록</a></li>
			                	</ul>
			                </div>       
		              	</div><!-- / .row -->
	            	</div><!-- / .dropdown-menu -->
	            
	            <%

					out.print("</li>");
					
	            out.print("<li class='dropdown'>");
				out.print("<a href='ad_ticket_list.jsp'>예매 현황</a>");
				out.print("</li>");
				}
				else if (session.getAttribute("type").equals(0)){

					
					out.print("<li class='dropdown'>");
					out.print("<a href='ticket_list.jsp'>티켓 조회</a>");
					out.print("</li>");
					
					//out.print("<a class='btn btn--success btn--floating box-shadow-wide' href='performance.jsp'>");
					//out.print("<span class='btn__text'>예매하기!</span></a>");
				}
			%>

	        </ul><!-- / .nav .navbar-nav -->

	      	</div><!--/.navbar-collapse -->
	    </div><!-- / .container -->
	</nav>
</section>
</div>
	

	

</body>
</html>