<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

<!-- <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coastal Aquaculture Information System</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href='<spring:url value="/asset-home/css/style.css"/>'rel="stylesheet" />
<link href='<spring:url value="/asset-home/css/reset.css"/>'rel="stylesheet" />
<link href='<spring:url value="/asset-home/css/plugins.css"/>'rel="stylesheet" />
<link href='<spring:url value="/asset-home/css/bootstrap.min.css"/>'rel="stylesheet" />
<link href='<spring:url value="/asset-home/images/favicon.png"/>'rel="shortcut icon" />

<title>czmp_map</title>
<style type="text/css">
.mapHome img {
	position: absolute;
	z-index: 9;
	width: 30px;
	right: 12px;
	top: 12px;
	opacity: 0.75;
}

.mapHomeFrame {
	height: calc(100vh - 50px);
}

.show-share {
	top: 10px;
	width: 30px;
	height: 30px;
	line-height: 30px;
}

.show-share.isShare a {
	color: #fff;
}

header {
	height: 50px;
	position: static;
}

.header-inner {
	padding-left: 20px;
}

.logo-holder {
	top: 2px;
	width: 370px;
}

.content-footer {
	position: static;
}

.expand-title {
	
}

.modal .close {
	width: 25px;
	height: 25px;
	border-radius: 3px;
}
</style>


<link href='<spring:url value="/css/style.css"/>'
	rel="stylesheet" />
<script type="text/javascript"
	src='<spring:url value="/js/app.js"/>'></script>

</head>
<body>
	<header>
		<div class="header-inner">
			<div class="logo-holder">
				<a href="#"><img src="<spring:url value="/asset-home/images/logo-primary.png"/>" alt=""></a>
			</div>
		</div>
	</header>
	
	<div class="content light-bg landing-content">
		<div class="landing-mask">
			<div class="container">
				<div class="row">
					<div class="col-md-5 offset-md-1">
						<a href="index">
							<div class="bg-info landing-box mt-4">
								<h5>
									<i class="fa fa-hand-o-right">&nbsp;</i>Coastal Aquaculture
								</h5>
								<img alt="" src="<spring:url value="/asset-home/images/icon-aqua-coast.png"/>">
							</div>
						</a>
					</div>
					<div class="col-md-5">
						<a href="#" data-toggle="modal" data-target="#exampleModal" class="show_hide" onclick="underconstruction()">
							<div class="bg-success landing-box mt-4">
								<h5>
									<i class="fa fa-hand-o-right">&nbsp;</i>Inland Aquaculture
								</h5>
								<img alt="" src="<spring:url value="/asset-home/images/icon-aqua-inland.png"/>">
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
    <!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" href="#exampleModal">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h1 class="expand-title">Page Under Construction</h1>
                </div>
            </div>
        </div>
    </div> -->
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/jquery.min.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/plugins.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/scripts.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/map.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/bootstrap.bundle.min.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/js/app.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/js/bootstrap.bundle.min.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/js/jquery.slimscroll.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/js/metisMenu.min.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/js/waves.min.js"/>'></script>
				
</body>

<script type="text/javascript">
/* $(document).ready(function() {
	
alert(working....);
    $('.show_hide').click(function() {
          
         //$(".slidingDiv").slideToggle();
         var isvisible = $(this).next('.modal-dialog').is(':visible');
      
         if ( isvisible ) {
           $(this).next('.modal-dialog').hide();
         } else{
           $(this).next('.modal-dialog').show(); 
         }
    });

}); */

function underconstruction()
{
	alert("Page Under Construction!")
	
	}
</script>

</html>