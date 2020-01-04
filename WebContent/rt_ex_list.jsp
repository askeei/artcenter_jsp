<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="controller.*, DTO.*" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Aviato E-Commerce Template">
  
  <meta name="author" content="Themefisher.com">

  <title>예술의전당 - 전시개시조회</title>

  <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="/artcenter/images/sac_ci_favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Revolution Slider -->
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/fonts/font-awesome/css/font-awesome.css">

  <!-- REVOLUTION STYLE SHEETS -->
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/css/settings.css">
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/css/layers.css">
  <link rel="stylesheet" type="text/css" href="plugins/revolution-slider/revolution/css/navigation.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
 
	<script type="text/javascript">
	function deleteConfirm(){
		var msg = confirm("정말 취소하시겠습니까?");
		if(msg == true){
			alert("취소되었습니다.");
		}else
			return false;
	}
	
	</script>
</head>

<body id="body">

<%@include file="top.jsp"%>

<section class="page-header sub_page" style="padding-top:300px;margin-top:0px">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">전시개시조회</h1>
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li class="active">전시개시조회</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
      <div class="row">
        <div>
          <div class="block">
            <div class="product-list">
              <form method="post">
                <table class="table pf_list">
                
                  <thead>
                 	<tr>
                 	  <td colspan="6" class="pf_list_title"><h5>개시완료</h5></td>
                 	</tr>
                    <tr>
                      <th style="vertical-align:middle; width:10%;">공연번호</th>
                      <th style="vertical-align:middle; width:15%;">전시이름</th>
                      <th style="vertical-align:middle; width:10%;">전시장소</th>
                      <th style="vertical-align:middle; width:10%;">가격</th>
                      <th style="vertical-align:middle; width:10%;">전시기간</th>
                      <th style="vertical-align:middle; width:5%;">수정</th>
                      <th style="vertical-align:middle; width:5%;">삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                    <%
                    for(OpenExhibitionDTO a : SystemController.eDao.adminInquiryOpenExhibitionByOpened()){
                    
                    %>
                    <tr>
                      <td style="vertical-align:middle;"><%= a.getEno() %></td>
                      <td class="" >
                        <div class="product-info">
                          <img style="width:50%;" src="images/<%= a.getName()%>.png" alt="" />
                           <span style="display:block; padding-top:15px;"><%= a.getName()%></span>
                        </div>
                      </td>
                      <td style="vertical-align:middle;"><%= a.getPlace() %></td>
                      <td style="vertical-align:middle;"><%= a.getPrice() %></td>
                      <td style="vertical-align:middle;"><%= a.getSdate() %> ~ <%= a.getEdate() %></td>
                      <td class="" style="vertical-align:middle; ">
                       
                        <button class="pf_list_btn">수정</button>
                      </td>
                      <td class="" style="vertical-align:middle; ">
                       
                        <button class="pf_list_btn">삭제</button>
                      </td>
                    </tr>
                    <%
                    
                    }%>
                    
                    <!-- 
                    <tr>
                      <td style="vertical-align:middle;">2</td>
                      <td style="vertical-align:middle;">공연이름공연이름공연이름공연이름</td>
                      <td style="vertical-align:middle;">오페라극장</td>
                      <td style="vertical-align:middle;">10,000</td>
                      <td style="vertical-align:middle;">~2018.06.11</td>

                      <td class="" style="vertical-align:middle; ">
                       
                        <button class="pf_list_btn">수정</button>
                      </td>
                      <td class="" style="vertical-align:middle; ">
                       
                        <button class="pf_list_btn">삭제</button>
                      </td>
                    </tr>
                     -->
                  
                    
                  </tbody>
                </table>
                
                
              </form>
              
              
              
              <form method="post">
                <table class="table pf_list">
                
                  <thead>
                 	<tr>
                 	  <td colspan="6" class="pf_list_title"><h5>개시대기</h5></td>
                 	</tr>
                    <tr>
                      <tr>
                      <th style="vertical-align:middle; width:10%;">공연번호</th>
                      <th style="vertical-align:middle; width:15%;">전시이름</th>
                      <th style="vertical-align:middle; width:10%;">전시장소</th>
                      <th style="vertical-align:middle; width:10%;">가격</th>
                      <th style="vertical-align:middle; width:10%;">전시기간</th>
                      <th style="vertical-align:middle; width:5%;">승인</th>
                      <th style="vertical-align:middle; width:5%;">수정</th>
                      <th style="vertical-align:middle; width:5%;">삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                     <%
                    for(OpenExhibitionDTO a : SystemController.eDao.adminInquiryOpenExhibitionByClosed()){
                    
                    %>
                    <tr>
                      <td style="vertical-align:middle;"><%= a.getEno() %></td>
                      <td style="vertical-align:middle;"><%= a.getName() %></td>
                      <td style="vertical-align:middle;"><%= a.getPlace() %></td>
                      <td style="vertical-align:middle;"><%= a.getPrice() %></td>
                      <td style="vertical-align:middle;"><%= a.getSdate() %> ~ <%= a.getEdate() %></td>
					  <td class="" style="vertical-align:middle; ">
                       
                        <button class="pf_list_btn">승인</button>
                      </td>
                      <td class="" style="vertical-align:middle; ">
                       
                        <button class="pf_list_btn">수정</button>
                      </td>
                      <td class="" style="vertical-align:middle; ">
                       
                        <button class="pf_list_btn">삭제</button>
                      </td>
                    </tr>
                    <%
                    
                    }%>
                    
                  
                    
                  </tbody>
                </table>
                
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="bottom.jsp"%>
    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="plugins/instafeed-js/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="plugins/SyoTimer/build/jquery.syotimer.min.js"></script>
    
    <!-- Revolution Slider -->
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/jquery.themepunch.revolution.min.js"></script>
    
    <!-- Revolution Slider -->
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="plugins/revolution-slider/assets/warning.js"></script>  


    <!-- Google Mapl -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
  <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

    <!-- Main Js File -->
    <script src="js/script.js"></script>
    
  </body>
  </html>
