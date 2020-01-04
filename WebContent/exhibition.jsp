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

<%@include file="top.jsp" %>

<section class="page-header" style="padding-top:300px;margin-top:0px">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            <div class="content">
               <h1 class="page-name">전시조회</h1>
               <ol class="breadcrumb">
                  <li><a href="#">Home</a></li>
                  <li class="active">전시조회</li>
               </ol>
            </div>
         </div>
      </div>
   </div>
</section>


<section class="about section-sm mt100" id="about">
<div class="container">
   <div class="row mb-50 justify-content-center">
      
         <%  
              request.setCharacterEncoding("utf-8");
         
         for(OpenExhibitionDTO tmp: SystemController.eDao.totalInquiryOpenExhibition()) {
            String img = "'/artcenter/images/"+ tmp.getName() + ".png'";
            
            out.print("<div class='row mb-50 justify-content-center'>");
                  out.print("<div class='col-md-5 col-sm-12 text-center offset-md-1'>");
                     out.print("<ul><li><img src="
                              +img + " class='img-fluid rounded shadow' alt=''></li></ul>");
                  out.print("</div>");
               
                  out.print("<div class='col-md-5 col-sm-12'><div class='content' style='margin-top: -15px;'>");
                     out.print("<h2>"+tmp.getName()+"</h2>");
                     out.print("<table class='perfor_info mt80'>");
                     out.print("<thead></thead><tfoot></tfoot><tbody>");
               
                     out.print(tmp);
                     out.print("</tbody></table></div></div>");
               
                  out.print("</div><hr>");
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