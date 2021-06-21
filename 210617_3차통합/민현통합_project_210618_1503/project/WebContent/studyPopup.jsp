<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html lang="ko">

<head> 

	<meta charset="utf-8">

	<title>Contents Loiding......</title>

	<style type="text/css">

        .loading {display:none; position:absolute; top:-4px; left:0; z-index:99; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);}

        .loading strong {display:block; position:relative; top:50%; margin:-75px auto 0 auto; width:200px; height:50px; padding:0 30px;

        border-radius: 10px;

        -webkit-border-radius: 10px;

        -moz-border-radius: 10px;

	box-sizing:border-box;

        background:#fff;

        color:#000; font-size:16px; line-height:50px; text-align:center;

        }

    </style>

</head> 

<body> 

	<div>

		<h1>Loading</h1>

		<iframe src="http://www.rainstory.net" width="100%" height="1000px"></iframe>

	</div>



	<div class="loading">

		<strong>Loading.......</strong>

	</div>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {

		    $('.loading').show();

		});

		 

		$(window).on('load', function() {

		    $('.loading').hide();

		});

	</script>

</body> 

</html> 

