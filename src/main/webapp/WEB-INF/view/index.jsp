<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>Coastal Aquaculture Information System</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href='<spring:url value="/asset-home/css/style.css"/>'
	rel="stylesheet" />
<link href='<spring:url value="/asset-home/css/reset.css"/>'
	rel="stylesheet" />
<link href='<spring:url value="/asset-home/css/plugins.css"/>'
	rel="stylesheet" />
<link href='<spring:url value="/asset-home/css/bootstrap.min.css"/>'
	rel="stylesheet" />	
<link href='<spring:url value="/asset-home/images/favicon.png"/>'
	rel="shortcut icon" />
<style>
.show-share i {
	top: 2px;
}
</style>
</head>
<div class="page-loader" id="loaderdiv" style="display: none"><img src="<spring:url value="/images/loader.gif"/>"alt="loader" /></div>
<body>
	<div class="loader">
		<div id="movingBallG">
			<div class="movingBallLineG"></div>
			<div id="movingBallG_1" class="movingBallG"></div>
		</div>
	</div>
	<div id="main">
		<header>
			<div class="header-inner">

				<div class="logo-holder">
					<a href="#"><img
						src="<spring:url value="/images/logo-light.png"/>" alt=""></a>
				</div>

				<div class="nav-button-holder">
					<div class="nav-button vis-m">
						<span></span><span></span><span></span>
					</div>
				</div>

				<div class="nav-holder">
					<nav class="scroll-nav">
						<ul>
							<li><a class="scroll-link" href="#sec1" data-bgtex="Home"><span>Home</span></a></li>
							<li><a class="scroll-link" href="#sec2"
								data-bgtex="About Us"><span>About</span></a></li>
							<li><a class="scroll-link" href="#sec3"
								data-bgtex="Frequently Asked Questions"><span>FAQ</span></a></li>
							<li><a class="scroll-link" href="#sec4"
								data-bgtex="Contact Us"><span>Contact</span></a></li>
						</ul>
						<div class="topnav" id="myTopnav">
							<!-- <a class="" href="#"><span>User Manual</span></a> 
							<a class="" href="#" data-toggle="modal" data-target="#videoModal">
							     <span>Operating Video</span>
							</a>  -->
							<a class="" href="/czmpmap"><span>CZMP Map</span></a>
						<!--     <a class="" href="#"><span>Scheme</span></a>  -->
							<a href="javascript:void(0);" class="icon" onclick="myFunction()">
								<i class="fa fa-bars"></i></a>
						</div>
					</nav>
				</div>
				<div class="header-logo-sm">
					<img src="<spring:url value="/asset-home/images/orsac-logo.png"/>">
				</div>

			</div>

			<div class="show-share isShare">
				<i class="fa fa-lock"></i>
			</div>

		</header>


		<div id="wrapper">

			<div class="content-holder">

				<div class="content full-height" id="sec1">

					<div class="hero-wrap">

						<div class="slideshow-item owl-carousel"
							data-top-bottom="transform: translateY(300px);"
							data-bottom-top="transform: translateY(-300px);">

							<div class="item">
								<img class="bg"
									src="<spring:url value="/asset-home/images/slider/1.jpg"/>"
									alt="slider" />
							</div>

							<div class="item">
								<img class="bg"
									src="<spring:url value="/asset-home/images/slider/2.jpg"/>"
									alt="slider" />
							</div>
						</div>

						<div class="overlay"></div>

						<div class="hero-wrap-item center-item">
							<h2>COAST</h2>

						</div>
					</div>

				</div>
				<!-- Modal Alert Message-->
				<div class="modal fade" id="modallogin_err" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document"
						style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
						<div class="modal-content">
							<div class="modal-header bg-danger">
								<button type="button" class="close bg-white text-dark"
									data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="account-card-content">
									<div class="alert alert-danger text-center m-t-20" role="alert"
										id="loginerr_msg"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Alert Message-->
				<!-- Modal Success Message -->
				<div class="modal fade" id="modal_succ" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true"
					data-keyboard="false" data-backdrop="static">
					<div class="modal-dialog" role="document"
						style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
						<div class="modal-content">
							<div class="modal-header bg-success">
								<button type="button" class="close bg-white text-dark"
									data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="account-card-content">
									<div class="alert alert-success text-center m-t-20"
										role="alert" id="succ_msg"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Success Message -->
				<!-- Modal Error Message -->
				<div class="modal fade" id="modal_err" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document"
						style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
						<div class="modal-content">
							<div class="modal-header bg-danger">
								<button type="button" class="close bg-white text-dark"
									data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="account-card-content">
									<div class="alert alert-danger text-center m-t-20" role="alert"
										id="err_msg"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Video -->
				<div class="modal fade modal-video" id="videoModal" tabindex="-1"
					role="dialog" aria-labelledby="videoModal" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header bg-danger">
								<button type="button" class="close bg-white text-dark"
									data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="embed-responsive embed-responsive-16by9">
									<video id="gossVideo" class="embed-responsive-item"
										controls="controls" poster="">
										 <source src="" type="video/mp4">
											<!-- ~/asset-home/COAST-tutorial-video.mp4 -->
										
									</video>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Video -->

				<div class="content">
					<section style="padding: 0px">
						<div class="container">
							<div class="miniBoxContainer">
								<div class="row">
									<div class="col-md-3 miniBox">
										<div class="mbRed">
											<h4>
												Districts<br> <span>9</span>
											</h4>
										</div>
									</div>
									<div class="col-md-3 miniBox">
										<div class="mbBlue">
											<h4>
												Tehsils<br> <span>43</span>
											</h4>
										</div>
									</div>
									<div class="col-md-3 miniBox">
										<div class="mbOrange">
											<h4>
												Villages<br> <span>3,189</span>
											</h4>
										</div>
									</div>
									<div class="col-md-3 miniBox">
										<div class="mbGreen">
											<h4>
												Coastal Area (Ha)<br> <span>5,79,684</span>
											</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="content" id="sec2">
					<section>

						<div class="sect-subtitle right-align-dec"
							data-top-bottom="transform: translateY(200px);"
							data-bottom-top="transform: translateY(-200px);">
							<span>01</span>
						</div>

						<div class="container">
							<div class="row">
								<div class="col-md-4">

									<div class="parallax-box slider-box ">
										<div class="single-slider-holder">
											<div class="single-slider">

												<div class="item">
													<img
														src="<spring:url value="/asset-home/images/folio/1.jpg"/>"
														alt="">
												</div>



												<div class="item">
													<img
														src="<spring:url value="/asset-home/images/folio/2.jpg"/>"
														alt="">
												</div>



												<div class="item">
													<img
														src="<spring:url value="/asset-home/images/folio/3.jpg"/>"
														alt="">
												</div>



											</div>
											<div class="customNavigation ssn">
												<a class="prev-slide transition"><i
													class="fa fa-angle-left"></i></a> <a
													class="next-slide transition"><i
													class="fa fa-angle-right"></i></a>
											</div>
										</div>

									</div>
								</div>
								<div class="col-md-8">

									<h2 class="section-title">
										About <strong>US</strong>
									</h2>

									<p class="text-justify">Odisha has an extensive coastline
										measuring 480kms, bestowed with rich biological diversity,
										which accounts for 8% of total coastline of India. Shrimp
										farming is the major brackish water aquaculture in Odisha.
										Odisha occupies fourth place in brackish water shrimp farming,
										area wise and third place production wise, among the coastal
										state of the country. Out of the thirty districts of the
										state, nine districts namely Ganjam, Khurda, Puri,
										Jagatsinghpur,Jajpur Kendrapada, Cuttack, Bhadrak and
										Baleswar, are considered as coastal districts. These districts
										have high density of population i.e, from 300-500 per square
										kilometer. The major areas where shrimp culture can be started
										are the estuaries of the rivers and their lower reaches within
										the tidal influx and brackish water lakes.</p>
									<p class="text-justify">Geospatial Technology has been
										successfully used in assessing the natural resources and
										monitoring changes. It is also useful in providing timely and
										complete information on the spatial coverage of the study area
										and complementing field surveys of higher information
										contents. High-resolution Remote Sensing data and Geographic
										Information System (GIS) help in integrating multi-parameter
										spatial information for generating locale-specific plan.
										Application in aquaculture is fruitfully demonstrated by
										different organizations successfully.</p>
									<p class="text-justify">Based on above experience and
										expertise a Geo-ICT based application web portal called
										Coastal Aquaculture Information System (COAST)has been
										undertaken by Odisha Space Applications Centre (ORSAC),
										Bhubaneswar with the help of Fisheries Department, Government
										of Odisha, India.</p>
									<p class="text-justify">The website contains thematic
										information on occurrence on aquaculture ponds (interpreted
										from Satellite data), information on Coastal area (As per
										Coastal Aquaculture Authority), Coastal Regulation Zone, High
										Tide Line (HTL), CRZ categories, CZMP maps, Ecologically
										Sensitive Area (ESA), availability of Government land at
										Cadastral levels. Information on Registered farm (as provided
										by the Fisheries Dept.) are also incorporated. Ancillary data
										such as Ports, Harbour, Jetties, Fish Landing Centre, Light
										house, Multiple Cyclone Centre have also been provided.
										Information from the Geospatial data base can be obtained on
										various aspects of aquaculture activities by putting different
										queries.</p>
								</div>
							</div>
						</div>

					</section>
				</div>

				<div class="content dark-bg" id="sec3">

					<div class="sect-subtitle left-align-dec"
						data-top-bottom="transform: translateY(-200px);"
						data-bottom-top="transform: translateY(200px);">
						<span style="vertical-align: top">02</span>
					</div>

					<div class="parallax-inner">
						<div class="bg"
							data-bg="<spring:url value="/asset-home/images/bg/1.jpg"/>"
							data-top-bottom="transform: translateY(300px);"
							data-bottom-top="transform: translateY(-300px);"></div>
						<div class="overlay"></div>
					</div>

					<section>

						<div class="container">
							<div class="row">
								<div class="col-md-4">
									<h2 class="section-title">
										Frequently<strong> Asked Questions</strong>
									</h2>
								</div>
								<div class="col-md-8">

									<div class="accordion md-accordion" id="accordionEx"
										role="tablist" aria-multiselectable="true">

										<div class="card">

											<div class="card-header" role="tab" id="headingOne1">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordionEx" href="#collapseOne1"
													aria-expanded="false" aria-controls="collapseOne1">
													<h6 class="mb-0">
														What is CAA? <i class="fa fa-angle-down rotate-icon"></i>
													</h6>
												</a>
											</div>

											<div id="collapseOne1" class="collapse" role="tabpanel"
												aria-labelledby="headingOne1" data-parent="#accordionEx">
												<div class="card-body">
													<p>
														The Coastal Aquaculture authority (CAA) was established
														under the Coastal Aquaculture Authority Act, 2005 and
														notified vide Gazette Notification dated 22nd December,
														2005. The main objective of the Authority is to regulate
														coastal aquaculture activities in coastal areas in order
														to endure sustainable development without causing damage
														to the coastal environment. The Authority is empowered to
														make regulations for the construction and operation of
														aquaculture farms in coastal areas, inspection of farms to
														ascertain their environmental impact, registration of
														aquaculture farms, fixing standards for inputs and
														effluents, removal or demolition of coastal aquaculture
														farms, which cause pollution etc. <a
															href="https://www.caa.gov.in/index.html" target="_blank">go
															to link</a>
													</p>
												</div>
											</div>
										</div>
										<div class="card">

											<div class="card-header" role="tab" id="headingOne4">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordionEx" href="#collapseOne4"
													aria-expanded="false" aria-controls="collapseOne1">
													<h6 class="mb-0">
														What is the status of CRZ boundaries in the maps of Web
														portal? <i class="fa fa-angle-down rotate-icon"></i>
													</h6>
												</a>
											</div>

											<div id="collapseOne4" class="collapse" role="tabpanel"
												aria-labelledby="headingOne4" data-parent="#accordionEx">
												<div class="card-body">
													<p>The CRZ area and the classification shown on the
														website are as per the CRZ Notification 2011.After
														approval of the CZMP maps prepared according to the CRZ
														Notification 2019,the updated maps prepared according to
														the CRZ Notification 2019,updated maps will be uploaded</p>
												</div>
											</div>
										</div>

										<div class="card">

											<div class="card-header" role="tab" id="headingTwo2">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordionEx" href="#collapseTwo2"
													aria-expanded="false" aria-controls="collapseTwo2">
													<h6 class="mb-0">
														What is CRZ? <i class="fa fa-angle-down rotate-icon"></i>
													</h6>
												</a>
											</div>

											<div id="collapseTwo2" class="collapse" role="tabpanel"
												aria-labelledby="headingTwo2" data-parent="#accordionEx">
												<div class="card-body">
													<p>Coastal Regulation Zones (CRZ) are the areas along
														the 7,500 km-long coastal stretch of India. Development of
														buildings, tourism infrastructure and other facilities is
														regulated in these areas by the Government of India.</p>
													<p>Coastal Stretches of creeks, bays, seas, rivers and
														backwaters that are affected by the tidal actions of up to
														500 metres from the High Tide Line and the land between
														the Low Tide Line and the High Tide line are Coastal
														Regulation Zones (CRZ). A notification was issued in
														February 1991, under the Environment Protection Act, 1986
														for the regulation of coastal area activities by the
														Ministry of Environment and Forests (MoEF). This was when
														the Government of India notified Coastal Regulation Zones
														(CRZ) for the first time. As per the notification, coastal
														areas have been classified into four categories as CRZ-1,
														CRZ-2, CRZ-3 and CRZ-4.</p>
												</div>
											</div>
										</div>

										<div class="card">

											<div class="card-header" role="tab" id="headingThree3">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordionEx" href="#collapseThree3"
													aria-expanded="false" aria-controls="collapseThree3">
													<h6 class="mb-0">
														What is HTL? <i class="fa fa-angle-down rotate-icon"></i>
													</h6>
												</a>
											</div>

											<div id="collapseThree3" class="collapse" role="tabpanel"
												aria-labelledby="headingThree3" data-parent="#accordionEx">
												<div class="card-body">
													<p>
														The coastal zone includes the area between <strong>high
															tide line (HTL</strong>) and <strong>low tide line(LTL),</strong>
														up to 10 nautical miles towards the seaside from HTL and
														up to 20 km from HTL towards the land side. The accurate
														demarcation of shoreline is very important for planning
														purposes. The prime requisite of coastal regulation zone
														plan chart is basically to manage coastal and coastal zone
														features for sustainable use by demarcating high and low
														tide line on chart with the help of hydrographic surveys.
													</p>
													<p>
														<strong>1. Demarcation of high tide line</strong><br>
														High tide line (HTL) in the coastal regulation zone
														notification is defined as line up to which highest high
														tide reaches in spring tides. It is delineated by walking
														over or remote sensing data or by helicopter survey.
													</p>
													<p>
														<strong>2. Demarcation of low tide line</strong><br>
														The low tide line is the limit up to which the lowest low
														tide recedes during spring tide. This line would be
														arrived at by making a bathymetric chart of the coastal
														area with the datum of chart being the lowest low tide.
													</p>
												</div>
											</div>
										</div>

									</div>

									<a href="/Frequently_Asked_Question"
										class="btn btn-sm btn-light mt-4">View More</a>
								</div>
							</div>
						</div>

					</section>
				</div>

				<div class="content" id="sec4">
					<div class="sect-subtitle right-align-dec"
						data-top-bottom="transform: translateY(-200px);"
						data-bottom-top="transform: translateY(200px);">
						<span>03</span>
					</div>
					<section>
						<div class="container">
							<div class="row">
								<div class="col-md-8">
									<h2 class="section-title">
										Contact <strong>Details </strong>
									</h2>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="row">
								<div class="col-md-8">
									<div class="contact-details">
										<h4>Any Fisheries Data Related Query :</h4>
										<p class="mb-0">
											<i class="fa fa-map-marker primary-orange">&nbsp;</i>
											Fisheries and Animal Resources Development Department ,
											Odisha Secretariat, Sachivalaya Marg, Bhubaneswar
										</p>
										<p class="mb-0">
											<i class="fa fa-phone primary-orange">&nbsp;</i> (+91)
											674-2536985,2322960
										</p>
										<p class="mb-0">
											<i class="fa fa-fax primary-orange">&nbsp;</i> (+91)
											674-2390681
										</p>
										<p class="mb-0">
											<i class="fa fa-envelope primary-orange">&nbsp;</i> <a
												href="mailto:">fardsec.od@nic.in</a>
										</p>
									</div>

								</div>
								<div class="col-md-4">
									<div class="contact-details">
										<h4>Any Website Related Query :</h4>
										<p class="mb-0">
											<i class="fa fa-map-marker primary-orange">&nbsp;</i> ODISHA
											SPACE APPLICATIONS CENTRE (ORSAC)
										</p>
										<p class="mb-0">
											<i class="fa fa-phone primary-orange">&nbsp;</i>(+91)
											674-2303625/3293545
										</p>
										<p class="mb-0">
											<i class="fa fa-fax primary-orange">&nbsp;</i>(+91)
											674-2300681
										</p>
										<p class="mb-0">
											<i class="fa fa-envelope primary-orange">&nbsp;</i> <a
												href="mailto:">orsac.od@nic.in</a>
										</p>
									</div>

								</div>
							</div>
						</div>
					</section>
				</div>

				<div class="height-emulator"></div>
				<footer class="content-footer">

					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<div class="footer-item footer-logo">
									<h4 class="text-link">Disclaimer</h4>
								</div>
							</div>
							<div class="col-md-9">
								<div class="footer-item">
									<h4 class="text-link">Links</h4>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">

								<div class="footer-item footer-logo">
									<p>This is the Official Web Portal of Coastal Aquaculture
										Information System. The portal is developed and hosted by
										ORSAC. Contents in this portal is maintained by Coastal
										Aquaculture Information System. Any queries may be sent to
										Secretary, Coastal Aquaculture Information System. E-mail:
										fardsec.od@nic.in, Ph: 0674-2536985,Fax: 0674-2390681.</p>
								</div>

							</div>

							<div class="col-md-2">
								<div class="footer-item">
									<ul>
										<li><a href="https://nfdb.gov.in/" target="_blank">NFDB
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.cifnet.nic.in/" target="_blank">CIFNET
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.nafed.india.com/"
											target="_blank">NAFED <i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.nabard.org/" target="_blank">NABARD
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.fao.org/home/en/"
											target="_blank">FAO <i class="fa fa-long-arrow-right"></i>
										</a></li>
									</ul>
								</div>
							</div>

							<div class="col-md-2">
								<div class="footer-item">
									<ul>
										<li><a href="https://mofpi.nic.in/Index1.aspx"
											target="_blank">Food Processing <i
												class="fa fa-long-arrow-right"></i></a></li>
										<li><a href="https://cifa.nic.in/" target="_blank">CIFA
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.ciba.res.in/" target="_blank">CIBA
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://mpeda.gov.in/MPEDA/#"
											target="_blank">MPEDA <i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.chilika.com/" target="_blank">CDA
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
									</ul>
								</div>
							</div>

							<div class="col-md-2">
								<div class="footer-item">
									<ul>
										<li><a href="https://fishcopfed.com/" target="_blank">FISCOPFED
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.cife.edu.in/cifemod2/index.php"
											target="_blank">CIFE <i class="fa fa-long-arrow-right"></i></a></li>
										<li><a href="https://www.cmfri.org.in/" target="_blank">CMFRI
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.ifsi.in/cifri/cifri.htm"
											target="_blank">CIFRI <i class="fa fa-long-arrow-right"></i></a></li>
										<li><a href="https://www.nbfgr.res.in/" target="_blank">NBFGR
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
									</ul>
								</div>
							</div>

							<div class="col-md-2">
								<div class="footer-item">
									<ul>
										<li><a href="https://www.cift.res.in/" target="_blank">CIFT
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://www.caa.gov.in/" target="_blank">CAA
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
										<li><a href="https://dahd.nic.in/dahd/default.aspx"
											target="_blank">DAHD <i class="fa fa-long-arrow-right"></i></a></li>
										<li><a href="https://www.icar.org.in/" target="_blank">ICAR
												<i class="fa fa-long-arrow-right"></i>
										</a></li>
									</ul>
								</div>
							</div>

						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="footer-wrap row">
									<div class="col-md-6">
										<span class="copyright"> Developed by <a
											href="https://sparcindia.com/" target="_blank">SPARC (P)
												Ltd.</a> Under Ageis of <a href="https://www.orsac.gov.in/"
											target="_blank">ORSAC</a>
										</span>
									</div>
									<div class="col-md-4">
									<%
        						 		Integer hitsCount = (Integer)application.getAttribute("hitCounter");
         						 		if( hitsCount ==null || hitsCount == 0 ) {							            
							           		 hitsCount = 1;
							         	} else {							            
							            	 hitsCount += 1;
							         		}
							         application.setAttribute("hitCounter", hitsCount);
							     	 %>
										<span class="copyright"> Visitors Count :<%= hitsCount%>
										</span>
									</div>
									<div class="col-md-2">
										<span class="to-top">To Top</span>
									</div>
								</div>
							</div>
						</div>

					</div>

					<canvas class="particular"></canvas>

				</footer>

				<div class="share-inner">
					<div class="container">
						<div class="account-card-content nav-login">
							<ul class="nav nav-tabs" role="tablist" id="myTab">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#manage1" role="tab"><i
										class="fa fa-users">&nbsp;</i>Admin</a></li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane active" id="manage1" role="tabpanel">
									<form class="form-horizontal" id="adminloginform"<%--  method="post" action="login" --%>>
										<div class="form-group mt-3 mb-2">
											<label for="username">Email ID</label> <input type="email"
												name="txtEmailId" class="form-control text-box single-line"
												id="txtEmailId" placeholder="Enter email Id" />
										</div>
										<div class="form-group mb-3">
											<label for="userpassword">Password</label> <input
												type="password" name="txtPassword"
												class="form-control text-box single-line" id="txtPassword"
												placeholder="Enter Password" />
										</div>
										<div class="form-group mb-2 row">
											<div class="col-sm-7"></div>
											<div class="col-sm-5">
												<button type="submit"   class="btn btn-custom pull-right"
													id="userloginform">LogIn</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="close-share"></div>
				</div>
			</div>
		</div>
		<footer class="fixed-footer">
			<div class="footer-social"></div>

			<div class="footer-title">
				<h2>Home</h2>
			</div>

		</footer>
	</div>


	<!-- <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/jquery.min.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/plugins.js"/>'></script>
	<script type="text/javascript"
		src='<spring:url value="/asset-home/js/scripts.js"/>'></script>
	<%-- <script type="text/javascript"
		src='<spring:url value="/asset-home/js/map.js"/>'></script> --%>
	<%-- <script type="text/javascript"
		src='<spring:url value="/asset-home/js/bootstrap.bundle.min.js"/>'></script> --%>
	<%-- <script type="text/javascript" src='<spring:url value="/js/app.js"/>'></script> --%>
	<%--<script type="text/javascript"
		src='<spring:url value="/js/bootstrap.bundle.min.js"/>'></script> --%>
	<script type="text/javascript"
		src='<spring:url value="/js/jquery.slimscroll.js"/>'></script>
	<%-- <script type="text/javascript"
		src='<spring:url value="/js/metisMenu.min.js"/>'></script> --%>
	<%-- <script type="text/javascript"
		src='<spring:url value="/js/waves.min.js"/>'></script> --%>

	<script>
		$(document).ready(function() {
			localStorage.clear();
		});

		autoPlayYouTubeModal();
		//FUNCTION TO GET AND AUTO PLAY YOUTUBE VIDEO FROM DATATAG
		function autoPlayYouTubeModal() {
			var trigger = $("body").find('[data-toggle="modal"]');
			trigger.click(function() {
				var theModal = $(this).data("target"), videoSRC = $(this).attr(
						"data-theVideo"), videoSRCauto = videoSRC
						+ "?autoplay=1";
				$(theModal + ' iframe').attr('src', videoSRCauto);
				$(theModal + ' button.close').click(function() {
					$(theModal + ' iframe').attr('src', videoSRC);
				});
			});
		}
		function emailvalidation(event){
		   if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(event))
			{
				    return (true);
			}else{
					return (false);
			}
		}

		//USER LOGIN
		$("#adminloginform").submit(function(event) {
			var email = document.getElementById("txtEmailId").value;
			var passsword = document.getElementById("txtPassword").value;
        	if(email!=""){
        		var isEmailValid=emailvalidation(email);
        		if(isEmailValid==true){
        			if(passsword!=""){
            			$(document).ajaxSend(function() {
                			$("#loaderdiv").show();
                		}).ajaxComplete(function() {
                			$("#loaderdiv").hide();
                		});
            			event.preventDefault();
            			$.ajax({
            				type : "POST",
            				url : "/login",
            				data : {
            					'txtEmailId' : email,
            					'txtPassword' : passsword
            				},
            				success : function(data) {
            					if (data == 'Logged In successfully !') 
            					{ $(document).ajaxSend(function() {					  		
            			    			$("#loaderdiv").show();			    		
            			    		}).ajaxComplete(function() {
            			    			$("#loaderdiv").hide();			    			
            			    		});
            						
            						//after fullfilling condition we give the page permission to redirect here						
            						window.location.href = '/dashboard1';
            					} else {
            						if (email == null || email == "") {
            							alert(data);
            							document.getElementById("txtEmailId").focus();
            						} else if (passsword == null || passsword == "") {
            							alert("Please enter Password !");
            							document.getElementById("txtPassword").focus();
            						} else if(data=='Password is incorrect !'){
            							alert(data);
            							document.getElementById("txtPassword").focus();
            						}
            						else
            							{
            							alert(data);
            							document.getElementById("txtPassword").focus();
            							}
            					}
            				},
            				error : function(errormessage) {
            					alert(errormessage.responseText);
            				}
            			});
            		}else{
            			 alert("Password is mandatory!");
            			 document.getElementById("txtPassword").focus();
                		 document.getElementById("txtPassword").style.backgroundColor = "red";
       				     return (false);
            		}
        		}else{
        		  alert("Invalid Email address!");
        		  document.getElementById("txtEmailId").focus();
         		 document.getElementById("txtEmailId").style.backgroundColor = "red";
				  return (false);
        	   }
        	}else{
        		 alert("Email address is mandatory!");
        		 document.getElementById("txtEmailId").focus();
        		 document.getElementById("txtEmailId").style.backgroundColor = "red";
				  return (false);
        	}
		});	
	</script>
</body>
</html>