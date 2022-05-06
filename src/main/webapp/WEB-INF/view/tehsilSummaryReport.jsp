<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<jsp:include page="master.jsp" />
<div class="page-loader" id="loaderdiv" style="display: none"><img src="<spring:url value="/images/loader.gif"/>"alt="loader" />
</div>
<div class="content-page">
	<div class="container-fluid">
		<div class="page-title-box">
			<div class="row align-items-center">
				<div class="col-sm-6">
					<h4 class="page-title">Tehsil Wise Statics Report</h4>
					<input type="hidden" value="" id="hfName" name="Name" />
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb">
					    <li class="breadcrumb-item"><a href='/dashboard1'>Home</a></li>
						<li class="breadcrumb-item"><a  href='/LandReport'>Land Report</a></li>
					    <li class="breadcrumb-item active">Tehsil Report</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
			<div class="clearfix">
              	  <div class="mb-0 collapse show" id="collapseExample">
				<div class="card">
					<div class="card-body">
						<div class="form-group row mb-0">
							<label for="" class="col-sm-1 col-form-label">District<span class="text-danger"> *</span></label>
							<div class="col-sm-2">
								<select id="ddldist" name="ddldist" onchange="projselect(this.value)"
									class="form-control custom-select">
									<option>-- Select --</option>
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
								<select class="form-control custom-select" id="ddltehesil">
									<option value="">-- Select --</option>
								</select>
							</div>
							<label for="" class="col-sm-1 col-form-label" id="lbl"></label>													
						<div class="form-group row mb-0">
							<div class="col-sm-12 text-center">
								<input type="submit" id="sub" value="Submit"
									class="btn btn-success waves-effect waves-light" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" >
							</div>
						</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2" id="showLtlDiv">
							<div class="col-xl-12 text-center">
								<a style="display: none" id="showLtl"
									class="btn btn-sm btn-success collapsed" data-toggle="collapse"
									href="#collapseExample" aria-expanded="true"
									aria-controls="collapseExample"><i
									class="fa fa-arrow-down fa-arrow-up"></i></a>
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
											<th>District Name</th>
											<th>Tehsil Name</th>
											<th>Total Govt. Land(in acre)</th>
											<th>Govt. Land(in acre)Not Consider for (Kissam/CRZ)</th>
											<th>Govt. Feasible Land(in acre) After (Kissam/CRZ AnalysWis)</th>
											<th>Area of Aqua Ponds within Feasible Land(in acre)</th>
											<th>Area of Registered Land within Feasible Land(in acre)</th>
											<th>Common Area of Registered Land & Aqua within
												Feasible Land(in acre)</th>
											<th>Area of Feasible Land Utilized(in acre)</th>
											<th>Available Feasible Land(in acre)</th>
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
<script src="https://unpkg.com/ol-popup@4.0.0"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.5/jspdf.plugin.autotable.min.js"></script>
    <script src="https://rawgit.com/simonbengtsson/jsPDF-AutoTable/master/dist/jspdf.plugin.autotable.js"></script>
<script type="text/javascript">
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
			$('#ddltehesil').append($("<option></option>").attr("value", "").text('-- Select --'));			
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
	$("#sub").click(function() {
						// $('#tab1').removeClass('active');
						// $('.tab1').removeClass('active');
						//$('.tab2').addClass('active');   
						/* var d=$("#ddldist").val();
						$("#selDist").text(d); */
						$('#showLtl').show();
						$('#tab2').addClass('active');
						$(document).ajaxSend(function() {
							$("#loaderdiv").show();
						}).ajaxComplete(function() {
							$("#loaderdiv").hide();
						});
						var ddldist=$("#ddldist option:selected").text();
						var ddltehesil=$("#ddltehesil option:selected").text();
						if(ddldist=='-- Select --'){
							  alert('Please select district!');
							  document.getElementById("ddldist").focus();
				              return false;
						}
						if(ddltehesil=='-- Select --'){
							  alert('Please select tehsil!');
							  document.getElementById("ddltehesil").focus();
				              return false;
						}
						$.ajax({
								url : "/report/getTehsilSummaryReport",
								data : {'district' : ddldist,
									'tehsil' : ddltehesil,
									},
							    type : "GET",
								success : function(data) 
								{
										console.log(data);
										//for refresh the html page
										$('#myData tbody').html('');
										//var sl = 1;
										//var result  = data.parseHTML();
										$.each(data, function(i, item) {
											var rows = "<tr>" + "<td>"
													+ item[0] + "</td>"
													+ "<td>" + item[1]
													+ "</td>" + "<td>"
													+ item[2] + "</td>"
													+ "<td>" + item[3]
													+ "</td>" + "<td>"
													+ item[4] + "</td>"
													+ "<td>" + item[5]
													+ "</td>" + "<td>"
													+ item[6] + "</td>"
													+ "<td>" + item[7]
													+ "</td>" + "<td>"
													+ item[8] + "</td>"
													+ "<td>" + item[9]
													+ "</td>" + "</tr>";
										$('#myData tbody').append(rows);
										});
										rows = '<tr><td></td><td>Total</td><td id="sum1"></td><td id="sum2"></td><td id="sum3"></td><td id="sum4"></td><td id="sum5"></td><td="sum6"></td><td id="sum7"></td><td id="sum8"></td><td id="sum9"></td></tr>';
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
							var sum2 = 0;
							var sum3 = 0;
							var sum4 = 0;
							var sum5 = 0;
							var sum6 = 0;
							var sum7 = 0;
							var sum8 = 0;
							var sum9 = 0;
							$("#myData tr").not(':first').not(':last').each(
									function() {
										sum1 += parseFloat($(this).find(
												"td:eq(2)").text());
										sum2 += parseFloat($(this).find(
												"td:eq(3)").text());
										sum3 += parseFloat($(this).find(
												"td:eq(4)").text());
										sum4 += parseFloat($(this).find(
												"td:eq(5)").text());
										sum5 += parseFloat($(this).find(
												"td:eq(6)").text());
										sum6 += parseFloat($(this).find(
												"td:eq(6)").text());
										sum7 += parseFloat($(this).find(
												"td:eq(7)").text());
										sum8 += parseFloat($(this).find(
												"td:eq(8)").text());
										sum9 += parseFloat($(this).find(
												"td:eq(9)").text());

									});
							$("#sum1").text(sum1.toFixed(3));
							$("#sum2").text(sum2.toFixed(3));
							$("#sum3").text(sum3.toFixed(3));
							$("#sum4").text(sum4.toFixed(3));
							$("#sum5").text(sum5.toFixed(3));
							$("#sum6").text(sum6.toFixed(3));
							$("#sum7").text(sum7.toFixed(3));
							$("#sum8").text(sum8.toFixed(3));
							$("#sum9").text(sum9.toFixed(3));
						}
					});

	$("#showLtl").click(function(event) {
		$(this).find('i').toggleClass('fa-arrow-up');
	});

	$("#pdf").click(
			function() {
				$('.custom-hide').hide();
				var doc = new jsPDF('l', 'pt');
				var res = doc.autoTableHtmlToJson(document
						.getElementById("myData"));
				var header = function(data) {
					doc.setFontSize(18);
					doc.setTextColor(40);
					doc.setFontStyle('normal');
					doc.text("Feasible Govt. Land Report",
							data.settings.margin.left, 50);
				};
				var options = {
					beforePageContent : header,
					margin : {
						top : 80
					}

				};
				doc.autoTable(res.columns, res.data, options);
				doc.save("table.pdf");
				$('.custom-hide').show();
			})
	$("#csv")
			.click(
					function() {
						var $target = $("#targetT");
						$("#myData tr")
								.each(
										function() {
											var $tds = $(this).children(), $row = $("<tr></tr>");
											$row.append($tds.eq(0).clone())
													.append($tds.eq(1).clone())
													.append($tds.eq(2).clone())
													.append($tds.eq(3).clone())
													.append($tds.eq(4).clone())
													.append($tds.eq(5).clone())
													.append($tds.eq(6).clone())
													.appendTo($target);
										});
						$("#targetT").tableHTMLExport({
							// csv, txt, json, pdf
							type : 'csv',
							orientation : 'p',
							filename : 'report.csv',
							separator : ',',
							newline : '\r\n',
							trimContent : true,
							quoteFields : true,

						});
					})
	$("#print").click(
			function() {
				$('.custom-hide').hide();
				$('.hiddata').hide();
				var divToPrint = document.getElementById('tblprint');

				var newWin = window.open('', 'Print-Window');

				newWin.document.open();

				newWin.document.write('<html><body onload="window.print()">'
						+ divToPrint.innerHTML + '</body></html>');

				newWin.document.close();

				setTimeout(function() {
					newWin.close();
				}, 10);
				$('.custom-hide').show();
				$('.hiddata').show();
			});

	$(document).ready(function() {
						$(document).ajaxSend(function() {
							$("#loaderdiv").show();
						}).ajaxComplete(function() {
							$("#loaderdiv").hide();
						});
						$.ajax({
							    url : "/report/getAllTehsilLandSummary",
								data : {'district' : 'ALL'},
								type : "GET",
								success : function(data) 
								{
										//for refresh the html page
										$('#myData tbody').html('');
										$.each(data, function(i, item) {
											var rows = "<tr>" + "<td>"
													+ item[0] + "</td>"
													+ "<td>" + item[1]
													+ "</td>" + "<td>"
													+ item[2] + "</td>"
													+ "<td>" + item[3]
													+ "</td>" + "<td>"
													+ item[4] + "</td>"
													+ "<td>" + item[5]
													+ "</td>" + "<td>"
													+ item[6] + "</td>"
													+ "<td>" + item[7]
													+ "</td>" + "<td>"
													+ item[8] + "</td>"
													+ "<td>" + item[9]
													+ "</td>"

													+ "</tr>";
											$('#myData tbody').append(rows);
										});
										rows = '<tr><td></td><td>Total</td><td id="sum1"></td><td id="sum2"></td><td id="sum3"></td><td id="sum4"></td><td id="sum5"></td><td="sum6"></td><td id="sum7"></td><td id="sum8"></td><td id="sum9"></td></tr>';
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
							var sum2 = 0;
							var sum3 = 0;
							var sum4 = 0;
							var sum5 = 0;
							var sum6 = 0;
							var sum7 = 0;
							var sum8 = 0;
							var sum9 = 0;
							$("#myData tr").not(':first').not(':last').each(
									function() {
										sum1 += parseFloat($(this).find(
												"td:eq(2)").text());
										sum2 += parseFloat($(this).find(
												"td:eq(3)").text());
										sum3 += parseFloat($(this).find(
												"td:eq(4)").text());
										sum4 += parseFloat($(this).find(
												"td:eq(5)").text());
										sum5 += parseFloat($(this).find(
												"td:eq(6)").text());
										sum6 += parseFloat($(this).find(
												"td:eq(6)").text());
										sum7 += parseFloat($(this).find(
												"td:eq(7)").text());
										sum8 += parseFloat($(this).find(
												"td:eq(8)").text());
										sum9 += parseFloat($(this).find(
												"td:eq(9)").text());

									});
							$("#sum1").text(sum1.toFixed(3));
							$("#sum2").text(sum2.toFixed(3));
							$("#sum3").text(sum3.toFixed(3));
							$("#sum4").text(sum4.toFixed(3));
							$("#sum5").text(sum5.toFixed(3));
							$("#sum6").text(sum6.toFixed(3));
							$("#sum7").text(sum7.toFixed(3));
							$("#sum8").text(sum8.toFixed(3));
							$("#sum9").text(sum9.toFixed(3));
						}

					});
	/* $('#myData').DataTable(
		/* 	{
				
				"dom": '<lf<t>ip>',
				buttons : [],
				"searching" : true,
				"paging" : true,
				"autoWidth" : false,
				
				"footerCallback" : function(row, data, start, end,
						display) {
					var api = this.api();
					nb_cols = api.columns().nodes().length;
					var j = 6;
					while (j < nb_cols) {
						var pageTotal = api.column(j, {
							page : 'current'
						}).data().reduce(function(a, b) {
							return Number(a) + Number(b);
						}, 0);
						// Update footer
						$(api.column(j).footer()).html(
								pageTotal.toFixed(3));
						j++;
					}
				}
			} */
	//	);
	// */
</script>
