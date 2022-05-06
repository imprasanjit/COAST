<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
    <title>Coastal Aquaculture Information System</title>
    <meta content="Admin Dashboard" name="description">
    <meta content="Themesbrand" name="author">
    <link rel="shortcut icon" href='<spring:url value="/images/favicon.png"/>' rel="stylesheet" />
    <link href='<spring:url value="/plugins/datatables/dataTables.bootstrap4.min.css"/>' rel="stylesheet" />
    <link href='<spring:url value="/plugins/datatables/buttons.bootstrap4.min.css"/>' rel="stylesheet" />
    <link href='<spring:url value="/plugins/datatables/responsive.bootstrap4.min.css"/>' rel="stylesheet" />
    <link href='<spring:url value="/css/bootstrap.min.css"/>' rel="stylesheet" />
    <link href='<spring:url value="/css/metismenu.min.css"/>' rel="stylesheet" />
    <link href='<spring:url value="/css/style.css"/>' rel="stylesheet" />
    <link href='<spring:url value="/css/icons.css"/>' rel="stylesheet" />
   <link href='<spring:url value="/plugins/chartist/css/chartist.min.css"/>' rel="stylesheet" />
    <link href='<spring:url value="/plugins/morris/morris.css"/>' rel="stylesheet" />
    <script src="<spring:url value="/js/jquery.min.js"/>"></script>
    
</head>
<body>
 
    <div id="wrapper">
        <div class="topbar">
            <div class="topbar-left"><a href="/dashboard1" class="logo"><span><img src="<spring:url value="/images/logo-admin.png"/>" alt="" height="45"> </span><i><img src="<spring:url value="/images/logo-sm.png"/>" alt="" height="30"></i></a></div>
            <nav class="navbar-custom">
                <ul class="navbar-right list-inline float-right mb-0">
                    <li class="dropdown notification-list list-inline-item d-none d-md-inline-block" style="border-right:1px solid #1072d4"><a class="nav-link waves-effect" title="Back" href="/dashboard1"><i class="fa fa-arrow-left"></i></a></li>
                    <li class="dropdown notification-list list-inline-item d-none d-md-inline-block" style="border-right:1px solid #1072d4"><a class="nav-link waves-effect" href="#" id="btn-fullscreen"><i class="mdi mdi-fullscreen noti-icon"></i></a></li>

                    <li class="dropdown notification-list list-inline-item" style="border-right:1px solid #1072d4;position:relative;top:-8px">
                        <img src="<spring:url value="/images/orsac-logo.png"/>" alt="orsac logo" width="40" style="vertical-align:unset;position:relative;top:1px" />
                    </li>

                    <li class="dropdown notification-list list-inline-item">
                        <div class="dropdown notification-list nav-pro-img">
                            <a class="dropdown-toggle nav-link arrow-none waves-effect nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            	<span style="float:left">
                            		<p class="m-0 mr-2" style="position:relative;top:6px" id="Username"></p>
                            		<p class="m-0 mr-2 text-right" style="position:relative;top:-6px" ><small id="Userrole"></small></p>
                            	</span>
                            	<i class="fa fa-user" style="font-size:16px"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right profile-dropdown">
                                <a class="dropdown-item" href="../changePassword/" data-toggle="modal" data-target="#modalchngpwd"><i class="mdi mdi-lock-open-outline m-r-5"></i> Change Password</a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item text-danger" onclick="logout()"><i class="mdi mdi-power text-danger"></i> Logout</a>
                            </div>
                        </div>
                    </li>

                </ul>
                <ul class="list-inline menu-left mb-0">
                    <li class="float-left">
                        <button class="button-menu-mobile open-left waves-effect" id="sidemenuToggle"><i class="fa fa-angle-double-left"></i></button>
                    </li>
                    <li>
                        <h4 class="adminTitle"><span class="spl-character">Co</span>astal <span class="spl-character">A</span>quaculture Information Sy<span class="spl-character">st</span>em</h4>
                        <h4 class="adminTitleSm">COAST</h4>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="left side-menu">
            <div class="slimscroll-menu" id="remove-scroll">
                <div id="sidebar-menu">
                    <ul class="metismenu" id="side-menu">
                        <li><a href='/dashboard1' class="waves-effect"><i class="ti-bar-chart"></i> <span>Dashboard</span></a></li>
                        
                        <li>
                            <a href='#' class="waves-effect"><i class="fa fa-map" aria-hidden="true"></i><span>Map View <span class="float-right menu-arrow"><i class="mdi mdi-chevron-right"></i></span></span></a>
                            <ul class="submenu">
                                <li><a href='/mapview'>Query Mode</a></li>
                                <li><a href='/interactive/all'>Interactive Mode</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href='#' class="waves-effect"><i class="fa fa-search"></i><span>Analytics <span class="float-right menu-arrow"><i class="mdi mdi-chevron-right"></i></span></span></a>
                            <ul class="submenu">
                                <li><a href='/QuerybuilderFeaslnd'>Feasible Govt. Land</a></li>
                                <li><a href='/QuerybuilderAquapond'>Existing Aquapond</a></li>
                                <li><a href='/QuerybuilderRegfarm'>CAA Regd.Farm</a></li>
                                <li><a href='/CadastralSearch'>Cadastral Plot Search</a></li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href='#' class="waves-effect"><i class="ti-agenda"></i><span> Report <span class="float-right menu-arrow"><i class="mdi mdi-chevron-right"></i></span></span></a>
                            <ul class="submenu">
                                <li><a href='/LandReport'>Land Report</a></li>
                                
                            </ul>
                        </li>
                        <li><a href='/ViewFieldReport' class="waves-effect"><i class="fa fa-flag"></i><span>View Field Reporting</span></a></li>                     
                        <li id="usermanagement" style="visibility: hidden"><a href='/UserMgmt' class="waves-effect"><i class="ti-user"></i><span> User Management</span></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="content-page">
            <tiles:insertAttribute name="body" />
            
            <footer class="footer">
                &copy; 2019 | Coastal Aquaculture Information System | Developed by <a href="http://sparcindia.com/" target="_blank">SPARC (P) Ltd.</a> under ageis of <a href="http://www.orsac.gov.in/" target="_blank">ORSAC</a>
            </footer>
        </div>
    </div>
    <div class="modal fade" id="modalchngpwd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-info">
                    <h5 class="modal-title text-white" id="exampleModalLabel">Change Password</h5>
                    <button type="button" class="close bg-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>  
                    <div class="modal-body">
                        <div class="account-card-content">
                            <div class="form-group row">
                                <label for="" class="col-sm-4 col-form-label">Old Password</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="txtold_pwd" name="txtold_pwd" placeholder="Old Password" required="required">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-4 col-form-label">New Password</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="txtnew_pwd" name="txtnew_pwd" placeholder="New Password" required="required">
                                </div>
                            </div>
<!--                             <div class="form-group row">
                                <label for="" class="col-sm-4 col-form-label">Re-Type Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="txtrenew_pwd" name="txtrenew_pwd" placeholder="Re-Type Password" required="required">
                                </div>
                                <input type="hidden" class="form-control" id="txtuser_id" name="txtuser_id" value="">
                            </div> -->
                        </div>
                    </div>
                    <div class="modal-footer text-center">
                        <button type="submit" class="btn btn-sm btn-warning waves-effect waves-light"  onclick="updatePassword()">Update</button>
                    </div>           
            </div>
        </div>
    </div>
    <div class="modal fade" id="modal_pwd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="position:fixed;top:50%;left:50%;transform:translate(-50%, -50%);">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="account-card-content">
                        <button type="button" class="close text-success" style="position:absolute;top:6px;right:18px;" data-dismiss="modal" aria-label="Close" onclick="window.location.href = '#'">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="alert alert-success text-center m-t-20" role="alert" id="pwd_msg"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="wait" style="display:none;width:100%;height:100%;position:absolute;top:0;background-color:rgba(0,0,0,0.35);z-index:9">
        <div style="position:absolute;top:50%;left:50%">
            <img src='/images/loader.gif' alt="Loading" width="85" height="85" />
            <br>
            <span style="color:#fff;text-align:center;display:block">Loading...</span>
        </div>
    </div>
    <div class="modal fade" id="modal_succ" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog" role="document"
		style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="modal-content">
			<div class="modal-header bg-success">
				<button type="button" class="close bg-white" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="account-card-content">
					<div class="alert alert-success text-center m-t-20" role="alert"
						id="succ_msg"></div>
				</div>
			</div>
		</div>
	</div>
</div>
    
    <script type="text/javascript" src='<spring:url value="/js/bootstrap.bundle.min.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/js/jquery.slimscroll.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/js/metisMenu.min.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/js/waves.min.js"/>'></script>
    <%-- <script type="text/javascript" src='<spring:url value="/plugins/chartist/js/chartist.min.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/plugins/chartist/js/chartist-plugin-tooltip.min.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/plugins/peity-chart/jquery.peity.min.js"/>'></script> --%>
    <%-- <script type="text/javascript" src='<spring:url value="/pages/dashboard.js"/>'></script> --%>
    <script type="text/javascript" src='<spring:url value="/js/app.js"/>'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/reqwest/2.0.5/reqwest.min.js'></script>
   <%--  <script type="text/javascript" src='<spring:url value="/plugins/morris/morris.min.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/plugins/raphael/raphael-min.js"/>'></script>
    <script type="text/javascript" src='<spring:url value="/pages/morris.init.js"/>'></script> --%>
    
    <!-- Required datatable js -->
	<script src='<spring:url value="/plugins/datatables/jquery.dataTables.min.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/dataTables.bootstrap4.min.js"/>'></script>
	<!-- Datatable init js -->
	<!-- <script src="/pages/datatables.init.js"></script> -->
	<!-- Buttons examples -->
	<script src='<spring:url value="/plugins/datatables/dataTables.buttons.min.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/buttons.bootstrap4.min.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/jszip.min.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/pdfmake.min.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/vfs_fonts.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/buttons.html5.min.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/buttons.print.min.js"/>'></script>
	<script src='<spring:url value="/plugins/datatables/buttons.colVis.min.js"/>'></script>
	
	<script type="text/javascript">
	    $("#sidemenuToggle").click(function (event) {
	        $(this).find('i').toggleClass('fa-angle-double-right');
	    });
	</script>
	<script type="text/javascript">
	function logout(){	
		 let text = "Are you sure you want to logout?";
		  if (confirm(text) == true) {
			  sessionStorage.clear();  
			  window.localStorage.clear();
			  window.location.href = '../index';
		  } 
	  }
	function updatePassword()
	{
		//alert("hii12")
		var old_password= document.getElementById("txtold_pwd").value;
		var new_password= document.getElementById("txtnew_pwd").value;
		var userid = '<%= session.getAttribute("userID")%>';
		alert(old_password)
		alert(new_password)
						$.ajax({
						type : "POST",
						url : "/changePassword",
						data : {
							'oldPassword' : old_password,
							'newPassword' : new_password,
							'userid' :userid
						},

						success : function(data) {
							//lert("156")
							if (data == "Password Updated successfully !")
		                    {
								$('#modalchngpwd').modal('hide');
								$('#modal_succ').modal('show');
								$("#succ_msg").html(data);								
		                    }
		                    else if(data =="Old Password Doesn't Match !")
		                    {
		                    	$('#modalchngpwd').modal('show');
		                    	$('#modal_succ').modal('show');
		    					$("#succ_msg").html(data);
		                     	document.getElementById("txtold_pwd").focus();

		                    }						

						},
						error : function(errormessage) {
							alert(errormessage.responseText);

						}

					})
		
	}
	
	$(document).ready(function () 
	  {
		var yourSessionValue = '<%= session.getAttribute("userType")%>';	
		var name='<%=session.getAttribute("uname")%>';			
		var role='<%=session.getAttribute("userType")%>';	
		//console.log(name);
		//$("#Username").html(name.toString());
		//var admin=$("#Userrole").html(name.toString());		
		//document.getElementById("Userrole").html(role);		
		if (yourSessionValue == 1) {		
			$("#usermanagement").css("visibility", "visible");
			$("#Username").html(name.toString());
			$("#Userrole").html("Admin");
		}else if (yourSessionValue == 2) {		
			$("#Username").html(name.toString());
			$("#Userrole").html("Web User");
		}else if (yourSessionValue == null) {		
			  sessionStorage.clear();  
			  window.localStorage.clear();
			  window.location.href = '../index';
		}else{
			  sessionStorage.clear();  
			  window.localStorage.clear();
			  window.location.href = '../index';
		} 				
		});
	</script>	
	<script>
	
	    function openNav() {
	        document.getElementById("mySwitcher").style.width = "290px";
	    }
	
	    function closeNav() {
	        document.getElementById("mySwitcher").style.width = "0";
	    }
	    function openNav2() {
	        document.getElementById("mySwitcher2").style.width = "400px";
	    }
	
	    function closeNav2() {
	        document.getElementById("mySwitcher2").style.width = "0";
	    } 
	    function openNav3() {
	        document.getElementById("mySwitcher3").style.width = "290px";
	    }
	
	    function closeNav3() {
	        document.getElementById("mySwitcher3").style.width = "0";
	    }
	    
	</script>
</body>
</html>