<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<%@ include file="master.jsp"%>
<head>
<link href="/css/popup.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
</head>
<div class="page-loader" id="loaderdiv" style="display: none"><img src="<spring:url value="/images/loader.gif"/>"alt="loader" /></div>
<div class="content-page">
	<div class="container-fluid">
		<div class="page-title-box">
			<div class="row align-items-center">
				<div class="col-sm-6">
					<h4 class="page-title">User Management</h4>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active">User Management</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<ul class="nav nav-tabs" role="tablist" id="myTab">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#manage1" role="tab">Department</a></li>
							<!-- <li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#manage2" role="tab">User Type</a></li> -->
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#manage3" role="tab">User</a></li>
						</ul>
						<div class="tab-content p-3-side">
							<!-- Tab1 -->
							<div class="tab-pane active p-3" id="manage1" role="tabpanel">
								<div class="row">
									<div class="col-lg-12">
										<div class="card">
											<div class="card-body">
												<%-- <form class="form-horizontal" id="formdept"> --%>
												<div class="form-group row">
													<label for="deptId" class="col-sm-2 col-form-label">Department</label>
													<div class="col-sm-4">
														<input type="text" id="deptId" class="form-control"
															placeholder="Department" />
															<span class="form_error" id="deptError" style="color: red; font-size: 11px;"></span>
													</div>
													<div class="col-sm-4">
														<button type="submit"
															class="btn btn-sm btn-info waves-effect waves-light mt-1"
															id="dept_add" value="add" onclick='addDepartment()'>
															Add <i class="fa fa-plus">&nbsp;</i>
														</button>
													</div>
												</div>
												<%-- </form> --%>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table table-bordered mb-0" id="myDataTbl">
										<thead class="thead-light">
											<tr>
												<th width="7%">Sl. No.</th>
												<th>Department</th>
												<th width="12%">Action</th>
											</tr>
										</thead>
										<tbody class="tbody_dept">
										</tbody>
									</table>
								</div>
							</div>
							<!-- Tab1 -->

							<!-- Tab2 -->
							<div class="tab-pane p-3" id="manage2" role="tabpanel">
								<div class="row">
									<div class="col-lg-12">
										<div class="card">
											<div class="card-body">
												<%-- <form class="form-horizontal" id="formuser_type" enctype="multipart/form-data" accept-charset="multipart/form-data"> --%>
												<div class="form-group row">
													<label for="uType" class="col-sm-2 col-form-label">UserType</label>
													<div class="col-sm-4">
														<input class="form-control" placeholder="UserType"
															id="uType" />
													</div>
													<!-- <div class="col-sm-4">
                                                          <select class="form-control custom-select" id="typU">
																<option selected="selected">-- Select --</option>
																<option>1</option>
																<option>2</option>
															</select>
														</div> -->

													<div class="col-sm-4">
														<button type="submit"
															class="btn btn-sm btn-info waves-effect waves-light mt-1"
															id="user_type_add" value="add" onclick="addUserType()">
															Add <i class="fa fa-plus">&nbsp;</i>
														</button>
													</div>
												</div>
												<%-- </form> --%>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table table-bordered mb-0" id="UsertypTbl">
										<thead class="thead-light">
											<tr>
												<th width="7%">Sl. No.</th>
												<th>User Type</th>
												<th width="12%">Action</th>
											</tr>
										</thead>
										<tbody class="tbody_uType"></tbody>
									</table>
								</div>
							</div>
							<!-- Tab2 -->

							<!-- Tab3 -->
							<div class="tab-pane p-3" id="manage3" role="tabpanel">
								<div class="row">
									<div class="col-lg-12">
										<div class="card">
											<div class="card-body">
												<%-- form-start --%>
												<%-- <form method="POST" class="form-horizontal" onsubmit="return validateForm()" modelAttribute="usermodel" action="/adduser" id="formuser"> --%>
												
													<div class="form-group row">													
													<!-- <label for="fullnm" class="col-sm-2 col-form-label">Full Name <span class="text-danger">*</span>
													</label>													
													<div class="col-sm-4">

														<input type="text" class="form-control"
															placeholder="Full Name" id="fullnm" /> <span
															id="FName" style="color: red; font-size: 11px;"></span>
														<span class="form_error" id="fname"
															style="color: red; font-size: 11px;">Please enter
															the full name.</span>
													</div> -->
													<label for="usernm" class="col-sm-2 col-form-label">User Name <span class="text-danger">*</span>
													</label>													
													<div class="col-sm-4">
														<input type="text" class="form-control"
															placeholder="User Name" id="username" /> <span
															id="lblName" style="color: red; font-size: 11px;"></span>
														<span class="form_error" id="uname"
															style="color: red; font-size: 11px;">Please enter
															username.</span>
													</div>
													<label for="deptid" class="col-sm-2 col-form-label">Department
													<span class="text-danger">*</span>
													</label>
													<div class="col-sm-4">
														<select class="form-control custom-select" id="deptid">
															<option  selected="selected" value="0">-- Select Department --</select>
															<span class="form_error" id="dname" style="color:red;font-size: 11px;">Please select the department</span>
													</div>
												</div>
												<div class="form-group row">
													<label for="idemail" class="col-sm-2 col-form-label">Email
														ID <span class="text-danger">*</span>
														
													</label>
													<div class="col-sm-4">
														<input class="form-control" placeholder="Email"
															id="idemail" type="email" /><span id="invalid_email" style="color:red;"></span>
															<span class="form_error" id="ename"style="color:red;font-size: 11px;">Please enter your email</span>
													</div>

													<label for="uType" class="col-sm-2 col-form-label">User
														Type <span class="text-danger">*</span>
														
													</label>
													<div class="col-sm-4">
														<select class="form-control custom-select" id="uTypes">
															<option selected="selected" value="0" 
																label="-- Select User Type --" />
															<option  value="1" 
																label="Admin" />
															<option  value="2" 
																label="Web User" />			
														</select><span class="form_error" id="uTname" style="color:red;font-size: 11px;">Please select the UserType</span>
													</div>
												</div>

												<div class="form-group row">
													<label for="desigid" class="col-sm-2 col-form-label">Designation
														<span class="text-danger">*</span>
													</label>
													<div class="col-sm-4">
													<input class="form-control" placeholder="Designation" id="desigid" />
													<span id="lbldesig"style="color:red;font-size: 11px;"></span>
													<span class="form_error" id="dsgname" style="color:red;font-size: 11px;">Please enter the Designation</span>
													</div>

													<label for="idmobile" class="col-sm-2 col-form-label">Mobile No <span class="text-danger">*</span></label>
													<div class="col-sm-4">
													<input class="form-control" placeholder="Mobile No" id="idmobile" maxlength="10" />
													<span class="form_error" id="mobname" style="color:red;font-size: 11px;">Please enter the Mobile No.</span>
													<span id="invalid_phone" style="color:red;font-size: 11px;"></span>
													</div>
												</div>
												<hr>
												<div class="row">
													<div class="col-sm-12 text-center">
														<button type="submit"
															class="btn btn-sm btn-info waves-effect waves-light mt-1"
															id="addbutton" onclick="addUser(this.value)">
															<i class="fa fa-plus">&nbsp;</i>Add
														</button>
													</div>
												</div>
												<%-- </form:form> --%>
												<%-- form-end --%>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table table-bordered mb-0" id="myData">
										<thead class="thead-light">
											<tr>
												<th width="7%">Sl. No.</th>
												<th>Full Name</th>
												<th>Email-ID</th>
												<th>Designation</th>
												<th>Role</th>
												<th>Department</th>
												<th>Mobile No.</th>
												<th>Status</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody class="tbody"></tbody>
									</table>
								</div>
							</div>
							<!-- Tab3 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal Edit Department -->
<div class="modal fade" id="modalDepartment" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h5 class="modal-title text-white" id="exampleModalLabel">Edit
					Department</h5>
				<button type="button" class="close bg-white" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form class="form-horizontal m-t-30" id="formdeptupdt">
				<div class="modal-body">
					<div class="account-card-content">
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">Department</label>
							<div class="col-sm-8">
								<input class="form-control text-box single-line" data-val="true"
									data-val-length="The field Department Name must be a string with a maximum length of 256."
									data-val-length-max="256"
									data-val-required="Department Name Is Required"
									id="txtdept_name_updt" maxlength="256"
									name="user_manage_info.dept_name" placeholder="Department"
									required="required" type="text" value="" />									
							</div>
							<input class="form-control text-box single-line" data-val="true"
								data-val-required="The dept_id field is required."
								id="txtdept_id_updt" name="user_manage_info.dept_id"
								placeholder="Department ID" required="required"
								style="visibility: hidden;" type="number" value="" />
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="submit"
						class="btn btn-sm btn-warning waves-effect waves-light"
						onclick="deptUpdate(this.value)">Update</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Modal Edit Department -->

<!-- Modal Edit User Type -->
<%-- <div class="modal fade" id="modalUserType" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h5 class="modal-title text-white" id="exampleModalLabel">Edit
					User Type</h5>
				<button type="button" class="close bg-white" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form class="form-horizontal m-t-30" id="formuser_typeupdt">
				<div class="modal-body">
					<div class="account-card-content">
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">User Type</label>
							<div class="col-sm-8">
								<input class="form-control text-box single-line" data-val="true"
									data-val-length="The field User Type Name must be a string with a maximum length of 256."
									data-val-length-max="256"
									data-val-required="User Type Name Is Required"
									id="txtuser_type_name_updt" maxlength="256"
									name="user_manage_info.user_type_name" placeholder="User Type"
									required="required" type="text" value="" />
							</div>
							<input class="form-control text-box single-line" data-val="true"
								data-val-required="The user_type_id field is required."
								id="txtuser_type_id_updt" name="user_manage_info.user_type_id"
								placeholder="User Type ID" required="required"
								style="visibility: hidden;" type="number" value="" />
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="submit"
						class="btn btn-sm btn-warning waves-effect waves-light" onclick="UserTypeUpdate(this.value)">Update</button>
				</div>
			</form>
		</div>
	</div>
</div> --%>
<!-- Modal Edit User Type -->

<!-- Modal Edit User -->
<div class="modal fade" id="modalUser" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h5 class="modal-title text-white" id="exampleModalLabel">Edit
					User</h5>
				<button type="button" class="close bg-white" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form class="form-horizontal m-t-30" id="formuserupdt">
				<div class="modal-body">
					<div class="account-card-content">
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">Full Name</label>
							<div class="col-sm-8">
								<input class="form-control text-box single-line" data-val="true"
									data-val-length="The field User Name must be a string with a maximum length of 256."
									data-val-length-max="256"
									data-val-required="User Name Is Required"
									id="txtuser_name_updt" maxlength="256"
									name="user_manage_info.user_name" placeholder="Full Name" required="required" type="text" value="" /> <span
									id="lblNameEdit" style="color: red; font-size: 11px;"></span> <span
									class="form_error" id="unameError"
									style="color: red; font-size: 11px;">Please enter the
									Full Name</span>

							</div>
							<input class="form-control text-box single-line" data-val="true"
								data-val-required="The user_id field is required."
								id="txtuser_id_update" name="user_manage_info.user_id"
								placeholder="User_ID" required="required" 
								style="visibility: hidden;" type="number" value="" />
						</div>
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">Email Id</label>
							<div class="col-sm-8">
								<input class="form-control text-box single-line" data-val="true"
									data-val-email="Please Enter A Valid E-mail ID."
									data-val-length="The field E-mail ID must be a string with a maximum length of 256."
									data-val-length-max="256"
									data-val-required="E-mail ID Is Required" id="txtemail_id_updt"
									maxlength="256" name="user_manage_info.email_id"
									placeholder="Email Id" disabled="disabled" required="required" type="email"
									value="" />
								<span id="invalid_emailEdit" style="color:red;"></span>
								<span class="form_error" id="enameError"style="color:red;font-size: 11px;">Please enter your email</span>	
							</div>
						</div>
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">Mobile No.</label>
							<div class="col-sm-8">
								<input class="form-control" placeholder="Mobile No" id="txtMobileNo_updt" maxlength="10" />
								<!-- <input class="form-control text-box single-line" data-val="true"
									data-val-phone="Please Enter A Valid Mobile No."
									data-val-length="The field Mobile No. must be a number"
									data-val-length-min="10"
									data-val-length-max="10"
									data-val-required="Mobile No Is Required" id="txtMobileNo_updt"
									maxlength="10" name="user_manage_info.phone_no"
									placeholder="Mobile No." type="number"
									value="" /> -->
								<span class="form_error" id="mobnameError" style="color:red;font-size: 11px;">Please enter the Mobile No.</span>
								<span id="invalid_phone" style="color:red;font-size: 11px;"></span>	
							</div>
						</div>
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">Designation</label>
							<div class="col-sm-8">
								<input class="form-control text-box single-line" data-val="true"
									data-val-length="The field Designation must be a string with a maximum length of 256."
									data-val-length-max="256"
									data-val-required="Designation Is Required"
									id="txtdesignation_updt" maxlength="256"
									name="user_manage_info.designation" placeholder="Designation"
									required="required" type="text" value="" />
								<span id="lbldesigEdit"style="color:red;font-size: 11px;"></span>
								<span class="form_error" id="dsgnameError" style="color:red;font-size: 11px;">Please enter the Designation</span>
							</div>
						</div>
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">Department</label>
							<div class="col-sm-8">
								<select class="form-control" name="ddldept"
									id="seldept_id_updt"><!-- onChange="DeptList(this.id)" -->
									<!-- onClick="DeptList(this.id)" -->
									<option value="0" selected="selected">-- Select Department --</option>
									<!-- <option value="0" label="ALL" />
							<option value="1" label="Orsac" />
							<option value="2" label="Fisheries" />
							<option value="3" label="govt" /> -->

								</select>
								<span class="form_error" id="dnameError" style="color:red;font-size: 11px;">Please select the department</span>
							</div>
						</div>
						<div class="form-group row">
							<label for="" class="col-sm-4 col-form-label">User Type</label>
							<div class="col-sm-8">
								<select class="form-control" id="seluser_type_id_updt"
									name="ddlusertype"> <!--   onChange="UserTypeList(this.id)"-->
									<option value="0" selected="selected">-- Select User Type --</option>
									<option value="1">Administrator</option>
									<option value="2">Web User</option>									
								</select>
								<span class="form_error" id="uTnameError" style="color:red;font-size: 11px;">Please select the UserType</span>
							</div>
							<input class="form-control text-box single-line" data-val="true"
								data-val-required="The user_type_id field is required."
								id="txtuser_id_updt" name="user_manage_info.user_type_id"
								placeholder="User_type_id" required="required"
								style="visibility: hidden;" type="number" value="" />
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="submit"
						class="btn btn-sm btn-warning waves-effect waves-light" onclick="UserUpdate(this.value)">Update</button>
				</div>
		</form>
		</div>
	</div>
</div>
<!-- Modal Edit User -->
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
<div class="modal fade" id="modal_err" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document"
		style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<button type="button" class="close bg-white" data-dismiss="modal"
					aria-label="Close">
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
<script>
$("#idemail").change(function (){
	var email = $('#idemail').val();
	$.ajax({
		type : "GET",
		url : "/emailValidate",
		data : {			
			'email' : email
			},
		success : function(data) {
			if (data=="email already exist")
			{
				$('#ename').show();
				$('#ename').html(data);
				document.getElementById("idemail").focus();
			}			
				
		},
		error : function(errormessage) {
			alert(errormessage.responseText);

		}

	})
	$('.form_error').hide();	
	
});

    //validateForm();
	function addUser(fullnm, username, deptid, idemail, uTypes, desigid, idmobile) 
	{		
	   $(document).ajaxSend(function() {
                  			$("#loaderdiv").show();
                  		}).ajaxComplete(function() {
                  			$("#loaderdiv").hide();
                  		});
	   
	   	var username=$('#username').val();
		var fullname =$('#fullnm').val();		
		var dept =$('#deptid').val();			
		var email =$('#idemail').val();	
		var usertype =$('#uTypes').val();	
		var designation =$('#desigid').val();	
		var mobile =$('#idmobile').val();
		 $('.form_error').hide();
		 if(fullname== ''){
			 $('#fname').show();
             document.getElementById("fullnm").focus();
             return false;
		 }
		  if(username== '')
		 {
             $('#uname').show();
             document.getElementById("username").focus();
             return false;
           }
		 if(dept == 0){
             $('#dname').show();
             document.getElementById("deptid").focus();
             return false;
           }
		 else if(email== ''){
             $('#ename').show();   
             document.getElementById("idemail").focus();
             return false;             
          }
		 else if(IsEmail(email)==false){
              $('#ename').show();
              document.getElementById("idemail").focus();
              return false;
          }
		 else if(usertype == null || usertype == 0){
             $('#uTname').show();
             document.getElementById("uTypes").focus();
             return false;
           }
		 else if(designation== ''){
             $('#dsgname').show();
            document.getElementById("desigid").focus();
             return false;
           }
 		 else if(mobile== ''){
 			$('#mobname').show(); 			
              document.getElementById("idmobile").focus();
              return false;
          }
		 		  	
			$.ajax({
			type : "POST",
			url : "/adduser",
			data : {
					'username' : username,
					'deptId' : dept,
					'email' : email,
					'userType' : usertype,
					'designation' : designation,
					'mobileNo' : mobile
			       },
			success : function(data) 
			{
				var msg = "Added Successfully.";
				$('#modal_succ').modal('show');
				$("#succ_msg").html(msg);
				getAllUserData();
				document.getElementById('fullnm').value = '';
				document.getElementById('deptid').value = '';
				document.getElementById('idemail').value = '';
				document.getElementById('uTypes').value = '';
				document.getElementById('desigid').value = '';
				document.getElementById('idmobile').value = '';
			},
			error : function(errormessage) {
				alert(errormessage.responseText);

			}

		});
			 $('.form_error').hide();	

	}
	//Validate Only Number
	$(function() {
		$("#idmobile").keypress(function(e) {
			var keyCode = e.keyCode || e.which;
			$("#invalid_phone").html("");
			 var reg = /^[0-9]+$/;     
			//var reg = /^(0|91)+[7-9][0-9]{9}/;
			var isValid = reg.test(String.fromCharCode(keyCode));
			if (!isValid) {
				console.log(isValid);
				$('#mobname').show();
				$("#mobname").html("Only Numbers allowed.");
			} else
				$('#mobname').hide();
			return isValid;
		});
		$('.form_error').hide();
	});

	//Validate Only Alphabet for Name input
	$(function() {
		$("#username").keypress(function(e) {
			var keyCode = e.keyCode || e.which;
			$("#lblName").html("");
			var regex = /^[A-Za-z,. ]+$/;
			var isValid = regex.test(String.fromCharCode(keyCode));
			if (!isValid) {
				$("#lblName").html("Only Alphabets allowed.");
				$('#uname').hide();
			} else
				$('#uname').hide();
			return isValid;
		});
		$('.form_error').hide();
	});

	$(function() {
		$("#desigid").keypress(function(e) {
			var keyCode = e.keyCode || e.which;
			$("#lbldesig").html("");
			var regex = /^[A-Za-z,. ]+$/;
			var isValid = regex.test(String.fromCharCode(keyCode));
			if (!isValid) {
				$("#lbldesig").html("Only Alphabets allowed.");
				$('#dsgname').hide();
			} else
				$('#dsgname').hide();
			return isValid;
		});
		$('.form_error').hide();
	});
	function IsEmail(email) {
        //var regex=/^[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
        //var regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
        //var regex=/^[a-z]+[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
       	var regex = /^[a-z]+[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]{2,3}$/;        	
        if(!regex.test(email)) {
        	$("#ename").html("Not a valid email Id");
           return false;
        }
        else{
        	$('#ename').hide();
        	 return true;
        }
	}
	
	function emailvalidation(emailId)
	{
		
		var emailId = $("#idemail").val();
	}
	
	function getAllDepartment() {
		/* method:2 */
		$(document).ajaxSend(function() {
			$("#loaderdiv").show();
		}).ajaxComplete(function() {
			$("#loaderdiv").hide();
		});
		    $.ajax({
					url : "/getAllDepartment",
					type : "GET",
					contentType : "application/json",
					dataType : "json",
					// success callback function
					success : function(data) {
						console.log(data);

						$('#myDataTbl tbody').empty();
						var sl = 1;
						$.each(data,function(i, item1) {
											console.log(data);
											var rows = "<tr>"
													+ "<td>"
													+ parseFloat(sl++)
													+ "</td>"
													+ "<td>"
													+ item1.department
													+ "</td>"
													+ "<td>"
													+ "<button type='submit' class='btn btn-success btn-sm waves-effect waves-light mb-1' onclick='EditDepartment("+ item1.userid+ ")'><i class='fa fa-edit'>&nbsp;</i></button>"												
													+ "</td>" + "</tr>";
											$('.tbody_dept').append(rows);
										});
					},
					error : function(errormessage) {
						alert('Data not found');
					}
				})
		/*Department Drop-Down list*/
		$.ajax({
			url : "/getAllDepartment",
			datatype : "JSON",
			type : "Get",
			success : function(data) {
				console.log(data);
				//debugger;
				$('#deptid').html('');
				var options = '';
				$('#deptid').append(
						$("<option></option>").attr("value", "0").text(
								"-- Select Department--"));
				for (var i = 0; i < data.length; i++) {
					options += '<option value="' +data[i].userid + '">'
							+ data[i].department + '</option>';
					$('#deptid').append(
							$("<option></option>")
									.attr("value", data[i].userid).text(
											data[i].department));
				}
			},
			error : function(errormessage) {
				alert('Data not found');
			}

		})
	}

	/* function getAllUserType() {
		/* method:3
		$.ajax({
					url : "/getAllUserType",
					type : "GET",
					contentType : "application/json",
					dataType : "json",
					success : function(data) {
						console.log(data);
						$('#UsertypTbl tbody').empty();
						var sl = 1;
						$.each(data,
										function(i, item1) {
											var rows = "<tr>"
													+ "<td>"
													+ parseFloat(sl++)
													+ "</td>"
													+ "<td>"
													+ item1.usertypename
													+ "</td>"
													+ "<td>"
													+ "<button type='submit' class='btn btn-success btn-sm waves-effect waves-light mb-1' onclick='EditUserType("
													+ item1.usertypeid
													+ ")'><i class='fa fa-edit'>&nbsp;</i></button>"
													+ " "
													+ "<button type='submit' class='btn btn-danger btn-sm waves-effect waves-light mb-1' onclick='DeleteUserType("
													+ item1.usertypeid
													+ ")'><i class='fa fa-trash'>&nbsp;</i></button>"
													+ "</td>" + "</tr>";
											$('.tbody_uType').append(rows);
										});
					},
					error : function(errormessage) {
						alert('Data not found');
					}
				})
		/*UserType drop down list
		$.ajax({
			type : "GET",
			url : "/getAllUserType",
			datatype : "JSON",

			success : function(data) {
				// debugger;
				console.log(data);
				$('#uTypes').html('');
				var options = '';
				$('#uTypes').append(
						$("<option></option>").attr("value", "0").text(
								"-- Select UserType--"));
				for (var i = 0; i < data.length; i++) {
					options += '<option value="' +data[i].usertypeid + '">'
							+ data[i].usertypename + '</option>';
					$('#uTypes').append(
							$("<option></option>").attr("value",
									data[i].usertypeid).text(
									data[i].usertypename));
				}
			},
			error : function(errormessage) {
				alert('Data not found');
			}

		})
	} */
	function getAllUserData() {
		/* method:1 */
		$.ajax({url : "/getAllUserData",
				type : "GET",
				contentType : "application/json",
				dataType : "json",
					// success callback function
					success : function(apiData) 
					{
						$('#myData tbody').empty();
						var sl = 1;
						//console.log(apiData);
						$.each(apiData,function(i, item1) {
											var rows = "<tr>"
													+"<td>"+ parseFloat(sl++)+ "</td>"
													+ "<td>"+ item1.userName+ "</td>"
													+ "<td>"+ item1.emailId+ "</td>"
													+ "<td>"+ item1.designation+ "</td>"
													+ "<td>"+ ((item1.userType=="1")?"Admin":"Web User")+ "</td>"
													+ "<td>"+ item1.dept+ "</td>"
													+ "<td>"+ ((item1.mobileno==null)?"":item1.mobileno)+ "</td>"											
													+ "<td>"+((item1.userStatus==1)?"<button type='submit' class='btn btn-success btn-sm waves-effect waves-light mb-1' onclick='UserStatusInactive("+ item1.userid+ ")'>Active</button> ":"<button type='submit' class='btn btn-danger btn-sm waves-effect waves-light mb-1' onclick='UserStatusActive("+ item1.userid+ ")'>Inactive</button>")
													+ "</td>"
													+ "<td>"+ "<button type='submit' class='btn btn-success btn-sm waves-effect waves-light mb-1' onclick='EditUser("+ item1.userid+ ")'><i class='fa fa-edit'>&nbsp;</i></button>" /* " "
													+ "<button type='submit' class='btn btn-danger btn-sm waves-effect waves-light mb-1' onclick='DeleteUser("+ item1.userid+ ")'><i class='fa fa-trash'>&nbsp;</i></button>"+ "</td>" */
													+ "</tr>";
													$('.tbody').append(rows);
										});
					},
					error : function(errormessage) {
						alert('Data not found');
					}

				})
	}

	//using document.ready() autobind the dataTable for department
	//when usermanagement page is load all the ajax method inside this function get call to show data table;
	$(document).ready(function() 
	{
		 $('.form_error').hide();	
		 
		 DeptList();
		 //UserTypeList();
		 
		//method 1
		getAllDepartment();

		//method 2		
		//getAllUserType();

		//method 3
		getAllUserData();
	});
	
	function UserTypeList() 
	{
		$.ajax({
			type : "GET",
			url : "/getAllUserType",
			datatype : "JSON",
			success : function(data) 
			{
				var options = '';
				for (var i = 0; i < data.length; i++) 
				{
					$('#seluser_type_id_updt').append($("<option></option>")
							                  .attr("value",data[i].usertypeid).text(data[i].usertypename));
				}
			},
			error : function(errormessage) {
				alert('Data not found');
			}

		})

	}

	function DeptList() {
		$.ajax({
			type : "GET",
			url : "/getAllDepartment",
			datatype : "JSON",
			success : function(data) 
			{
				var options = '';
				for (var i = 0; i < data.length; i++) 
				{
					$('#seldept_id_updt').append($("<option></option>")
									     .attr("value", data[i].userid).text(data[i].department));
				}
			},
			error : function(errormessage) {
				alert('Data not found');
			}

		})

	}

	function EditUser(id) {
		$.ajax({
			url : '/editUserById',
			data : {
				'ID' : id
			},
			type : "GET",
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(data) {
				console.log(data)
				$('#modalUser').modal('show');
				$('#txtuser_id_update').val(data.userid);
				$('#txtuser_name_updt').val(data.userName);
				$('#txtemail_id_updt').val(data.emailId);
				$('#txtdesignation_updt').val(data.designation);
				$('#txtMobileNo_updt').val(data.mobileno);
				$('#seldept_id_updt').val(data.dept);
				$('#seluser_type_id_updt').val(data.userType);
			},
			error : function(errormessage) {
				alert(errormessage.responseText);
			}
		});
	}

	function UserUpdate(username,email,designation,dept,usertype,mobile)
	{		
		var userid = $('#txtuser_id_update').val();
		var username = $('#txtuser_name_updt').val();
		var email =$('#txtemail_id_updt').val();
		var designation =$('#txtdesignation_updt').val();
		var dept = $('#seldept_id_updt').val();
		var usertype = $('#seluser_type_id_updt').val();
		var mobile= $('#txtMobileNo_updt').val();
		
		//console.log(userid, username,email,designation,dept,usertype);	
		 $('.form_error').hide();	
		  if(username== '')
		 {
             $('#unameError').show();
             document.getElementById("txtuser_name_updt").focus();
             return false;
           }
		 if(dept == null || dept == 0){
             $('#dnameError').show();
             document.getElementById("seldept_id_updt").focus();
             return false;
           }
		 else if(email== ''){
             $('#enameError').show();   
             document.getElementById("txtemail_id_updt").focus();
             return false;             
          }
		 else if(IsEmail(email)==false){
              $('#enameError').show();
              document.getElementById("txtemail_id_updt").focus();
              return false;
          }
		 else if(usertype == null || usertype == 0){
             $('#uTnameError').show();
             document.getElementById("seluser_type_id_updt").focus();
             return false;
           }
		 else if(designation== ''){
             $('#dsgnameError').show();
            document.getElementById("txtdesignation_updt").focus();
             return false;
           }
 		 else if(mobile== ''){
 			$('#mobnameError').show(); 			
              document.getElementById("txtMobileNo_updt").focus();
              return false;
          }
				
		$.ajax({
			type : "POST",
			url : "/updateUser",
			data : {
					'userid' : userid,
					'username' : username,
					'deptId' : dept,
					'email' : email,
					'userType' : usertype,
					'designation' : designation,
					'mobile' : mobile
			       },

			success : function(data) {
				if (data=="Updated successfully!"){
					//var msg = "Updated Successfully.";
					$('#modalUser').modal('hide');
					$('#modal_succ').modal('show');
					$("#succ_msg").html(data);
					getAllUserData();					
				}
				else
					{
					$('#modalUser').modal('hide');
					$('#modal_err').modal('show');
					$("#err_msg").html(data);
					
					}						
			},
			error : function(errormessage) {
				alert(errormessage.responseText);

			}

		})
		 $('.form_error').hide();	
		
		$(function () {
     $("#txtMobileNo_updt").keypress(function (e) 
   	{   
         var keyCode = e.keyCode || e.which;     	
    	 $("#invalid_phone").html("");	           
       	 var reg = /^\d{10}$/;        
         var isValid = reg.test(String.fromCharCode(keyCode));
         if (!isValid) {
        	 console.log(isValid);
        	 $('#mobnameError').show();
             $("#mobnameError").html("Only Numbers allowed.");
         }         
         else         
        	 $('#mobnameError').hide();
         return isValid;
    });
     $('.form_error').hide();	
 });
        
    //Validate Only Alphabet for Name input
    $(function () {
      $('#txtuser_name_updt').keypress(function (e) {
          var keyCode = e.keyCode || e.which;
          $("#lblNameEdit").html("");
          var regex = /^[A-Za-z,. ]+$/;
          var isValid = regex.test(String.fromCharCode(keyCode));
          if (!isValid) {
              $("#lblNameEdit").html("Only Alphabets allowed.");
              $('#unameError').hide();
          }
          else{
        	  //alert("12121");
        	  $('#unameError').hide();
          }        	 
          return isValid;
      });
      $('.form_error').hide();	
  });
	 
    $(function () {
        $("#txtdesignation_updt").keypress(function (e) {
            var keyCode = e.keyCode || e.which;			
            $("#lbldesigEdit").html("");           
            var regex = /^[A-Za-z,. ]+$/;       
            var isValid = regex.test(String.fromCharCode(keyCode));
            if (!isValid) {
                $("#lbldesigEdit").html("Only Alphabets allowed.");
                $('#dsgnameError').hide();
            }
            else
          	  $('#dsgnameError').hide();
            return isValid;
        });
        $('.form_error').hide();	
    });
	function IsEmail(email) {
       // var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var regex = /^[a-z]+[a-zA-Z0-9+_.-]+@[a-zA-Z-]+\.[a-z]{2,3}$/;  
        if(!regex.test(email)) {
        	$("#enameError").html("Not a valid email");
           return false;
        }
        else{
        	$('#enameError').hide();
        	 return true;
        }
	  }		
	}
	
	//delete function for user
	function DeleteUser(id) {
		
		if (confirm("Are you sure to delete ?")) {
			$.ajax({
				type : "GET",
				url : "/deleteUser",
				data : {
					'userById' : id,
					'userStatus' : 0
				},
				
				//contentType : "application/json;charset=utf-8",
				//dataType: "json",
				success : function(data) {
					var msg = "Deleted Successfully.";
					$('#modal_succ').modal('show');
					$("#succ_msg").html(msg);
					getAllUserData();
					},
				error : function(errormessage) {
					alert(errormessage.responseText);
				}
			});
		}
	}
	
	//Ajax() for Adding Department
	function addDepartment() {
		//confirm(" do you want to processed ?")
		$('.form_error').hide();	
		var input = document.getElementById("deptId").value;
		if (input == '') {
			alert("Please enter department !");
			//$.alert({title: 'Alert!', content: 'Please enter department !'});
		} else {
			//alert(input);
			$.ajax({
				type : "POST",
				url : "/addDepartment",
				data : {
					'deptName' : input
				},//key & value pair parameter sending to controller method
				// success callback function
				success : function(data) {
					var msg = "Added Successfully.";
					$('#modal_succ').modal('show');
					$("#succ_msg").html(msg);
					getAllDepartment();
					document.getElementById('deptId').value = '';

				},
				error : function(errormessage) {
					alert(errormessage.responseText);

				}
			})
		}
	}	
	
	$("#deptId").change(function ()
	{
		var dept_name = $('#deptId').val();
		$.ajax({
			type : "POST",
			url : "/deptValidate",
			data : {			
				    'dept' : dept_name
				   },
			success : function(data) {
				if (data=="success")
				{
					$('#deptError').show();
					$('#deptError').html("Department already exists!");
					document.getElementById('deptId').value = '';
					document.getElementById("deptId").focus();
					return false;
				}			
					
			},
			error : function(errormessage) {
				alert(errormessage.responseText);

			}

		})
		$('.form_error').hide();	
		
	});

	//edit, Update & delete function for department
	function EditDepartment(id) {
		$.ajax({
			url : '/editDepartmentById',
			data : {
				     'ID' : id
			       },
			type : "GET",
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(data) 
			{
				//console.log(data)
				$('#modalDepartment').modal('show');

				$('#txtdept_id_updt').val(data.userid);
				$('#txtdept_name_updt').val(data.department);	
			},
			error : function(errormessage) {
				alert(errormessage.responseText);
			}
		});
	}
	
	function deptUpdate(id, name) {
		event.preventDefault();
		var id = document.getElementById("txtdept_id_updt").value;
		var name = document.getElementById("txtdept_name_updt").value;
		$.ajax({
			type : "POST",
			url : "/updateDepartment",
			data : {
				'departmentById' : id,
				'department_name' : name
			},		
			success : function(data) 
			{
				var msg = "Updated Successfully.";
				$('#modal_succ').modal('show');
				$("#succ_msg").html(msg);
				getAllDepartment();
				/* document.getElementById('fullnm').value='';
				document.getElementById('deptid').value='';
				document.getElementById('idemail').value='';
				document.getElementById('uTypes').value='';
				document.getElementById('desigid').value='';
				document.getElementById('idmobile').value='';  */
			},
			error : function(errormessage) {
				alert(errormessage.responseText);

			}
		})
	}

	// delete function for department
	/* function DeleteDepartment(id) {
		
		if (confirm("Are you sure to delete ?")) {
			$.ajax({
				type : "GET",
				url : '/deleteDepartment/',
				data : {
					"departmentById" : id,
					"department_status" : 0
				},
				success : function(data) {
					var msg = "Deleted Successfully.";
					$('#modal_succ').modal('show');
					$("#succ_msg").html(msg);
					getAllDepartment();
					},
				error : function(errormessage) {
					alert(errormessage.responseText);
				}
			});
		}
	} */

	//Ajax() for Adding UserType
	function addUserType() {
		var input = document.getElementById("uType").value;
		if (input == '') {
			alert("please enter the User Type !")
			document.getElementById("uType").focus();
			return false;
		} else {
			alert(input)
			$.ajax({
				type : "POST",
				url : "/addUserType",
				data : {
					'usertypename' : input
				},
				success : function(data) {
					var msg = "Added Successfully.";
					$('#modal_succ').modal('show');
					$("#succ_msg").html(msg);
					//getAllUserType();
					document.getElementById('uType').value = '';
				},
				error : function(errormessage) {
					alert(errormessage.responseText);
				}
			})
		}
	}

	//edit & Update, delete function for userType	
	function EditUserType(id) {
		$.ajax({
			url : '/editUserTypeById',
			data : 
			{
				'ID' : id
			},
			type : "GET",
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(data) {
				console.log(data);
				$('#modalUserType').modal('show');
				$('#txtuser_type_id_updt').val(data.usertypeid);
				$('#txtuser_type_name_updt').val(data.usertypename);

			},
			error : function(errormessage) {
				alert(errormessage.responseText);
			}
		})
	}

	//update the edited Usertype in database
	function UserTypeUpdate(id, name) {
		event.preventDefault();
		var id = document.getElementById("txtuser_type_id_updt").value;
		var name = document.getElementById("txtuser_type_name_updt").value;

		$.ajax({
			type : "POST",
			url : "/updateUsertype",
			data : {
				'userTypeid' : id,
				'userTypename' : name
			},
			success : function(data) {
				alert("sucess");

				var msg = "Updated Successfully.";
				$("#modal_succ").modal('show');
				$("#succ_msg").html(msg);
				//getAllUserType();
			},
			error : function(errormessage) {
				alert(errormessage.responseText);
			}
		});

	};

	function DeleteUserType(usertypeid) {
		alert(usertypeid)
		if (confirm("Are you sure to deactivate ?")) {
			$.ajax({
				url : '/deleteUserType',
				data : {
					"userTypebyId" : usertypeid,
					"userTypeStatus" : 0
				},
				type : "GET",
				contentType : "application/json;charset=utf-8",
				//dataType: "json",
				success : function(data) 
				{
					//console.log(data);
					alert("success");
					var msg = "Deleted Successfully.";
					$("#modal_succ").modal('show');
					$("#succ_msg").html(msg);
					//getAllUserType();
				},
				error : function(errormessage) {
					alert(errormessage.responseText);
				}
			})
		}

	}

	//User status update
	function UserStatusActive(userid) {
		if (confirm("Are you sure to activate ?")) {
			$.ajax({
				url : '/userStatusUpdate/',
				data : {
					"userById" : userid,
					"userStatus" : 1
				},
				type : "GET",
				contentType : "application/json;charset=utf-8",
				//dataType: "json",
				success : function(data) {
					if (data == "Status Updated successfully !") {
						$('#modal_succ').modal('show');
						$("#succ_msg").html(data);
						getAllUserData();
					} else {
						$('#modal_err').modal('show');
						$("#err_msg").html(data);
					}
				},
				error : function(errormessage) {
					alert(errormessage.responseText);
				}
			});
		}
	}
	function UserStatusInactive(userid) {
		if (confirm("Are you sure to deactivate ?")) {
			$.ajax({
				url : '/userStatusUpdate/',
				data : {
					"userById" : userid,
					"userStatus" : 0
				},
				type : "GET",
				contentType : "application/json;charset=utf-8",
				//dataType: "json",
				success : function(data) {
					if (data == "Status Updated successfully !") {
						$('#modal_succ').modal('show');
						$("#succ_msg").html(data);
						getAllUserData();
					} else {
						$('#modal_err').modal('show');
						$("#err_msg").html(data);
					}
				},
				error : function(errormessage) {
					alert(errormessage.responseText);
				}
			});
		}
	}

	//mandatory input_field validation
/* 	function validateForm() {
		var fullnm = document.getElementById("fullnm").value;
		var dept = document.getElementById("deptid").value;
		var email = document.getElementById("idemail").value;
		var uTypes = document.getElementById("uTypes").value;
		var desig = document.getElementById("desigid").value;
		var mobile = document.getElementById("idmobile").value;

		if (fullnm == null || fullnm == "") {
			alert("Please Fill Username");
			document.getElementById("fullnm").focus();
			//document.getElementById("fullnm").style.border="2px solid red";
			return false;
		} else if (dept == null || dept == 0) {
			alert("Please Select Department");
			document.getElementById("deptid").focus();
			//document.getElementById("deptid").style.border="2px solid red";
			return false;
		} else if (email == null || email == "") {
			alert("Please Fill email");
			document.getElementById("idemail").focus();
			//document.getElementById("idemail").style.border="2px solid red";
			return false;
		} else if (uTypes == null || uTypes == 0) {
			alert("Please Select User Types");
			document.getElementById("uTypes").focus();
			//document.getElementById("uTypes").style.border="2px solid red";
			return false;
		} else if (desig == null || desig == "") {
			alert("Please Fill Designation");
			document.getElementById("desigid").focus();
			//document.getElementById("desigid").style.border="2px solid red";
			return false;
		} else if (mobile == null || mobile == "") {
			alert("Please Fill mobile");
			document.getElementById("idmobile").focus();
			//document.getElementById("idmobile").style.border="2px solid red";
			return false;
		} else {
			return true;
		}
	} */
</script>