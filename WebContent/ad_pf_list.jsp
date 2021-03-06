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

  <title>예술의전당 - 공연 조회</title>

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
		var msg = confirm("정말 삭제하시겠습니까? 삭제하면 이 공연과 관련된 모든 정보가 삭제됩니다.");
		if(msg == true){
			alert("삭제되었습니다.");
			return true;
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
					<h1 class="page-name">공연 조회</h1>
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li class="active">공연 조회</li>
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
                 	  <td colspan="6" class="pf_list_title"><h5>등록한 공연</h5></td>
                 	</tr>
                    <tr>
                      <th style="vertical-align:middle; width:20%;">공연포스터</th>
                      <th style="vertical-align:middle; width:25%;">공연이름</th>
                      <th style="vertical-align:middle; width:10%;">공연유형</th>
                      <th style="vertical-align:middle; width:15%;">공연시간</th>
                      <th style="vertical-align:middle; width:10%;">개시 신청</th>
                      <th style="vertical-align:middle; width:10%;">수정</th>
                      <th style="vertical-align:middle; width:10%;">삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                    <%
                    for(PerformanceDTO a :SystemController.pDao.adminInquiryPerformanceById(session.getAttribute("id").toString())){
                    
                    %>
                    <tr>
                      <td style="vertical-align:middle;">
                        <div class="product-info">
                          <img src="images/<%= a.getName() %>.png" alt="" />
                          <a href=""></a>
                        </div>
                      </td>
                      <td style="vertical-align:middle;"><%= a.getName() %></td>
                      <td style="vertical-align:middle;"><%= a.getType() %></td>
                      <td style="vertical-align:middle;"><%= a.getTime() %></td>
                      <td class="" style="vertical-align:middle; ">
                     	 <button type="button" class="pf_list_btn" onclick="javascript:location.href='ad_pf_request.jsp?name=<%=a.getName()%>'">신청</button>
                      </td>
                      <td class="" style="vertical-align:middle; ">
                     	 <button type="button" class="pf_list_btn" onclick="javascript:location.href='ad_pf_modify.jsp?name=<%=a.getName()%>'">수정</button>
                      </td>
                      <td class="" style="vertical-align:middle; ">
                     	 <button type="button" class="pf_list_btn" onclick="deleteConfirm();javascript:location.href='ad_pf_deleteHandling.jsp?name=<%=a.getName()%>';">삭제</button>
                      </td>
                    </tr>
                    
                    <%}
                    %>
                  
                  </tbody>
                </table>
              </form>
              
              <form method="post">
                <table class="table pf_list">
                  <thead>
                 	<tr>
                 	  <td colspan="6" class="pf_list_title"><h5>신청한 공연</h5></td>
                 	</tr>
                    <tr>
                      <th style="vertical-align:middle; width:10%;">공연번호</th>
                      <th style="vertical-align:middle; width:20%;">공연이름</th>
                      <th style="vertical-align:middle; width:10%;">상영기간</th>
                      <th style="vertical-align:middle; width:10%;">시작시간</th>
                      <th style="vertical-align:middle; width:15%;">장소</th>
                      <th style="vertical-align:middle; width:10%;">좌석별가격</th>
                      <th style="vertical-align:middle; width:10%;">개시여부</th>
                      <th style="vertical-align:middle; width:10%;">수정</th>
                      <th style="vertical-align:middle; width:10%;">삭제</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                    <%
                    for(OpenPerformanceDTO b : SystemController.pDao.adminInquiryOpenPerformanceById(session.getAttribute("id").toString())){
                    
                    %>
                    <tr>
                      <td style="vertical-align:middle; "><%= b.getPno() %></td>
                      <td style="vertical-align:middle; "><%= b.getName() %></td>
                      <td style="vertical-align:middle; "><%= b.getSdate() %> ~ <%= b.getEdate() %></td>
                      <td style="vertical-align:middle; "><%= b.getStime() %></td>
                      <td style="vertical-align:middle; "><%= b.getPlace() %></td>
                      <td style="vertical-align:middle; ">R석 <%= b.getPriceSeatR() %><br>S석 <%= b.getPriceSeatS() %><br>A석 <%= b.getPriceSeatA() %></td>
                      <td style="vertical-align:middle; ">
                      <%
                      if(b.getOpened() == 1){
                    	  out.print("개시 완료!");
                      }
                      else if(b.getOpened() == 0){
                    	  out.print("개시 승인 중");
                      }
                      else if(b.getOpened() == 2){
                    	  out.print("개시 승인 취소");
                      }
                      
                      %></td>
                      <td class="" style="vertical-align:middle; ">
                     	 <button type="button" class="pf_list_btn" onclick="javascript:location.href='ad_pf_modify_op.jsp?name=<%=b.getName()%>'">수정</button>
                      </td>
                      <td class="" style="vertical-align:middle; ">
                     	 <button type="button" class="pf_list_btn" onclick="deleteConfirm();javascript:location.href='ad_pf_deleteHandling_op.jsp?pno=<%=b.getPno()%>';">삭제</button>
                      </td>
                    </tr>
                    
                    <%
                    }
                    %>
                   
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
