<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<jsp:include page="master.jsp" />
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css"> -->
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js "></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<!-- <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script> -->

<div class="page-loader" id="loaderdiv" style="display: none"><img src="<spring:url value="/images/loader.gif"/>"alt="loader" />

</div>
<div class="content-page">
	<div class="container-fluid">
		<div class="page-title-box">
			<div class="row align-items-center">
				<div class="col-sm-6">
					<h4 class="page-title">
					    <%=session.getAttribute("type_name")%>
					</h4>
				</div>
				<div class="col-sm-6">
	                    <ol class="breadcrumb">
	                       <li class="breadcrumb-item"><a href='/dashboard1'>Home</a></li>
					  	   <li class="breadcrumb-item"><a  href='/LandReport'>Land Report</a></li>
					       <li class="breadcrumb-item active"> <%=session.getAttribute("type_name")%></li>
	                    </ol>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="clearfix">
              	  <div class="mb-0 collapse show" id="collapseExample">
					<div class="card">
					  <div class="card-body" style="padding:1.25rem">
						<div class="form-group row mb-0">
							<label for="" class="col-sm-1 col-form-label">District<span class="text-danger"> *</span></label>
							<div class="col-sm-2">
								<select id="ddldist" name="ddldist"
									onchange="projselect(this.value)"
									class="form-control custom-select">
									<option value="">-- Select --</option>
									<option value="Baleshwar">Baleshwar</option>
									<option value="Bhadrak">Bhadrak</option>
									<option value="Cuttack">Cuttack</option>
									<option value="Ganjam">Ganjam</option>
									<option value="Jajapur">Jajapur</option>
									<option value="Khurdha">Khurdha</option>
									<option value="Puri">Puri</option>
									<option value="Kendrapara">Kendrapara</option>
									<option value="Jagatsinghapur">Jagatsinghapur</option>
								</select>
							</div>
							<label for="" class="col-sm-1 col-form-label" id="lbltehsil">Tehsil<span class="text-danger"> *</span></label>
							<div class="col-sm-2 mb-2" id="divtehsil">
								<select class="form-control custom-select" id="ddltehesil"
									onchange="bindgp(this.value)">
									<option value="ALL">-- Select --</option>
								</select>
							</div>
							<!-- <label for="" class="col-sm-1 col-form-label" id="lbltehsil">GP<span class="text-danger"> *</span></label>
							<div class="col-sm-2 mb-2" id="divtehsil">
								<select class="form-control custom-select" id="ddlgp"
									name="ddlgp" onchange="bindvillage(this.value)">
									<option value="ALL">-- Select --</option>
								</select>

							</div>
							<label for="" class="col-sm-1 col-form-label" id="lbltehsil">Village<span class="text-danger"> *</span></label>
							<div class="col-sm-2 mb-2" id="divtehsil">
								<select class="form-control custom-select" id="ddlvillage">
									<option value="ALL">-- Select --</option>
								</select>
							</div> -->
							<label for="" class="col-sm-1 col-form-label"></label>
							<div class="form-group row mb-0">
							<div class="col-sm-12 text-center">
								<input type="submit" id="sub" value="Submit"
									class="btn btn-success waves-effect waves-light" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
							</div>
						</div>
						</div>
						<!-- <hr/> -->
						
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		<div class="row mt-2" id="showLtlDiv">
            <div class="col-xl-12 text-center">
                <a style="display:none" id="showLtl" class="btn btn-sm btn-success collapsed" data-toggle="collapse" href="#collapseExample" aria-expanded="true" 
                aria-controls="collapseExample"><i class="fa fa-arrow-down fa-arrow-up"></i></a>
            </div>
        </div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						
						<div class="tab-pane" id="tab2" role="tabpanel">
							<button id="pdf" type="button"
								class="btn btn-sm btn-danger waves-effect waves-light mb-2">
								<i class="fas fa-file-pdf"></i>
							</button>
							<button id="csv" type="button"
								class="btn btn-sm btn-success waves-effect waves-light mb-2">
								<i class="fas fa-file-excel"></i>
							</button>
							<button id="print" type="button"
								class="btn btn-sm btn-warning waves-effect waves-light mb-2">
								<i class="fas fa-print"></i>
							</button>
		
							<div class="table-responsive" id="tblprint"
								style="height: 400px; overflow-y: scroll">
								<table id="myData"
									class="table table-striped table-bordered nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%">
									<thead>
										<tr>
											<th>Sl.No.</th>
											<th>District</th>
											<th>Tehsil</th>
											<!-- <th>GP</th>
											<th>Village</th> -->
											<th>Plot No.</th>
											<th>Area(in acre)</th>
										</tr>
									</thead>
									<tbody class="tbody"></tbody>
								</table>
								<table id="targetT" style="display: none"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<spring:url value="/js/tableHTMLExport.js"/>"></script>
<!-- <script src="https://unpkg.com/ol-popup@4.0.0"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.5/jspdf.plugin.autotable.min.js"></script>
<script src="https://rawgit.com/simonbengtsson/jsPDF-AutoTable/master/dist/jspdf.plugin.autotable.js"></script>
<script type="text/javascript">
$("#pdf").click(function () {
    $('.custom-hide').hide();
    var doc = new jsPDF('l', 'pt');
    var res = doc.autoTableHtmlToJson(document.getElementById("myData"));
    var header = function (data) {
        doc.setFontSize(18);
        doc.setTextColor(40);
        doc.setFontStyle('normal');
        doc.text("Feasible Govt. Land Report", data.settings.margin.left, 50);
    };
    var options = {
        beforePageContent: header,
        margin: {
            top: 80
        }

    };
    doc.autoTable(res.columns, res.data, options);
    doc.save("table.pdf");
    $('.custom-hide').show();
})

$("#csv").click(function () {
    var $target = $("#targetT");
    $("#myData tr").each(function () {
        var $tds = $(this).children(),
            $row = $("<tr></tr>");
        $row.append($tds.eq(0).clone()).append($tds.eq(1).clone()).append($tds.eq(2).clone()).append($tds.eq(3).clone()).append($tds.eq(4).clone()).append($tds.eq(5).clone()).append($tds.eq(6).clone()).appendTo($target);
    });
    $("#targetT").tableHTMLExport({
        // csv, txt, json, pdf
        type: 'csv',
        orientation: 'p',
        filename: 'report.csv',
        separator: ',',
        newline: '\r\n',
        trimContent: true,
        quoteFields: true,
        

    });
})

$("#print").click(function () {
    $('.custom-hide').hide();
    $('.hiddata').hide();
    var divToPrint = document.getElementById('tblprint');

    var newWin = window.open('', 'Print-Window');

    newWin.document.open();

    newWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');

    newWin.document.close();

    setTimeout(function () { newWin.close(); }, 10);
    $('.custom-hide').show();
    $('.hiddata').show();
});


function projselect(distname) {
		$.ajax({
			url : "/getTehsil/" + distname + "",
			type : "GET",
			success : function(data) {
				$(document).ajaxSend(function() {
         			$("#loaderdiv").show();
         		}).ajaxComplete(function() {
         			$("#loaderdiv").hide();
         		});
				var result = JSON.parse(data);
				var options = '';
				$('#ddltehesil').html('');
				$('#ddltehesil').append($("<option></option>").attr("value", "").text("-- Select --"));
				var options = '';
				/* $('#ddlgp').html('');
				$('#ddlgp').append($("<option></option>").attr("value", "").text("--Select--"));
				var options = '';
				$('#ddlvillage').html('');
				$('#ddlvillage').append($("<option></option>").attr("value", "").text("ALL")); */
				for (var i = 0; i < result.length; i++) {
					options += '<option value="' +result[i] + '">' + result[i]+ '</option>';
					$('#ddltehesil').append($("<option></option>").attr("value", result[i]).text(result[i]));
				}
			},
			error : function(errormessage) {
				alert('error');
				alert(errormessage.responseText);
			}
		});
	}
	function bindgp(tehsil) {
		var gp = "";
		$.ajax({
			url : "/getGp/",
			data : {
				'tehsil' : tehsil,
				'dist' : $('#ddldist option:selected').text()
			},
			type : "GET",
			success : function(data) {
				console.log(data);
				$('#ddlgp').html('');
				var result = JSON.parse(data);
				var options = '';
				$('#ddlgp')
						.append(
								$("<option></option>").attr("value", "ALL")
										.text("ALL"));
				$('#ddlvillage').html('');
				$('#ddlvillage').append($("<option></option>").attr("value", "").text("ALL"));
				for (var i = 0; i < result.length; i++) {
					options += '<option value="' +result[i] + '">' + result[i]
							+ '</option>';
					$('#ddlgp').append(
							$("<option></option>").attr("value", result[i])
									.text(result[i]));
				}
			},
			error : function(errormessage) {
				alert('Server Error');
			}
		});
		//bindvillage();
	}
	function bindvillage(gp) {
		var vill = "";
		$.ajax({
			//url: "/coast/getVillage/",
			url : "/getVillage/",
			data : {
				'gp' : gp,
				'dist' : $('#ddldist option:selected').text(),
				'tehsil' : $('#ddltehesil option:selected').text()
			},
			type : "GET",
			success : function(data) {
				$('#ddlvillage').html('');
				var result = JSON.parse(data);
				var options = '';
				$('#ddlvillage')
						.append(
								$("<option></option>").attr("value", "ALL")
										.text("ALL"));
				for (var i = 0; i < result.length; i++) {
					options += '<option value="' +result[i] + '">' + result[i]
							+ '</option>';
					$('#ddlvillage').append(
							$("<option></option>").attr("value", result[i])
									.text(result[i]));
				}
			},
			error : function(errormessage) {
				alert(errormessage.responseText);
			}
		});
	}
	function bindplotno(village) {
		var vill = "";
		$.ajax({
			//url: "/coast/getPlotno/",
			url : "/getPlotno/",
			data : {
				'village' : village,
				'gp' : $('#ddlgp option:selected').text(),
				'dist' : $('#ddldist option:selected').text(),
				'tehsil' : $('#ddltehesil option:selected').text()
			},
			type : "GET",
			success : function(data) {
				$('#txtplotno').html('');
				var result = JSON.parse(data);
				var options = '';
				$('#txtplotno')
						.append(
								$("<option></option>").attr("value", "ALL")
										.text("ALL"));
				for (var i = 0; i < result.length; i++) {
					options += '<option value="' +result[i] + '">' + result[i]
							+ '</option>';
					$('#txtplotno').append(
							$("<option></option>").attr("value", result[i])
									.text(result[i]));
				}
			},
			error : function(errormessage) {
				alert(errormessage.responseText);
			}
		});
	}
</script>
<script type="text/javascript">
/* var baselayer = new ol.layer.Tile({
    type: 'base',
    title: 'Google Streetmaps',
    visible: true,
    source: new ol.source.OSM({
        url: 'https://mt{0-3}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}'
    })
});
var raster = new ol.layer.Tile({
    type: 'base',
    title: 'Google Satelite',
    visible: true,
    source: new ol.source.TileImage({
        url: 'https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}'
    })
});
var carto = new ol.layer.Tile({
    title: 'Cartography',
    type: 'base',
    source: new ol.source.XYZ({
        url: 'https://{1-4}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png'
    })
});
var vectorLayer = new ol.layer.Vector({
    source: new ol.source.Vector()
});
var bingMap = new ol.layer.Tile({
    title: 'Bing Map',
    visible: false,
    type: 'base',
    source: new ol.source.BingMaps({
        imagerySet: 'AerialWithLabels',
        key: 'AlWJE3xHQNz1L2UMzA-Sast_AN8AAL4UIuxEpKCUVMUAuNP3FeSyCvltL5FzA2yq'
    })
});
var stateboundarylayer = new ol.layer.Tile({
    source: new ol.source.TileWMS({
        url: 'https://geoserver.odishacoastalaquaculture.in/geoserver/COAST/wms',
        params: {
            'LAYERS': 'COAST:StateBoundary',
            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'
    })
});
var map = new ol.Map({
    layers: [baselayer, carto, raster, vectorLayer, stateboundarylayer],
    controls: ol.control.defaults().extend([
    new ol.control.ScaleLine({
        units: 'metric'
    }),
]),
    target: 'map',
    view: new ol.View({
    center: ol.proj.fromLonLat([85.190055, 20.886785]),
    zoom: 7,
    maxZoom: 23,
    minZoom: 5,
})
});
stateboundarylayer.setVisible(true); */
	 /* $(document).ready(function(){
    	$('#myData').DataTable({
    		 "ordering": true,
    	     "searching": true,
    	     "order": [[1, 'desc']],//set column 1 (time)
    	});
    }); */
				
	/* 		
    $("#sub").click(function () {
        $("#showLtl").show();
    })
    $("#showLtl").click(function (event) {
        $(this).find('i').toggleClass('fa-arrow-up');
    }); */
</script>
<<script type="text/javascript">
$("#sub").click(
		function() {
			$('#showLtl').show();
			$('#tab2').addClass('active');
			var dist = $('#ddldist').val();
			$(document).ajaxSend(function() {
				$("#loaderdiv").show();
			}).ajaxComplete(function() {
				$("#loaderdiv").hide();
			});
			var acode = "${type}";
			var ddldist=$("#ddldist option:selected").text();
			if($("#ddldist").val()==""){
				alert('Please select district!');
				document.getElementById("ddldist").focus();
	            return false;
			}
			if ($('#ddltehesil').val() == ""){
				alert('Please select Tehsil!');
				document.getElementById("ddltehesil").focus();
	            return false;
			}
			/*  if ($('#ddlgp').val() == "ALL") {
				 alert('Please select Gram Panchayat!');
					document.getElementById("ddlgp").focus();
		            return false;
			 }	
					
			 if ($('#ddlvillage').val() == "ALL"){
				 alert('Please select village!');
					document.getElementById("ddlvillage").focus();
		            return false;
			 }  */
						 
			 if(acode=="AQ"){
				if((ddldist=="Cuttack")||(ddldist=="Jajapur")){
				alert("No Data Found");
           		$('#myData tbody').html("No data found");				
				}
				else{
					reportGT_LT_AQ();
				}
			}
			 else if(acode=="GT"){
				 reportGT_LT_AQ();								 
				}
			 else if(acode=="LT"){
				 if((ddldist=="Cuttack")||(ddldist=="Jajapur")||(ddldist=="Khurdha")){
						alert("No Data Found");
		           		$('#myData tbody').html("No data found");				
						}
				 else{
					 reportGT_LT_AQ();
					 }				 						 
				}
			 else if(acode=="FT"){
				 reportGT_LT_AQ();		 
				 }				 						 
				
			function reportGT_LT_AQ(){
				$.ajax({
					type : "GET",
					url : "/report/getGovtLandSummary",
					data : {
						/* 'village' : $('#ddlvillage').val(),
						'gp' : $('#ddlgp').val(), */
						'district' : $('#ddldist').val(),
						'tehsil' : $('#ddltehesil').val(),
						'actionCode' : acode
					},
					
					success : function(data) {
						console.log(data);
						//for refresh the html page
					 $('#myData tbody').empty();
						var sl = 1;
						//var result  = data.parseHTML();
						$.each(data, function(i, item) {
							
									var rows = "<tr>" +
									"<td>" + parseFloat(sl++)+"</td>" 
									+ "<td>" + item[0] + "</td>"
									+ "<td>" + item[1] + "</td>"
									/* + "<td>" + item[2] + "</td>"
									+ "<td>" + item[3] + "</td>"  */
									+ "<td>" + item[4] + "</td>"
									+ "<td>" + item[5] + "</td>" 
									+ "</tr>";
									$('#myData tbody').append(rows);
						});
						rows='<tr><td></td><td></td><td></td><td><b>Total</b></td><td id="sum1"></td></tr>';
						$("#myData").css("display", "table");
						$('.tbody').append(rows);
						$("#myData").css("display", "table");
	                    tablesum();
					},
					error : function(errormessage) {
						alert(errormessage.responseText);
					}
				});
				 function tablesum() {
			            var sum1 = 0;
			            $("#myData tr").not(':first').not(':last').each(function () {
			            	
			                sum1 += parseFloat($(this).find("td:eq(4)").text());
			                
			                });
			            $("#sum1").text(sum1.toFixed(3));
			            
			        }
				
			}
			
			/* 	$('#myData').DataTable( {
				 "order": [[ 3, "desc" ]]
			
				"searching": false,
                "paging": false,
                "autoWidth": true,
                "footerCallback": function (row, data, start, end, display) {
                    var api = this.api();
                    console.log(api);
                    nb_cols = api.columns().nodes().length;
                    var j = 2;
                    while (j < nb_cols) {
                        var pageTotal = api
                            .column(j, { page: 'current' })
                            .data()
                            .reduce(function (a, b) {
                                return Number(a) + Number(b);
                            }, 0);
                        // Update footer
                        $(api.column(j).footer()).html(pageTotal.toFixed(4));
                        j++;
                    }
                }
			}); 
			/* if ( $.fn.dataTable.isDataTable( '#myData' ) ) {
			    table = $('#myData').DataTable();
			}
			else {
			    table = $('#myData').DataTable( {
			        paging: false
			    } );
			} */
			
			///////////
			/* 
	            $('#mydata').DataTable({
	                /* dom: 'Bfrtip',
	                buttons: [
	                ], 
	                "searching": false,
	                "paging": false,
	                "autoWidth": true,
	                "footerCallback": function (row, data, start, end, display) {
	                    var api = this.api();
	                    nb_cols = api.columns().nodes().length;
	                    var j = 2;
	                    while (j < nb_cols) {
	                        var pageTotal = api
	                            .column(j, { page: 'current' })
	                            .data()
	                            .reduce(function (a, b) {
	                                return Number(a) + Number(b);
	                            }, 0);
	                        // Update footer
	                        $(api.column(j).footer()).html(pageTotal.toFixed(4));
	                        j++;
	                    }
	                }
	            }); */
	        
		});
	
	
$("#showLtl").click(function(event) {
	$(this).find('i').toggleClass('fa-arrow-up');
});	
</script>
