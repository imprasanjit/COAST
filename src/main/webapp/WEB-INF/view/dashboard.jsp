<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<%@ include file="master.jsp"%> 	
<style>
	#map .ol-viewport{
		position: absolute !important;
	}
</style>

<div class="page-loader" id="loaderdiv" style="display: none"><img src="<spring:url value="/images/loader.gif"/>"alt="loader" /></div>

<div class="content-page">
	<div class="container-fluid">
		<div class="page-title-box">
			<div class="row align-items-center">
				<div class="col-sm-6">
					<h4 class="page-title">Dashboard</h4>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			 <form id="idForm">
				<div class="card">
					<div class="card-body">
						<div class="form-group row mb-0">
						 
							<label for="" class="col-sm-2 col-form-label">Select District</label>
							<div class="col-sm-4 mb-1">
								<select id="district_name" name="district_name" class="multiselect-ui form-control district_name" multiple="multiple" style="display: none" >
									<option value="Baleshwar">Baleshwar</option>
									<option value="Bhadrak">Bhadrak</option>
									<option value="Cuttack">Cuttack</option>
									<option value="Ganjam">Ganjam</option>
									<option value="Jajpur">Jajpur</option>
									<option value="Khurdha">Khurdha</option>
									<option value="Puri">Puri</option>
									<option value="Kendrapara">Kendrapara</option>
									<option value="Jagatsinghapur">Jagatsinghapur</option>
								</select>
							</div>
							<div class="col-sm-1">
								<input type="submit" id="btnsubmit" value="Submit"class="btn btn-success waves-effect waves-light" >								
							</div>
							<div class="col-sm-1">
								<input type="reset" onclick="window.location.reload()" id=""
										value="Reset" class="btn btn-warning waves-effect waves-light">								
							</div>																					
							<div class="col-sm-5">
								<label for="" class="col-form-label">District Selected :</label> 
								<span id="distselected" class="pt-2 header-title"></span>
							</div>							
						</div>
					</div>
				</div>
				 </form>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="page-title-box pt-0">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-title">Coastal Infrastructure</h4>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-2 col-sm-6 col-xs-12">
				<div class="card mini-stat bg-danger text-white">
					<div class="card-body">
						<div class="mb-2" style="min-height: 60px">
							<div class="float-right mini-stat-img ml-2">
								<h4 class="font-500 text-white-75" id="port">
									<c:forEach items="${countAll}" var="countAll"></c:forEach>${countAll.list[0]}
								</h4>
							</div>
							<h5 class="font-14 text-uppercase mt-0">Port</h5>
						</div>
						<div class="mini-border clearfix"></div>
						<div class="pt-3 mini-link">
							<a href="/clickViewDetails?name=PORT"><span class="mb-0 font-13">View Details<i class="mdi mdi-arrow-right h5"></i></span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-12">
				<div class="card mini-stat bg-warning text-white">
					<div class="card-body">
						<div class="mb-2" style="min-height: 60px">
							<div class="float-right mini-stat-img ml-2">
								<h4 class="font-500 text-white-75" id="harbour">
									<c:forEach items="${countAll}" var="countAll"></c:forEach>
									${countAll.list[1]}
								</h4>
							</div>
							<h5 class="font-14 text-uppercase mt-0">Harbour</h5>
						</div>
						<div class="mini-border clearfix"></div>
						<div class="pt-3 mini-link">
							<a href="/clickViewDetails?name=FISHING HARBOUR"><span class="mb-0 font-13">View Details<i class="mdi mdi-arrow-right h5"></i></span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-12">
				<div class="card mini-stat bg-success text-white">
					<div class="card-body">
						<div class="mb-2" style="min-height: 60px">
							<div class="float-right mini-stat-img ml-2">
								<h4 class="font-500 text-white-75" id="flc">
									<c:forEach items="${countAll}" var="countAll"></c:forEach>
									${countAll.list[2]}
								</h4>
							</div>
							<h5 class="font-14 text-uppercase mt-0">FISH LANDING CENTER</h5>
						</div>
						<div class="mini-border clearfix"></div>
						<div class="pt-3 mini-link">
							<a href="/clickViewDetails?name=FLC"><span class="mb-0 font-13">View Details<i class="mdi mdi-arrow-right h5"></i></span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 col-xs-12">
				<div class="card mini-stat bg-primary text-white">
					<div class="card-body">
						<div class="mb-2" style="min-height: 60px">
							<div class="float-right mini-stat-img ml-2" >
								<h4 class="font-500 text-white-75" id="jetties">
									<c:forEach items="${countAll}" var="countAll"></c:forEach>
									${countAll.list[3]}
								</h4>
							</div>
							<h5 class="font-14 text-uppercase mt-0">Jetties</h5>
						</div>
						<div class="mini-border clearfix"></div>
						<div class="pt-3 mini-link">
							<a href="/clickViewDetails?name=JETTIES"><span class="mb-0 font-13">View Details<i class="mdi mdi-arrow-right h5"></i></span></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-2 col-sm-6 col-xs-12">
				<div class="card mini-stat bg-info text-white">
					<div class="card-body">
						<div class="mb-2" style="min-height: 60px">
							<div class="float-right mini-stat-img ml-2">
								<h4 class="font-500 text-white-75"  id="lh">
									<c:forEach items="${countAll}" var="countAll"></c:forEach>
									${countAll.list[4]}
								</h4>
							</div>
							<h5 class="font-14 text-uppercase mt-0">Light House</h5>
						</div>
						<div class="mini-border clearfix"></div>
						<div class="pt-3 mini-link">
							<a href="/clickViewDetails?name=LIGHT_HOUSE"><span class="mb-0 font-13">View Details<i class="mdi mdi-arrow-right h5"></i></span></a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-2 col-sm-6 col-xs-12">
                    <div class="card mini-stat bg-dark text-white">
                        <div class="card-body">
                            <div class="mb-2" style="min-height:60px">
                                <div class="float-right mini-stat-img ml-2">
                                    <h4 class="font-500 text-white-75" id="cyclone">
                                    <c:forEach items="${countAll}" var="countAll"></c:forEach>
									${countAll.list[5]}
                                    </h4>
                                </div>
                                <h5 class="font-13 text-uppercase mt-0">MULTI-PURPOSE CYCLONE SHELTERS</h5>
                            </div>
                            <div class="mini-border clearfix"></div>
                            <div class="pt-3 mini-link">
                                <a href="/clickViewDetails?name=mcs"><span class="mb-0 font-13">View Details<i class="mdi mdi-arrow-right h5"></i></span></a>
                            </div>
                        </div>
                    </div>
                </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h4 class="mt-0 header-title">Coastal Area Details</h4>
						<div class="morris-charts morris-chart-height">


							<div class="table-responsive">
								<table class="table table-bordered mb-0">
									<thead class="thead-light">
										<tr>
											<th>Sl. No.</th>
											<th>Title</th>
											<th>Figures</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>1</th>
											<td>No. of Tehsil</td>
											<td><span class="badge badge-success font-14" id="tehsil"> <c:forEach
														items="${countAll}" var="countAll"></c:forEach>
													${countAll.list[6]}
											</span></td>
										</tr>
										<tr>
											<th>2</th>
											<td>No. of Villages</td>
											<td><span class="badge badge-warning font-14" id="village"> <c:forEach
														items="${countAll}" var="countAll"></c:forEach>
													${countAll.list[7]}
											</span></td>

										</tr>
										<tr>
											<th>3</th>
											<td>Aquaculture pond area</td>
											<td><span class="badge badge-aquapond font-14" id="totalacuapond"> <c:forEach
														items="${countAll}" var="countAll"></c:forEach>
													${countAll.list[8]} ha.
											 </span></td>
										</tr>
										<tr>
											<th>4</th>
											<td>No. of Aquaculture pond</td>
											<td><span class="badge badge-success font-14" id="acuapond">
													<c:forEach items="${countAll}" var="countAll"></c:forEach>
													${countAll.list[9]}
											</span></td>
											
										</tr>
										<tr>
											<th>5</th>
											<td>No. of Registered Farms</td>
											<td><span class="badge badge-govtland font-14"  id="farms"> <c:forEach
														items="${countAll}" var="countAll"></c:forEach>
													${countAll.list[10]} 
											</span></td>
										</tr>
										<tr>
											<th>6</th>
											<td>Feasible govtland area</td>
											<td>
											<span class="badge badge-govtfeasland font-14" id="govtland">${countAll.list[12]} ha.</span>
											</td>

										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h4 class="mt-0 header-title">Coastal Area Map</h4>
						<div class="map-wrapper">
							<a class="nav-link waves-effect mapBtn" href="#"><i
								class="mdi mdi-fullscreen noti-icon"></i></a>
							<div id="map" class="morris-chart-height" width="100%"
								height="100%" style="border: 0">


								<div id="popup" class="ol-popup">
									<a href="#" id="popup-closer" class="ol-popup-closer"></a>
									<div id="popup-content"></div>
								</div>
							</div>
						</div>
						<img src=<spring:url value="/images/map-details.jpg"/>
							class="img-fluid" style="height: 20px; position: absolute">
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-12 text-center" id="">
				<h4 class="header-title" id="district_selected"></h4>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="mt-0 header-title">Govt.Land & Feasible Land
							Information(in ha.)</h4>
						<div id="govt-fesland" class="morris-charts morris-chart-height"></div>
						<img src="<spring:url value="/images/map-details-02.jpg"/>"
							class="img-fluid" style="height: 20px; position: absolute">
					</div>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="mt-0 header-title">Aqua Pond and CAA-Registered
							Farm Information(in ha.)</h4>
						<div id="chartaquapond" class="morris-charts morris-chart-height"></div>
						<img src="<spring:url value="/images/map-details-06.jpg"/>"
							class="img-fluid" style="height: 20px; position: absolute">

					</div>
				</div>
			</div>
			</div>
			<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="mt-0 header-title">Registered Farm Information(in
							ha.) Provided by Fisheries Department</h4>
						<div id="chartregdfarm" class="morris-charts morris-chart-height"></div>
						<img src="<spring:url value="/images/map-details-03.jpg"/>"
							class="img-fluid" style="height: 20px; position: absolute">

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src='<spring:url value="/plugins/chartist/js/chartist.min.js"/>'></script>
<script type="text/javascript" src='<spring:url value="/plugins/morris/morris.min.js"/>'></script>
<%-- <script type="text/javascript"src='<spring:url value="/plugins/morris/morris.css"/>'></script> --%>
<script type="text/javascript" src='<spring:url value="/plugins/raphael/raphael-min.js"/>'></script>
<script type="text/javascript" src='<spring:url value="/plugins/peity-chart/jquery.peity.min.js"/>'></script>
<%-- <script type="text/javascript"src='<spring:url value="/plugins/chartist/css/chartist.min.css"/>'></script> --%>
<script type="text/javascript" src='<spring:url value="/plugins/chartist/js/chartist-plugin-tooltip.min.js"/>'></script>
<script src="https://openlayers.org/en/v4.6.5/build/ol-debug.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.4.3/proj4.js"></script>
<script src="https://unpkg.com/ol-popup@4.0.0"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/reqwest/2.0.5/reqwest.min.js"></script>
<script
	src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://epsg.io/32645.js"></script>
<script src="<spring:url value="/js/config.js"/>"></script>

<script type="text/javascript">
	var expanded = false;
	$(function() {
		$('.multiselect-ui').multiselect({

		});
	});

	$(function() {
		$('[id*=ddldist]').multiselect({
			includeSelectAllOption : true
		});
	}); 
	
	
	$(document).ready(function(){
		$(document).ajaxSend(function() {
			$("#loaderdiv").show();
		}).ajaxComplete(function() {
			$("#loaderdiv").hide();
		});
		//var district_all="all";
		dashboard_All();
	});
		function dashboard_All()
		{			
			$.ajax({			
	            type: "POST",
	            url:"/dashboard2/all",
	        	contentType : "application/json",
				dataType : "json",
				//data : 'district':district_all,
				success : function(data) 
				{
					//var result = JSON.parse(data);
					//console.log(data);
					$('#port').html(data.list[0]);
					
					$('#harbour').html(data.list[1]);
					$('#flc').html(data.list[2]);
					$('#jetties').html(data.list[3]);
					$('#lh').html(data.list[4]);
					$('#cyclone').html(data.list[5]);
					$('#tehsil').html(data.list[6]);
					$('#village').html(data.list[7]);
					$('#totalacuapond').html(data.list[8]+' ha.');
					$('#acuapond').html(data.list[9]);
					$('#farms').html(data.list[10]);
					//$('#regfarms').html(data.list[11]+' ha.');//reg.farm area
					$('#govtland').html(data.list[12]+' ha.');
					chartInfoAll(data);				
						
				},
				error : function(errormessage) {
					alert(errormessage.responseText);

				}
				

			});
			
		    $('.map-wrapper .mapBtn').click(function()
		    		{
						$(this).toggleClass('hide');
						$(this).siblings().not(this).toggleClass('activeMap');
					});
		    
		    
		    $('#distselected').html("ALL");
			$('#district_selected').html("ALL");		
			//tehzoom();
			distlayer.getSource().updateParams({'CQL_FILTER' : "dist_name='" + $('#district_selected').text() + "'"});
			distlayer.setVisible(true);
		}
		function chartInfoAll(datas){
			$("#chartaquapond").empty();
			$("#govt-fesland").empty();
			$("#chartregdfarm").empty();
			var data = [];
			var data1 = [];
			var data2 = [];
			var aqpond = "";			
			for (i = 0; i < datas.distListFinal.length; i++) { 					
				  var aqpnd = {
						y : datas.distListFinal[i],
						a : datas.value2[i],
						b : datas.value3[i]							
					};
					data.push(aqpnd);
				}
			for (i = 0; i < datas.value111.length; i++) { 					
				  var fesld = {
						  y : datas.value111[i],
						  a : datas.value333[i],
						  b : datas.value777[i],
						  c : datas.value222[i]					
					};
					data1.push(fesld);
				} 	
			for (i = 0; i < datas.value444.length; i++) { 					
				  var regland = {
						  y : datas.value444[i],
						  a : datas.value555[i],
						  b : datas.value666[i]						
					};
					data2.push(regland);
				} 	
				
			Morris.Bar({
				
				element : 'chartaquapond',
				barSize : '50',
				barSizeRatio : 0.55,
				data : data,
				xkey : 'y',
				ykeys : [ 'a', 'b' ],
				labels : [ 'Total Aquapond area(ha.) :',
						'Total Caa-Reg Farm area(ha.) :' ],
				barColors : [ "#1a24e8", "#222222" ],
				hideHover : 'auto',
				// ymax:17000,
				resize : true
			});
			Morris.Bar({
						//alert("bjnbh")
						element : 'govt-fesland',
						barSize : '50',
						barSizeRatio : 0.55,
						data : data1,
						xkey : 'y',
						ykeys : [ 'a', 'b' ,'c'],
						labels : [],
						barColors : [ "#b12e0d", "#757575","#757576" ],
						hideHover : 'auto',
						hoverCallback : function(index, options,content, row) 
						{
							var hover = "<div class='morris-hover-row-label'>"
									+ row.y
									+ "</div><div class='morris-hover-point'style='color: #A4ADD3'><p color:black>Total Govt Land(in ha.):"
									+ row.a
									+ "</p></div><div class='morris-hover-point'style='color: #A4ADD3'><p color:black>Total Feasible Land(in ha.):"
									+ row.b
									+ "</p></div><div class='morris-hover-point'style='color: #A4ADD3'><p color:black>Total no. of Feasible Land :"
									+ Math.round(row.c) + "</p></div>";
							return hover;
						},
						resize : true
					});
			Morris.Bar({
				//alert("bjnbh")
				element : 'chartregdfarm',
				barSize : '50',
				barSizeRatio : 0.55,
				data : data2,
				xkey : 'y',
				ykeys : [ 'a', 'b' ],
				labels : [ 'Total Area(in ha.) :',
						'Total No. Of Registered Farms :' ],
				barColors : [ "#222222", "#ffc400" ],
				hideHover : 'auto',
				resize : true
			});
						
					}
						
						
		
	
							
						
	
	function tehzoom() {
		var dist = $('#district_selected').text();
		if (dist == "Jajpur") {
			dist = "Jajapur";
		}
		//villstdylayer.setVisible(false);
		var vectorSource = new ol.source.Vector();
		var vector = new ol.layer.Vector({
			source : vectorSource,
			style : new ol.style.Style({
				stroke : new ol.style.Stroke({
					color : 'rgb(0, 119, 158)',
					width : 2
				})
			})
		});
		map.addLayer(vector);
		var featureRequest = new ol.format.WFS().writeGetFeature({
			srsName : 'EPSG:3857',
			featurePrefix : 'osm',
			featureTypes : [ 'District_Boundary' ],
			outputFormat : 'application/json',
			filter : new ol.format.filter.equalTo('dist_name', dist)
		});
		fetch(baseURLWFS, {
			method : 'POST',
			body : new XMLSerializer().serializeToString(featureRequest)
		}).then(function(response) {
			return response.json();
		}).then(function(json) {
			var features = new ol.format.GeoJSON().readFeatures(json);
			vectorSource.addFeatures(features);
			map.getView().fit(vectorSource.getExtent());

		});
						
	}			
	
	var baselayer = new ol.layer.Tile({
		type : 'base',
		title : 'Google Streetmaps',
		visible : true,
		source : new ol.source.OSM({
			url : 'https://mt{0-3}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}'
		})
	});
	var raster = new ol.layer.Tile({
		type : 'base',
		title : 'Google Satelite',
		visible : true,
		source : new ol.source.TileImage({
			url : 'https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}'
		})
	});
	var carto = new ol.layer.Tile(
			{
				title : 'Cartography',
				type : 'base',
				source : new ol.source.XYZ(
						{
							url : 'https://{1-4}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png'
						})
			});
	var vectorLayer = new ol.layer.Vector({
		source : new ol.source.Vector()
	});
	
	var stateboundarylayer = new ol.layer.Image(
			{
				source : new ol.source.ImageWMS(
						{
							url : baseURLWMS,
							params : {
								'LAYERS' : 'COAST:StateBoundary',
								'VERSION' : '1.1.0'
							},
							serverType : 'geoserver'

						})
			});
	var caaboundary = new ol.layer.Image(
			{
				source : new ol.source.ImageWMS(
						{
							url : baseURLWMS,
							params : {
								'LAYERS' : 'COAST:CAA_Boundary_2k_from_HTL',

								'VERSION' : '1.1.0'
							},
							serverType : 'geoserver'

						})
			});
	var HTL = new ol.layer.Image(
			{
				source : new ol.source.ImageWMS(
						{
							url : baseURLWMS,
							params : {
								'LAYERS' : 'COAST:HTL',

								'VERSION' : '1.1.0'
							},
							serverType : 'geoserver'

						})
			});
	var distlayer = new ol.layer.Image(
			{
				source : new ol.source.ImageWMS(
						{
							url : baseURLWMS,
							params : {
								'LAYERS' : 'COAST:District_Boundary',
								'VERSION' : '1.1.0'
							},
							serverType : 'geoserver'

						})
			});
	var map = new ol.Map({
		layers : [ baselayer, carto, raster, vectorLayer, stateboundarylayer,
				caaboundary, HTL, distlayer ],
		target : 'map',
		view : new ol.View({
			center : ol.proj.fromLonLat([ 85.190055, 20.886785 ]),
			zoom : 7,
			maxZoom : 23,
			minZoom : 5,
		})
	});
	var popup = new Popup();
	map.addOverlay(popup);
	baselayer.setVisible(true);
	//carto.setVisible(false),
	raster.setVisible(false);
	vectorLayer.setVisible(false);
	//distlayer.setVisible(true);
	$('#ddllandtype').on('change', function() {
		if (this.value == 'Search Registered Aqua-Farm') {
			$("#serchdiv").show();

		}
	});
	
	$("#idForm").submit(function(e) {
		//loader call
		$(document).ajaxSend(function() {
			$("#loaderdiv").show();
		}).ajaxComplete(function() {
			$("#loaderdiv").hide();
		});
		
		e.preventDefault(); //avoid to execute the actual submit of the form.
		var form = $(this);
		var distname = new Array();
		$("#district_name :selected").each(function() 
		{
			var dist=this.value;
			distname.push(dist);
		});
		var dist_len=distname.length;
		if (dist_len >= 1) 
		{
			$('#distselected').html(distname.toString());
			$('#district_selected').html(distname.toString());
			
			    var cql = "dist_name='" + distname + "'";
				var a = '';
				for (var i = 0; i < distname.length; ++i) 
				{
					a = a + "dist_name='" + distname[i] + "'" + " OR ";
				}
				var queryLast = a.substring(0, a.length - 4);
				distlayer.getSource().updateParams({'CQL_FILTER' : queryLast});
				distlayer.setVisible(true);
				distzoom(distname); 

		$.ajax({
			type : "POST",
			url : "/dashboard",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(distname),
			success : function(data) {	
				//console.log(data)
				$('#port').html(data.list[0]);				
				$('#harbour').html(data.list[1]);
				$('#flc').html(data.list[2]);
				$('#jetties').html(data.list[3]);
				$('#lh').html(data.list[4]);
				$('#cyclone').html(data.list[5]);
				$('#tehsil').html(data.list[6]);
				$('#village').html(data.list[7]);
				$('#totalacuapond').html(data.list[8]+' ha.');
				$('#acuapond').html(data.list[9]);
				$('#farms').html(data.list[10]);
				//$('#regfarms').html(data.list[11]+' ha.');//reg.farm area
				$('#govtland').html(data.list[12]+' ha.');
				chartInfo(data);
			
			}
		});	
		}
		else
			{
			  dashboard_All();
			}
	});
		
	function distzoom(distname) 
	 {	 	
		/* if(dist_current_layer!=null){
	        map.removeLayer(dist_current_layer);
	     } if(tehsil_current_layer!=null){
	            map.removeLayer(tehsil_current_layer);
	     }if(gp_current_layer!=null){
	        map.removeLayer(gp_current_layer);
	     }
	     if(vill_current_layer!=null){
	        map.removeLayer(vill_current_layer);
	    } */
		//clearlayer();
		var vectorSource = new ol.source.Vector();	
		var styles =new ol.style.Style({
	        stroke : new ol.style.Stroke({
	 				color : 'rgb(128, 14, 15)',
	 				width : 3,
	                //lineDash: [.1, 5] //or other combinations
	               }),
	               //zIndex: 2,
	             fill: new ol.style.Fill({
	                 color: 'rgba(255, 235, 235, 0.1)',
	                }),
	            text: new ol.style.Text({
	            font: 'bold 14px Calibri,sans-serif',
	            fill: new ol.style.Fill({
	                color: '#eb7734'
	                })
	            })
	       });
		var gjFormat =  new ol.format.GeoJSON({
	        featureProjection: 'EPSG:3857',
	     });
		var param='dist='+$('#ddldist').val();
	 	fetch('/geojson/getDistrictJson?'+param, {
	 		method : 'GET',
	 	}).then(function(response) {
	 		return response.json();
	 	}).then(function(json) {
	 		var vectorLayer = new ol.layer.Vector({
	 	 		source : vectorSource,
	 	         style: function() {
	 	                      styles.getText().setText($('#ddldist').val());
	 	                      return styles;
	 	                    },
		       updateWhileAnimating: true,
		       updateWhileInteracting: true
	 	 	});
	 		var features =gjFormat.readFeatures(json.geojson);
	 		map.addLayer(vectorLayer);
	 	    //dist_current_layer=vectorLayer;
	 	    vectorLayer.getSource().addFeatures(features);
	 		map.getView().fit(vectorSource.getExtent());
	 	}); 	
	 }
	
				
				//Morris Chart
				function chartInfo(datas){					
					//alert("hello");
					$("#chartaquapond").empty();
					$("#govt-fesland").empty();
					$("#chartregdfarm").empty();
					var data = [];
					var data1 = [];
					var data2 = [];
					var aqpond = "";
					
					for (i = 0; i < datas.distListFinal.length; i++) { 					
					  var aqpnd = {
							y : datas.distListFinal[i],
							a : datas.value2[i],
							b : datas.value3[i]							
						};
						data.push(aqpnd);
					} 	
					for (i = 0; i < datas.tehsilListFinal.length; i++) { 					
						  var fesld = {
								  y : datas.tehsilListFinal[i],
								  a : datas.value22[i],
								  b : datas.value33[i],
								  c : datas.value11[i]					
							};
							data1.push(fesld);
						} 	
					for (i = 0; i < datas.value111.length; i++) { 					
						  var regland = {
								  y : datas.value111[i],
								  a : datas.value222[i],
								  b : datas.value333[i]						
							};
							data2.push(regland);
						} 	
						
					Morris.Bar({
						
						element : 'chartaquapond',
						barSize : '50',
						barSizeRatio : 0.55,
						data : data,
						xkey : 'y',
						ykeys : [ 'a', 'b' ],
						labels : [ 'Total Aquapond area(ha.) :',
								'Total Caa-Reg Farm area(ha.) :' ],
						barColors : [ "#1a24e8", "#222222" ],
						hideHover : 'auto',
						// ymax:17000,
						resize : true
					});
					Morris.Bar({
								//alert("bjnbh")
								element : 'govt-fesland',
								barSize : '50',
								barSizeRatio : 0.55,
								data : data1,
								xkey : 'y',
								ykeys : [ 'a', 'b' ],
								labels : [],
								barColors : [ "#b12e0d", "#757575" ],
								hideHover : 'auto',
								hoverCallback : function(index, options,content, row) 
								{
									var hover = "<div class='morris-hover-row-label'>"
										+ row.y
										+ "</div><div class='morris-hover-point'style='color: #b12e0d'><p color:color:black>Total Govt Land(in ha.):"
										+ row.a
										+ "</p></div><div class='morris-hover-point'style='color: #757575'><p color:black>Total Feasible Land(in ha.):"
										+ row.b
										+ "</p></div><div class='morris-hover-point'style='color: #757575'><p color:black>Total no. of Feasible Land :"
										+ Math.round(row.c) + "</p></div>";
								return hover;
								},
								resize : true
							});
					Morris.Bar({
						//alert("bjnbh")
						element : 'chartregdfarm',
						barSize : '50',
						barSizeRatio : 0.55,
						data : data2,
						xkey : 'y',
						ykeys : [ 'a', 'b' ],
						labels : [ 'Total Area(in ha.) :',
								'Total No. Of Registered Farms :' ],
						barColors : [ "#222222", "#ffc400" ],
						hideHover : 'auto',
						resize : true
					});
					
					
				}
	
	
</script>
