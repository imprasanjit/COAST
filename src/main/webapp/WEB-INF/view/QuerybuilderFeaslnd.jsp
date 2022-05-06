<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<jsp:include page="master.jsp" /> 
<head>
<link href="/css/popup.css" rel="stylesheet" />
<link rel="stylesheet" href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
</head>

<div class="page-loader" id="loaderdiv" style="display: none"><img src="<spring:url value="/images/loader.gif"/>"alt="loader" /></div>

<div class="content-page content-custom">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12"> 
            	<div class="clearfix">
                    <div class="mb-0 collapse show" id="collapseExample">
              			<div class="card" style="margin-bottom:0px">
                            <div class="card-body" style="padding:1.25rem">
                                <div class="form-group row">
                                    <label for="" class="col-sm-2 col-form-label">District<span class="text-danger"> *</span></label>
                                    <div class="col-sm-2">
                                        <select id="ddldist" name="ddldist" onchange="projselect(this.value)" class="form-control custom-select">
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
                                    <label for="" class="col-sm-2 col-form-label">Tehsil/Block<span class="text-danger"> *</span></label>
                                    <div class="col-sm-2">
                                        <select class="form-control custom-select" id="ddltehesil" onchange="bindgp(this.value)">
                                        <option>-- Select --</option>
                                        </select>
                                    </div>
                                    <label for="" class="col-sm-2 col-form-label">Gram Panchayat<span class="text-danger"> *</span></label>
                                    <div class="col-sm-2">
                                        <select class="form-control custom-select" id="ddlgp" name="ddlgp" onchange="bindvillage(this.value)">
                                            <option>-- Select --</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">   
                                    <label for="" class="col-sm-2 col-form-label">Village<span class="text-danger"> *</span></label>
                                    <div class="col-sm-2">
                                        <select class="form-control custom-select" id="ddlvillage" onchange="bindplotno(this.value)">
                                            <option>-- Select ---</option>
                                        </select>
                                    </div>
                                    <label id="lbllndtype" for="" class="col-sm-2 col-form-label">Govt. Feasible Land Queries</label>
                                    <div class="col-sm-3" id="divlndtype">
                                        <select class="form-control custom-select" id="ddllandtype" >
                                            <option value="areaac < 1">Feasible Govt. Land Less than 1 ac.</option>
                                            <option value="areaac > 1 and areaac < 5">Feasible Govt. Land 1 to 5 ac.</option>
                                            <option value="areaac < 5">Feasible Govt. Land Less than 5 ac.</option>
                                            <option value="areaac > 5">Feasible Govt. Land greater than 5 ac.</option>
                                            <option value="areaac > 10">Feasible Govt. Land greater than 10 ac.</option>
                                            <option value="areaac > 20">Feasible Govt. Land greater than 20 ac.</option>
                                            <option value="plotno > '0'">ALL Feasible Govt. Land</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row" id="serchdiv" style="display:none">
                                    <label for="" class="col-sm-1 col-form-label font-11">Plot No.</label>
                                    <div class="col-sm-2">
                                        <input class="form-control text-box single-line" id="searchtext" placeholder="Plot No." required="required" type="text" value="">
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group row mb-0">
                                    <div class="col-sm-12 text-center">
                                        <input type="submit" id="btnsubmit" value="Submit" class="btn btn-success waves-effect waves-light" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">                                     
                                        <input type="reset" onclick="window.location.reload()" id="" value="Reset" class="btn btn-warning waves-effect waves-light">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-2" id="showLtlDiv">
            <div class="col-xl-12 text-center">
                <a style="display:none" id="showLtl" class="btn btn-sm btn-success" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="fa fa-arrow-down"></i></a>
            </div>
        </div>
       <div class="clearfix"></div>
        <div class="row mt-2">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body card-body-custom">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item"><a class="nav-link tab1 active" data-toggle="tab" href="#tab1" role="tab"><i class="ti-map-alt"></i> &nbsp;Map View &nbsp;</a></li>
                            <li class="nav-item"><a class="nav-link tab2" data-toggle="tab" href="#tab2" role="tab"><i class="mdi mdi-menu"></i> &nbsp;STATISTICS</a></li>
                            <li class="nav-item mt-2 ml-4"><span id="result" class="badge badge-info font-13"></span></li>
                        </ul>
                        <div class="tab-content p-3-side">
                            <div class="tab-pane active p-1" id="tab1" role="tabpanel">
                                <div id="map" class="fixHeightLeft" width="100%" height="100%" style="border:0;position:relative;height:calc(100vh - 215px)">
                                    <div id="popup" class="ol-popup" style="display:none">
                                        
                                        <a href="#" id="popup-closer" class="ol-popup-closer"></a>

                                        <div id="popup-content"></div>
                                    </div>
                                </div>
                                <div id="mySwitcher" class="switcher">
                                    <a href="javascript:void(0)" class="closebtn btn btn-sm btn-danger" onclick="closeNav()">&times;</a>

                                    <div class="mapFilterBase">
                                <div class="card">
                                    <div class="card-body" style="padding:10px">
                                        <div id="accordion" class="mapFilter">
                                            <a id="layerDiv" href="#collapseOne" class="text-dark" data-toggle="collapse" aria-expanded="true" aria-controls="collapseOne">
                                                <span class="d-block font-12"><img src="<spring:url value="/images/icon-layers.png"/>" style="width:12px">&nbsp;Layers</span>
                                            </a>
                                            
                                            <a id="measureDiv" href="#collapseFour" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapseFour">
                                                <span class="d-block font-12"><img src="<spring:url value="/images/icon-measurement.png"/>" style="width:12px">&nbsp;Measurement</span>
                                            </a>
                                            <div class="clearfix"></div>
                                            <div class="mb-0">
                                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                                    <div class="fixHeightRight">
                                                        
                                                        <div class="card-body">
                                                            <div id="accordion2">
                                                                <a id="layerDiv" href="#collapse1" class="text-dark collapsed" data-toggle="collapse" aria-expanded="true" aria-controls="collapse1">
                                                                    <h6 class="mt-0 header-title mb-3">Administrative Boundary <i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                </a>
                                                                <div id="collapse1" class="collapse show" aria-labelledby="heading1" data-parent="#accordion2">
                                                                    <form class="form-horizontal" action="">
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                            
                                                                                <input type="checkbox" id="chkstateboundary" checked="checked"/> State Boundary
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" id="chkdistrict" checked="checked"/>District Boundary
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chktehesil"/> Tehsil Boundary
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox"> 
                                                                                <input type="checkbox" id="chkgp"/>GP Boundary
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chkstdyvil"/>Village Boundary
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <a id="layerDiv" href="#collapse2" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse2">
                                                                    <h6 class="mt-0 header-title mb-4">Infrastructure <i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                </a>
                                                                <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordion2">
                                                                    <form class="form-horizontal" action="">
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox"> 
                                                                                <input type="checkbox" id="chkmajloc"/>Major Location
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chkJetties"/>Jetties
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox"> 
                                                                                <input type="checkbox" id="chkFLC"/>FLC
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chkPort"/>Port
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chklighthouse"/> Light House
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox"> 
                                                                                <input type="checkbox" id="chkfishinghrbr"/>Fishing Harbour
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chkmcs"/>Multipurpose Cyclone Shelters
                                                                            </div>
                                                                        </div>

                                                                    </form>
                                                                </div>
                                                                <a id="layerDiv" href="#collapse4" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse4">
                                                                    <h6 class="mt-0 header-title mb-4">Information on Coastal Aquaculture<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                </a>
                                                                <div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#accordion2">
                                                                    <div class="form-group-sm row">
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" id="chkcaa"/>Coastal Aquaculture Authority Boundary
                                                                        </div>
                                                                    </div>
                                                                    <div id="accordion3">
                                                                            <a id="layerDivprivate4kclip" href="#collapse12" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse12">
	                                                                            <h6 class="mt-0 header-title mb-4">  private land Available<i class="fa fa-angle-double-right">&nbsp;</i></h6>
	                                                                        </a>
	                                                                        <div id="collapse12" class="collapse" aria-labelledby="heading12" data-parent="#accordion3">
	                                                                            <form class="form-horizontal" action="">
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kbalclip"/>Baleshwar
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kbhaclip"/>Bhadrak
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kcutclip"/>Cuttack
	                                                                                    </div>
	                                                                                </div>
	                                                                             <!--    <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kganclip"/>Ganjam
	                                                                                    </div>
	                                                                                </div> -->	                                                                                
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kjagtclip"/>Jagatsinghpur
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kjajclip"/>Jajpur
	                                                                                    </div>
	                                                                                </div>
	                                                                                <!-- <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kkenclip"/>Kendrapada
	                                                                                    </div>
	                                                                                </div> -->
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kkhuclip"/>Khurdha
	                                                                                    </div>
	                                                                                </div>
	                                                                                
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kpurclip"/>Puri
	                                                                                    </div>
	                                                                                </div>
	
	                                                                            </form>
	                                                                            </div>
                                                                    <a id="layerDivprivate4k" href="#collapse12" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse12">
	                                                                            <h6 class="mt-0 header-title mb-4">  Cadastral 4k (Patch)<i class="fa fa-angle-double-right">&nbsp;</i></h6>
	                                                                        </a>
	                                                                        <div id="collapse12" class="collapse" aria-labelledby="heading12" data-parent="#accordion3">
	                                                                            <form class="form-horizontal" action="">
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kbal"/>Baleswar
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kbha"/>Bhadrak
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kcut"/>Cuttack
	                                                                                    </div>
	                                                                                </div>
	                                                                                <!-- <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kgan"/>Ganjam
	                                                                                    </div>
	                                                                                </div>	 -->                                                                                
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kjagt"/>Jagatsinghpur
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kjaj"/>Jajpur
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox">
	                                                                                        <input type="checkbox" id="chkprivate4kken"/>Kendrapada
	                                                                                    </div>
	                                                                                </div>
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kkhu"/>Khurdha
	                                                                                    </div>
	                                                                                </div>
	                                                                                
	                                                                                <div class="form-group-sm row">
	                                                                                    <div class="custom-control custom-checkbox"> 
	                                                                                        <input type="checkbox" id="chkprivate4kpur"/>Puri
	                                                                                    </div>
	                                                                                </div>
	
	                                                                            </form>
	                                                                        </div>
                                                                        <a id="layerDiv4k" href="#collapse9" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse5">
                                                                            <h6 class="mt-0 header-title mb-4">Cadastral 4k <i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                        </a>
                                                                        <div id="collapse9" class="collapse" aria-labelledby="heading5" data-parent="#accordion3">
                                                                            <form class="form-horizontal" action="">
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chk4kbal"/>Baleswar
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chk4kbha"/>Bhadrak
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chk4kcut"/>Cuttack
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chk4kgan"/>Ganjam
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chk4kjaj"/>Jajpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chk4kjagt"/>Jagatsinghpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chk4kken"/>Kendrapada
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chk4kkhu"/>Khurdha
                                                                                    </div>
                                                                                </div>                                                                                
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chk4kpur"/>Puri
                                                                                    </div>
                                                                                </div>

                                                                            </form>
                                                                        </div>
                                                                        <a id="layerDiv" href="#collapse6" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse6">
                                                                            <h6 class="mt-0 header-title mb-4">Aquaculture Ponds<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                        </a>
                                                                        <div id="collapse6" class="collapse" aria-labelledby="heading6" data-parent="#accordion3">
                                                                            <form class="form-horizontal" action="">
                                                                             <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkbalpnd"/>Baleswar
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkbhadrkpond"/>Bhadrak
                                                                                    </div>
                                                                                </div>
                                                                               
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkganjampond"/>Ganjam
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkjagatpond"/>Jagatsinghpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkkendrapond"/>Kendrapada
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkkhurdapond"/>Khurdha
                                                                                    </div>
                                                                                </div>                                                                                
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkpuripond"/>Puri
                                                                                    </div>
                                                                                </div>

                                                                            </form>
                                                                        </div>
                                                                        <a id="layerDiv" href="#collapse7" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse5">
                                                                            <h6 class="mt-0 header-title mb-4">Feasible Govt. Land <i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                        </a>
                                                                        <div id="collapse7" class="collapse" aria-labelledby="heading5" data-parent="#accordion3">
                                                                            <form class="form-horizontal" action="">
                                                                            <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfesbaleswar"/>Baleswar
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkfesbhadrak"/>Bhadrak
                                                                                    </div>
                                                                                </div>
                                                                                 <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkfesctk"/>Cuttack
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfesganjam"/>Ganjam
                                                                                    </div>
                                                                                </div>                                                                                
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkfesjajpur"/>Jajpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfesjagat"/>Jagatsinghpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfeskendra"/>Kendrapada
                                                                                    </div>
                                                                                </div>
                                                                               <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfeskhurda"/>Khurdha
                                                                                    </div>
                                                                                </div>
                                                                                
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkfespuri"/>Puri
                                                                                    </div>
                                                                                </div>

                                                                            </form>
                                                                        </div>
                                                                        <a id="layerDiv" href="#collapse8" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse8">
                                                                            <h6 class="mt-0 header-title mb-4">CAA Registered Farms<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                        </a>
                                                                        <div id="collapse8" class="collapse" aria-labelledby="heading6" data-parent="#accordion3">
                                                                            <form class="form-horizontal" action="">
                                                                           		<div class="form-group-sm row">
                                                                               		<div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfarmbaleswar"/>Baleswar
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkfarmbhadrak"/>Bhadrak
                                                                                    </div>
                                                                                </div>                                                                                
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfarmganjam"/>Ganjam
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkfarmjagatsinghpur"/>Jagatsinghpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkfarmkendrapara"/>Kendrapada
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkfarmpuri"/>Puri
                                                                                    </div>
                                                                                </div>

                                                                            </form>
                                                                        </div>
                                                                        <a id="layerDiv" href="#collapse5" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse5">
                                                                            <h6 class="mt-0 header-title mb-4">Govt Land <i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                        </a>
                                                                        <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#accordion3">
                                                                            <form class="form-horizontal" action="">
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkgvtlandbal"/>Baleswar
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkgvtlandbha"/>Bhadrak
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkgvtcut"/>Cuttack
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkgvtgan"/>Ganjam
                                                                                    </div>
                                                                                </div>
                                                                                 <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkgvtjaj"/>Jajpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkgvtjag"/>Jagatsinghpur
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkgvtken"/>Kendrapada
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkgvtkhu"/>Khurdha
                                                                                    </div>
                                                                                </div>                                                                                
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox"> 
                                                                                        <input type="checkbox" id="chkgvtpur"/>Puri
                                                                                    </div>
                                                                                </div>

                                                                            </form>
                                                                        </div>




                                                                    </div>
                                                                </div>

                                                                <a href="#collapse10" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse10">
                                                                    <h6 class="mt-0 header-title mb-4">CRZ Information<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                </a>
                                                                <div id="collapse10" class="collapse" aria-labelledby="heading10" data-parent="#accordion2">
                                                                    <form class="form-horizontal" action="">
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chkhtl"/>HTL
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group-sm row">
                                                                            <div class="custom-control custom-checkbox">
                                                                                <input type="checkbox" id="chkcrz"/>CRZ Boundary
                                                                            </div>
                                                                        </div>
                                                                        <a href="#collapse_crz1" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse_crz1">
                                                                            <h6 class="mt-0 header-title mb-4">CRZ I<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                         </a>
                                                                         <div id="collapse_crz1" class="collapse" aria-labelledby="heading_crz1" data-parent="#collapse10">
                                                                            <form class="form-horizontal" action="">
                                                                               <div class="form-group-sm row">
                                                                                   <div class="custom-control custom-checkbox">
                                                                                       <input type="checkbox" id="chkcrz_ia"/>CRZ-IA
                                                                                   </div>
                                                                               </div>
                                                                               <div class="form-group-sm row">
                                                                                   <div class="custom-control custom-checkbox">
                                                                                       <input type="checkbox" id="chkcrz_50m_ia"/>50m Mangrove Buffer zone -CRZ IA
                                                                                   </div>
                                                                                  
                                                                               </div>
                                                                               <div class="form-group-sm row">
                                                                                   <div class="custom-control custom-checkbox">
                                                                                       <input type="checkbox" id="chkcrz_ib"/>CRZ-IB
                                                                                   </div>
                                                                                </div>
                                                                            </form>
                                                                          </div>
                                                                        <a href="#collapse_crz2" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse_crz2">
                                                                            <h6 class="mt-0 header-title mb-4">CRZ II<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                        </a>
                                                                        <div id="collapse_crz2" class="collapse" aria-labelledby="heading_crz2" data-parent="#collapse10">
                                                                            <form class="form-horizontal" action="">
                                                                                  <div class="form-group-sm row">
                                                                                       <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkcrz_ii"/>CRZ-II
                                                                                      </div>	                                                                           
                                                                                  </div>
                                                                             </form>
                                                                         </div>
                                                                         <a href="#collapse_crz3" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse_crz3">
                                                                            <h6 class="mt-0 header-title mb-4">CRZ III<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                          </a>
                                                                          <div id="collapse_crz3" class="collapse" aria-labelledby="heading_crz3" data-parent="#collapse10">
                                                                            <form class="form-horizontal" action="">
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkcrz_ndz"/>No Development Zone
                                                                                    </div>	                                                                           
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkcrz_iiib"/>200 m to 500 m from HTL -CRZ IIIB
                                                                                    </div>	                                                                           
                                                                                </div>
                                                                              </form>
                                                                         </div>
                                                                         <a href="#collapse_crz4" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse_crz4">
                                                                            <h6 class="mt-0 header-title mb-4">CRZ IV<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                          </a>
                                                                          <div id="collapse_crz4" class="collapse" aria-labelledby="heading_crz4" data-parent="#collapse10">
                                                                            <form class="form-horizontal" action="">
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                         <input type="checkbox" id="chkcrz_iva"/>CRZ-IVA
                                                                                    </div>	                                                                           
                                                                                </div>
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                            <input type="checkbox" id="chkcrz_ivb"/>CRZ-IVB
                                                                                    </div>	                                                                           
                                                                                </div>	    
                                                                            </form>
                                                                        </div>
                                                                        <a href="#collapse_crzothers" class="text-dark collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="collapse_crzothers">
                                                                            <h6 class="mt-0 header-title mb-4">OTHERS<i class="fa fa-angle-double-right">&nbsp;</i></h6>
                                                                         </a> 
                                                                         <div id="collapse_crzothers" class="collapse" aria-labelledby="heading_crzothers" data-parent="#collapse10">
                                                                            <form class="form-horizontal" action="">                                                                  
                                                                                <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chkasi"/>Ecologically Sensitive Area
                                                                                    </div>
                                                                                </div>
                                                                                <!-- <div class="form-group-sm row">
                                                                                    <div class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" id="chksan"/> Sanctuary Boundary
                                                                                    </div>
                                                                                </div> -->
                                                                            </form>
                                                                         </div>                                                                          
                                                                    </form>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-0">
                                                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                                                    <div class="fixHeightRight">
                                                        
                                                        <div class="card-body">
                                                            <h6 class="mt-0 header-title mb-4">Measurement</h6>
                                                            <form class="form-horizontal" action="">
                                                                <div class="widget-body">
                                                                    <div id="measurementDiv" class="widget-main">
                                                                        <label class="radiobtn">
                                                                            <input type="radio" name="measurement" value="Polygon" checked> Area
                                                                            <span class="dot"></span>
                                                                        </label><br />
                                                                        <label class="radiobtn">
                                                                            <input type="radio" name="measurement" value="LineString"> Distance
                                                                            <span class="dot"></span>
                                                                        </label> <br />
                                                                        <samp id="js-result">

                                                                        </samp>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
				      <span class="switcherMenu btn btn-sm btn-dark" onclick="openNav()">L<br>a<br>y<br>e<br>r<br>s</span>
				      <div id="mySwitcher2" class="switcher2">
						  <a href="javascript:void(0)" class="closebtn btn btn-sm btn-danger" onclick="closeNav2()">&times;</a>
						   	<div class="btn-selector">
						        <button id="terrain" type="button" class="btn btn-sm btn-success waves-effect waves-light"><img src="<spring:url value="/images/icon-terrain.png"/>" width="20px">&nbsp;Terrain</button>
						        <button id="osm" type="button" class="btn btn-sm btn-success waves-effect waves-light"><img src="<spring:url value="/images/icon-satellite.png"/>" width="20px">&nbsp;Satellite</button>
						        <button id="cartography" type="button" class="btn btn-sm btn-success waves-effect waves-light"><img src="<spring:url value="/images/icon-cartography.png"/>" width="20px">&nbsp;Map View</button>
						      	<button id="bingmap" type="button" class="btn btn-sm btn-success waves-effect waves-light"><img src="<spring:url value="/images/icon-cartography.png"/>" width="20px">&nbsp;Bing Map</button>
						    </div>
				      </div>
				      <span class="switcherMenu2 btn btn-sm btn-dark" style="margin-top:7px" onclick="openNav2()"><i class="fa fa-map">&nbsp;</i> Basemap</span>				
				      <div id="mySwitcher3" class="switcher3">
                            <a href="javascript:void(0)" class="closebtn btn btn-sm btn-danger" onclick="closeNav3()">&times;</a>
                            <div class="mapFilterBase">
                                <div class="card">
                                    <div class="card-body" style="padding:10px">
                                        <div id="accordion" class="mapFilter">
                                            <a id="legendDiv" href="#collapseTwo" class="text-dark collapsed" data-toggle="collapse" aria-expanded="true" aria-controls="collapseTwo">
                                                <span class="d-block font-12"><img src="<spring:url value="/images/icon-legends.png"/>" style="width:12px">&nbsp;Legend</span>
                                            </a>
                                            <div class="clearfix"></div>
                                            <div class="mb-0">
                                                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
                                                    <div class="fixHeightRight" style="max-height:calc(100vh - 365px) !important">
                                                        
                                                        <div class="card-body">
                                                            <form class="form-horizontal" action="">
                                                                <div class="widget-body">
                                                                    <div class="maplayer-div">
                                                                        <div id="legendDiv" class="widget-main">
                                                                           		<h6 class="mt-2 header-title mb-2" id="icon_admin_heading">Administrative Boundaries</h6>
	                                                                            <span id="icon_district_boundary" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-district-boundary.jpg"/>" /></span> 
	                                                                            <span id="icon_tehsil" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-tehsil.jpg"/>" /></span> 
	                                                                            <span id="icon_gp_boundary" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-gp-boundary.jpg"/>" /></span> 
	                                                                            <span id="icon_village_boundary" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-village-boundary.jpg"/>"/></span> 
                                                                                <br/>
                                                                                <h6 class="mt-2 header-title mb-2" id="icon_infra_heading">Infrastructure</h6>
	                                                                            <span id="icon_flc" style="" class="legend-text-style"><img src="<spring:url value="/images/flc.png"/>" /></span> 
	                                                                            <span id="icon_cyclone_shelters" style="" class="legend-text-style"><img src="<spring:url value="/images/mcs.png"/>" /></span> 
	                                                                            <span id="icon_major_location" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-major-location.jpg"/>" /></span>
	                                                                            <span id="icon_jetties" style="" class="legend-text-style"><img src="<spring:url value="/images/jetty.jpg"/>" /></span> 
	                                                                            <span id="icon_port" style="" class="legend-text-style"><img src="<spring:url value="/images/port.png"/>" /></span>
	                                                                            <span id="icon_fishing_harbour" style="" class="legend-text-style"><img src="<spring:url value="/images/fishing_harbour.png"/>" /></span>
	                                                                            <span id="icon_light_house" style="" class="legend-text-style"><img src="<spring:url value="/images/light_house.png"/>" /></span>
                                                                                <br/>
                                                                                <h6 class="mt-0 header-title mb-2" id="icon_cadastral_heading">Information on Coastal Aquaculture</h6>
                                                                                <span id="icon_private_land" style="" class="legend-text-style"><img src="<spring:url value="/images/private_land.jpg"/>" /></span>
	                                                                            <span id="icon_cadastral" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-cadastral.jpg"/>" /></span> 
	                                                                            <span id="icon_aquaponds" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-aquaponds.jpg"/>" /></span> 
	                                                                            <span id="icon_feasible_land" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-feasible-land.jpg"/>" /></span> 
	                                                                            <span id="icon_registered_farms" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-registered-farms.jpg"/>" /></span> 
	                                                                            <span id="icon_govt_land" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-govt-land.jpg"/>" /></span> 
	                                                                            <span id="icon_caa_boundary" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-caa-boundary.jpg"/>" /></span> 
	                                                                            <br/>
                                                                                <h6 class="mt-2 header-title mb-2" id="icon_crz_heading">CRZ Information</h6>
	                                                                            <span id="icon_htl" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-htl.jpg"/>" /></span> 
	                                                                            <span id="icon_crz" style="" class="legend-text-style"><img src="<spring:url value="/images/crz_boundary.jpg"/>" /></span> 
	                                                                            <span id="icon_crz_ia" style="" class="legend-text-style"><img src="<spring:url value="/images/crz_ia.jpg"/>" /></span>
	                                                                            <span id="icon_crz_50m_ia" style="" class="legend-text-style"><img src="<spring:url value="/images/50m_Mangrove_Buffer.jpg"/>" /></span>
	                                                                            <span id="icon_crz_ib" style="" class="legend-text-style"><img src="<spring:url value="/images/crz_ib1.jpg"/>" /></span>
	                                                                            <span id="icon_crz_ii" style="" class="legend-text-style"><img src="<spring:url value="/images/crz_ii.jpg"/>" /></span>
	                                                                            <span id="icon_crz_ndz" style="" class="legend-text-style"><img src="<spring:url value="/images/ndz.jpg"/>" /></span>
	                                                                            <span id="icon_crz_iiib" style="" class="legend-text-style"><img src="<spring:url value="/images/crz_iiib.jpg"/>" /></span>
	                                                                            <span id="icon_crz_iva" style="" class="legend-text-style"><img src="<spring:url value="/images/crz_iva.jpg"/>" /></span>
	                                                                            <span id="icon_crz_ivb" style="" class="legend-text-style"><img src="<spring:url value="/images/crz_ivb.jpg"/>" /></span>
	                                                                           	<br/>                                                                            
                                                                                <h6 class="mt-2 header-title mb-2" id="icon_esa_heading">Ecologically Sensitive Area</h6>
	                                                                            <span id="icon_marine_protected_area" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-marine-protected-area.jpg"/>" /></span> 
	                                                                            <span id="icon_reserve_forest" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-reserve-forest.jpg"/>" /></span> 
	                                                                            <%-- <span id="icon_sanctuary" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-sanctuary.jpg"/>" /></span> --%> 
	                                                                            <span id="icon_mangroves" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-mangroves.jpg"/>" /></span> 
	                                                                            <span id="icon_salt_marshes" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-salt-marshes.jpg"/>" /></span> 
	                                                                            <span id="icon_mudflats" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-mudflats.jpg"/>" /></span> 
	                                                                            <span id="icon_sea_grass" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-sea-grass.jpg"/>" /></span> 
	                                                                            <span id="icon_sand_dunes" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-sand-dunes.jpg"/>" /></span> 
	                                                                            <span id="icon_turtle_nesting_ground" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-turtle-nesting-ground.jpg"/>" /></span> 
	                                                                            <span id="icon_horseshoe_crab" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-horseshoe-crab.jpg"/>" /></span> 
	                                                                            <span id="icon_bird_nesting" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-bird-nesting.jpg"/>" /></span> 
	                                                                            <span id="icon_asi" style="" class="legend-text-style"><img src="<spring:url value="/images/icon-asi.jpg"/>" /></span><br/>       
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                <span class="switcherMenu3 btn btn-sm btn-dark" onclick="openNav3()">L<br>e<br>g<br>e<br>n<br>d</span>

                            </div>
                            <div class="tab-pane p-3" id="tab2" role="tabpanel">
                                <button id="pdf" type="button" class="btn btn-sm btn-danger waves-effect waves-light mb-2"><i class="fas fa-file-pdf"></i></button>
                                <button id="csv" type="button" class="btn btn-sm btn-success waves-effect waves-light mb-2"><i class="fas fa-file-excel"></i></button>
                                <button id="print" type="button" class="btn btn-sm btn-warning waves-effect waves-light mb-2"><i class="fas fa-print"></i></button>                               
                                <h6>Feasible Govt. Land Statistics</h6>
                                <div class="table-responsive" id="tblprint" style="height:400px;overflow-y:scroll">                                    
                                    <table id="myData" class="table table-striped table-bordered nowrap" style="border-collapse:collapse;border-spacing:0;width:100%">
                                        <thead>
                                            <tr>
                                                <th>Sl.No.</th>
                                                <th>District</th>
                                                <th>Tehsil</th>
                                                <th>GP</th>
                                                <th>Village</th>
                                                <!-- <th>Khata No.</th> -->
                                                <th>Plot No.</th>
                                                <th>Kissam</th>
                                                <th>Avl.Area(ac.)</th>
                                                <th>CAA Regd. Farm(ac.)</th>
                                                <th>Aquapond Area(ac.)</th>
                                                <th>Latitude</th>
                                                <th>Longitude</th>
                                                <th class="custom-hide" id="csvhide">ViewMap</th>
                                            </tr>
                                        </thead>
                                        <tbody class="tbody"></tbody>
                                    </table>
                                    <table id="targetT" style="display:none"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
    <script src="https://openlayers.org/en/v4.6.5/build/ol-debug.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.4.3/proj4.js"></script>
    <script src="https://unpkg.com/ol-popup@4.0.0"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/reqwest/2.0.5/reqwest.min.js"></script>
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://epsg.io/32645.js"></script>
    <script src="<spring:url value="/js/tableHTMLExport.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.5/jspdf.plugin.autotable.min.js"></script>
    <script src="https://rawgit.com/simonbengtsson/jsPDF-AutoTable/master/dist/jspdf.plugin.autotable.js"></script>
    <script src="<spring:url value="/js/config.js"/>"></script>
    <script type="text/javascript">
    var dist_current_layer,tehsil_current_layer,gp_current_layer,vill_current_layer,plot_current_layer,plot_4k_layer,sanctuary_layer,fishingHarbour_layer,crz_layer,crz_ia_layer,crz_ib_layer;
        $('#ddllandtype').on('change', function () {
            if (this.value == 'Feasible Plot Checking') {
                $("#serchdiv").show();

            }
        });
        $('#ddldist').on('change', function () {
            if (this.value == "Baleshwar") {
                $("#chkfesbaleswar").prop("disabled", false);
                $("#chkfarmbaleswar").prop("disabled", false);
            }
            else if (this.value == "Bhadrak") {
                $("#chkfesbhadrak").prop("disabled", false);
                $("#chkfarmbhadrak").prop("disabled", false);
            }
            else if (this.value == "Cuttack") {
                $("#chkfesctk").prop("disabled", false);
            }
            else if (this.value == "Ganjam") {
                $("#chkfesganjam").prop("disabled", false);
                $("#chkfarmganjam").prop("disabled", false);
            }
            else if (this.value == "Jajapur") {
                $("#chkfesjajpur").prop("disabled", false);
            }
            else if (this.value == "Khurdha") {
                $("#chkfeskhurda").prop("disabled", false);
            }
            else if (this.value == "Puri") {
                $("#chkfespuri").prop("disabled", false);
                $("#chkfarmpuri").prop("disabled", false);
            }
            else if (this.value == "Kendrapara") {
                $("#chkfeskendra").prop("disabled", false);
                $("#chkfarmkendrapara").prop("disabled", false);
            }
            else if (this.value == "Jagatsinghapur") {
                $("#chkfesjagat").prop("disabled", false);
                $("#chkfarmjagatsinghpur").prop("disabled", false);
            }
        });
    </script>
    <script type="text/javascript">
    function projselect(distname) 
    {
    	if(distname!=""){
    		$.ajax({
                url:"/getTehsil/"+distname+"",
                 type: "GET",
                 success: function (data) 
                 {
                 	var result = JSON.parse(data);
                 	/* $(document).ajaxSend(function() {
             			$("#loaderdiv").show();
             		}).ajaxComplete(function() {
             			$("#loaderdiv").hide();
             		}); */
             		
             		$('#loaderdiv')
             	    .hide()  // Hide it initially
             	    .ajaxStart(function() {$(this).show();})
             	    .ajaxStop(function() {$(this).hide();});
                 	
                     var options = '';
                     $('#ddltehesil').html('');
                     $('#ddltehesil').append($("<option></option>")
                                     .attr("value", "ALL")
                                     .text("ALL"));
                     $('#ddlgp').html('');
                     $('#ddlgp').append($("<option></option>")
                                     .attr("value", "")
                                     .text("--Select--"));
                     $('#ddlvillage').html('');
                     $('#ddlvillage').append($("<option></option>")
                                     .attr("value", "")
                                     .text("--Select--"));
                     for(var i = 0; i < result.length; i++) {
                     	options += '<option value="' +result[i] + '">' +result[i] + '</option>';
     					$('#ddltehesil')
                         .append($("<option></option>")
                             .attr("value", result[i])
                             .text(result[i]));
     				}
                 },
                 error: function (errormessage) {
                 	alert('error');
                     alert(errormessage.responseText);
                 }
             });
	            //MapView
	            map.removeLayer(distlayer);
	       		distzoom(); 	       	
	       }
    	else{
    		$('#ddltehesil').html('');
            $('#ddltehesil').append($("<option></option>").attr("value", "").text("--Select--"));
            $('#ddlgp').html('');
            $('#ddlgp').append($("<option></option>").attr("value", "").text("--Select--"));
            $('#ddlvillage').html('');
            $('#ddlvillage').append($("<option></option>").attr("value", "").text("--Select--"));
            $('#txtplotno').html('');
            $('#txtplotno').append($("<option></option>").attr("value", "").text("--Select--"));
	    	  map.addLayer(distlayer);
	    	 if(dist_current_layer!=null){
                map.removeLayer(dist_current_layer);
             } if(tehsil_current_layer!=null){
                 map.removeLayer(tehsil_current_layer);
             } if(gp_current_layer!=null){
                map.removeLayer(gp_current_layer);
             }if(vill_current_layer!=null){
                map.removeLayer(vill_current_layer);
             }
	    	 $('#chkdistrict').prop('checked', false);
	           $('#chktehesil').prop('checked', false); 
              $('#chkgp').prop('checked', false); 
		      $('#chkstdyvil').prop('checked', false);
	    }
    } 	               
    function bindgp(tehsil) {
    	if(tehsil!="ALL"){    	    	
    	var gp = "";
        $.ajax({
        	url:"/getGp",
        	data: { 'tehsil': tehsil, 'dist': $('#ddldist option:selected').text() },
            type: "GET",
            success: function (data) {
                $('#ddlgp').html('');
                var result = JSON.parse(data);
                var options = '';
                $('#ddlgp').append($("<option></option>")
                           .attr("value", "ALL")
                           .text("ALL"));
                $('#ddlvillage').html('');
                $('#ddlvillage').append($("<option></option>")
                                .attr("value", "")
                                .text("--Select--"));
                for(var i = 0; i < result.length; i++) 
                {
                	options += '<option value="' +result[i] + '">' +result[i] + '</option>';
					$('#ddlgp').append($("<option></option>")
                               .attr("value", result[i])
                               .text(result[i]));
				}
            },
            error: function (errormessage) {
            	alert('Server Error');
            }
        }); 		
        map.removeLayer(distlayer);
        tehzoom();
        $("#icon_tehsil").show();
        $('#chktehesil').prop('checked', true); 
    	}
    	else{
    		$('#ddlgp').html('');
            $('#ddlgp').append($("<option></option>").attr("value", "").text("--Select--"));
            $('#ddlvillage').html('');
            $('#ddlvillage').append($("<option></option>").attr("value", "").text("--Select--"));
            $('#txtplotno').html('');
            $('#txtplotno').append($("<option></option>").attr("value", "").text("--Select--"));
  	    	if(tehsil_current_layer!=null){
                map.removeLayer(tehsil_current_layer);
             } if(gp_current_layer!=null){
                map.removeLayer(gp_current_layer);
             }
            $('#chktehesil').prop('checked', false); 
            $('#chkgp').prop('checked', false); 
  		    $('#chkstdyvil').prop('checked', false);
    	}
      }
        function bindvillage(gp) {
        	if(gp!="ALL"){
        		var vill = "";
                $.ajax({
                    url: "/getVillage",
                    data: { 'gp': gp, 'dist': $('#ddldist option:selected').text(), 'tehsil': $('#ddltehesil option:selected').text() },
                    type: "GET",
                    success: function (data) {
                    	$('#ddlvillage').html('');
                        var result = JSON.parse(data);
                        var options = '';
                        $('#ddlvillage').append($("<option></option>")
                                        .attr("value", "ALL")
                                        .text("ALL"));
                        
                        for(var i = 0; i < result.length; i++) 
                        {
                        	options += '<option value="' +result[i] + '">' +result[i] + '</option>';
        					$('#ddlvillage')
                            .append($("<option></option>")
                                .attr("value", result[i])
                                .text(result[i]));
        				}
                    },
                    error: function (errormessage) {
                        alert(errormessage.responseText);
                    }
                });
                gpzoom();
                $("#icon_gp_boundary").show();
		        $('#chkgp').prop('checked', true); 
        	}
        	else{
	        	  $('#ddlvillage').html('');
	   	          $('#ddlvillage').append($("<option></option>").attr("value", "").text("--Select--"));
	   	          $('#txtplotno').html('');
	   	          $('#txtplotno').append($("<option></option>").attr("value", "").text("--Select--"));
	   		    	if(gp_current_layer!=null){
	   	              map.removeLayer(gp_current_layer);
	   	           } 
	   		      $('#chkgp').prop('checked', false); 
	   		      $('#chkstdyvil').prop('checked', false);
        	}            		
        }
    function bindplotno(village) {
	    	if(village!="ALL"){
	    		$.ajax({
                    url: "/getPlotno",
                    data: { 'village': village, 'gp': $('#ddlgp option:selected').text(), 'dist': $('#ddldist option:selected').text(), 'tehsil': $('#ddltehesil option:selected').text() },
                    type: "GET",
                    success: function (data) {
                    	$('#txtplotno').html('');
                        var result = JSON.parse(data);
                        var options = '';
                        $('#txtplotno')
                            .append($("<option></option>")
                                .attr("value", "ALL")
                                .text("ALL"));
                        for(var i = 0; i < result.length; i++) {
                        	options += '<option value="' +result[i] + '">' +result[i] + '</option>';
        					$('#txtplotno')
                            .append($("<option></option>")
                                .attr("value", result[i])
                                .text(result[i]));
        				}                          
                    },
                    error: function (errormessage) {
                        alert(errormessage.responseText);
                    }
                });
	    		villzoom();
	            $("#icon_village_boundary").show();
	            $('#chkstdyvil').prop('checked', true); 
	    	}
	    	else{
	    		 $('#txtplotno').html('');
		          $('#txtplotno').append($("<option></option>").attr("value", "").text("--Select--"));
			    	if(vill_current_layer!=null){
		              map.removeLayer(vill_current_layer);
		           } 
			      $('#chkstdyvil').prop('checked', false); 
	    	}
                    
       }
    </script>
    <script type="text/javascript">
    var baselayer = new ol.layer.Tile({
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
    var stateboundarylayer = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:StateBoundary',
                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var distlayer = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:District_Boundary',
                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var blocklayer = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Block_Boundary',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var gplayer = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:GP_Boundary',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var tehesil = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Tehsil_Boundary',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var villlayer = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Village_Boundary',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });    
    var villstdylayer = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Study_Area_Villages',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    
   /////Infrastructure////
    var majorloc = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Major_Location',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Fish_land_centre = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:fish_landing_centre',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jetties = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:jetties',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var light_house = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:light_house',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var port = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:port',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Fishharbour = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:fishing_harbour',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var mcs = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Multipurpose_Cyclone_Shelter',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var HTL = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:HTL',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var CRZ = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:crz_boundary',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });

var fiftymtr_crz1a = new ol.layer.Image({
    source: new ol.source.ImageWMS({
        url: baseURLWMS,
        params: {
            'LAYERS': 'COAST:50m_mangrove_buffer_zone_crz_ia',

            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'

    })
});
var crz_ia = new ol.layer.Image({
    source: new ol.source.ImageWMS({
        url: baseURLWMS,
        params: {
            'LAYERS': 'COAST:crz_ia',

            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'

    })
});
var crz_ib = new ol.layer.Image({
    source: new ol.source.ImageWMS({
        url: baseURLWMS,
        params: {
            'LAYERS': 'COAST:crz_ib',

            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'

    })
});
var crz_ii_area = new ol.layer.Image({
    source: new ol.source.ImageWMS({
        url: baseURLWMS,
        params: {
            'LAYERS': 'COAST:crz_ii_area',

            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'

    })
});
var no_development_zone = new ol.layer.Image({
    source: new ol.source.ImageWMS({
        url: baseURLWMS,
        params: {
            'LAYERS': 'COAST:no_development_zone',

            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'

    })
});
var htl_200m_500m = new ol.layer.Image({
    source: new ol.source.ImageWMS({
        url: baseURLWMS,
        params: {
            'LAYERS': 'COAST:200_m_to_500_m_from_htl',

            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'

    })
});
var waterbody_crz_iva = new ol.layer.Image({
    source: new ol.source.ImageWMS({
        url: baseURLWMS,
        params: {
            'LAYERS': 'COAST:waterbody_crz_iva',

            'VERSION': '1.1.0'
        },
        serverType: 'geoserver'

    })
});
var waterbody_crz_ivb = new ol.layer.Image({
  source: new ol.source.ImageWMS({
      url: baseURLWMS,
      params: {
          'LAYERS': 'COAST:waterbody_crz_ivb',

          'VERSION': '1.1.0'
      },
      serverType: 'geoserver'

  })
});
   
  //CAA Boundary
    var caaboundary = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:CAA_Line_2k_from_HTL',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });

//ESA
    var ecoasi = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:ASI',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Bird_Nesting_Ground = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Bird_Nesting_Ground',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Horseshoe_Crab = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Horseshoe_Crab',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Mangroves_lyr = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Mangroves',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    
    var Marine_Protected_Area = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Marine_Protected_Area',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Mudflats = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Mudflats',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Reserve_Forest = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Reserve_Forest',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Salt_Marshes = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Salt_Marshes',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Sand_Dunes = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Sand_Dunes',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Sea_Grass = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Sea_Grass',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var Turtle_Nesting_Ground = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Turtle_Nesting_Ground',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    
  //private land available
  
    var bhadrak_clip = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:bhadrak_clip',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      });
      var baleshwar_clip = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:baleshwar_clip',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      });
      var khurdha_clip = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:khurdha_clip',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      });
      /* var kendrapada_lu_lc_4k = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:kendrapara_lu_lc_4k',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      }); */
      var jagatshingpur_clip = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:jagatshingpur_clip',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      });
      var puri_clip = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:puri_clip',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      });
      var jajpur_clip = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:jajpur_clip',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      });
      var cuttack_clip = new ol.layer.Image({
          source: new ol.source.ImageWMS({
              url: baseURLWMS,
              params: {
                  'LAYERS': 'COAST:cuttack_clip',

                  'VERSION': '1.1.0'
              },
              serverType: 'geoserver'

          })
      });
    
    //Cadastral 4k land Private Patch LU_LC

    var bhadrak_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:bhadrak_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var baleshwar_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:baleshwar_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var khurdha_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:khurdha_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var kendrapada_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:kendrapara_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jagatsingpur_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:jagatshingpur_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var puri_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:puri_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jajpur_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:jajpur_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var cuttack_lu_lc_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:cuttack_lu_lc_4k',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });

    //Cadastral 4k land

    var bhadrak_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Bhadrak_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var baleswar_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Baleshwar_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var ganjam_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Ganjam_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var khurda_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Khurdha_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var kendrapada_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Kendrapara_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jagatsingpur_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Jagatsinghapur_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var puri_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Puri_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jajpur_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Jajpur_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var cuttack_4k = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Cuttack_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });


//aqua pond

    var bal_pond = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Baleshwar_Aquaponds',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var bhadrk_pond = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Bhadrak_Aquaponds',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var ganjam_pond = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Ganjam_Aquaponds',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var puri_pond = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Puri_Aquaponds',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var kendrapada_pond = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Kendrapara_Aquaponds',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jagatsingh_pond = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Jagatsinghapur_Aquaponds',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var khurdha_pond = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Khurdha_Aquaponds',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });

//feasible land

    var bhadrak_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Bhadrak_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var baleswar_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Baleshwar_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var ganjam_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Ganjam_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var  khurda_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Khurdha_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var kendrapada_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Kendrapara_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jagatsingpur_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Jagatsinghapur_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var puri_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Puri_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jajpur_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Jajpur_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var cuttack_feasible = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Cuttack_Feasible_Land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });

    //Leased Farms

    var baleswar_farm = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Baleshwar_Leas_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var bhadrk_farm = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'Bhadrak_Leas_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var ganjam_farm = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Ganjam_Leas_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var puri_farm = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Puri_Leas_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var kendrapada_farm = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Kendrapara_Leas_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jagatsingh_farm = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:Jagatsinghapur_Leas_Plots',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });

    //Govt land

    var bhadrak_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'bhadrak_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var baleswar_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'baleshwar_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var ganjam_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'ganjam_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var khurda_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'Khurdha_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var kendrapada_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'Kendrapara_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jagatsingpur_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'Jagatsinghapur_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var puri_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'puri_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var jajpur_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:jajpur_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    var cuttack_govt = new ol.layer.Image({
        source: new ol.source.ImageWMS({
            url: baseURLWMS,
            params: {
                'LAYERS': 'COAST:cuttack_govt_land',

                'VERSION': '1.1.0'
            },
            serverType: 'geoserver'

        })
    });
    
  
    var map = new ol.Map({
        layers: [baselayer, carto, raster,bingMap, vectorLayer, stateboundarylayer, distlayer, tehesil,gplayer,villstdylayer,bhadrak_clip,baleshwar_clip,cuttack_clip,jagatshingpur_clip,jajpur_clip,khurdha_clip,puri_clip,
          	 bhadrak_lu_lc_4k, baleshwar_lu_lc_4k, khurdha_lu_lc_4k, kendrapada_lu_lc_4k, jagatsingpur_lu_lc_4k, puri_lu_lc_4k, jajpur_lu_lc_4k, cuttack_lu_lc_4k,
        	 bhadrak_4k, baleswar_4k, ganjam_4k, khurda_4k, kendrapada_4k, jagatsingpur_4k, puri_4k, jajpur_4k, cuttack_4k,
        	 ganjam_govt, khurda_govt, kendrapada_govt, jagatsingpur_govt, puri_govt,jajpur_govt, cuttack_govt, bhadrak_govt, baleswar_govt,
        	 bhadrk_pond, bal_pond, khurdha_pond, jagatsingh_pond, kendrapada_pond, puri_pond, ganjam_pond,
            bhadrak_feasible, baleswar_feasible, ganjam_feasible, khurda_feasible, kendrapada_feasible, jagatsingpur_feasible, puri_feasible, jajpur_feasible, cuttack_feasible, 
            baleswar_farm,bhadrk_farm, ganjam_farm, puri_farm, jagatsingh_farm, kendrapada_farm,
            caaboundary, HTL,CRZ ,fiftymtr_crz1a,crz_ia,crz_ib,crz_ii_area,no_development_zone,htl_200m_500m,waterbody_crz_iva,waterbody_crz_ivb,Fish_land_centre,jetties,light_house,port,Fishharbour,mcs,ecoasi, Bird_Nesting_Ground, Horseshoe_Crab, Mangroves_lyr, Marine_Protected_Area, Mudflats, Reserve_Forest, Salt_Marshes, Sand_Dunes, Sea_Grass, Turtle_Nesting_Ground,
            majorloc],
    controls: ol.control.defaults().extend([
        new ol.control.ScaleLine({
            units: 'metric'
        }),
        //new ol.control.FullScreen()
    ]),
        target: 'map',
    view: new ol.View({
        center: ol.proj.fromLonLat([85.190055, 20.886785]),
        zoom: 7,
        maxZoom: 23,
        minZoom: 5,
    })
    });
    function joom()
    {
        var featureRequest = new ol.format.WFS().writeGetFeature({
            srsName: 'EPSG:3857',
            featurePrefix: 'osm',
            featureTypes: ['block_boundary'],
            outputFormat: 'application/json',
            filter: new ol.format.filter.equalTo('block_name', 'Astaranga')
        });
        fetch('http://203.129.26.234:8080/geoserver/COAST/wfs', {
            method: 'POST',
            body: new XMLSerializer().serializeToString(featureRequest)
        }).then(function (response) {
            return response.json();
        }).then(function (json) {
            var features = new ol.format.GeoJSON().readFeatures(json);
            vectorSource.addFeatures(features);
            map.getView().fit(vectorSource.getExtent());
        });
    }

    var popup = new Popup();
    map.addOverlay(popup);

    //adminstrative

    baselayer.setVisible(false);
    raster.setVisible(false);
    carto.setVisible(false);
    //vectorLayer.setVisible(false);
    stateboundarylayer.setVisible(true);
    distlayer.setVisible(true);
    tehesil.setVisible(false);
    blocklayer.setVisible(false);
    gplayer.setVisible(false);
    villstdylayer.setVisible(false);
    
    //////CRZ Information/////
        CRZ.setVisible(false);
        HTL.setVisible(false);
        fiftymtr_crz1a.setVisible(false);
        crz_ia.setVisible(false);
        crz_ib.setVisible(false);
        crz_ii_area.setVisible(false);
        no_development_zone.setVisible(false);
        htl_200m_500m.setVisible(false);
        waterbody_crz_iva.setVisible(false);
        waterbody_crz_ivb.setVisible(false);
    	caaboundary.setVisible(false);   
    
	//Infra
    majorloc.setVisible(false);
    Fish_land_centre.setVisible(false);
    jetties.setVisible(false);
    light_house.setVisible(false);
    port.setVisible(false);
    Fishharbour.setVisible(false);
    mcs.setVisible(false);
    
    //ESA
    ecoasi.setVisible(false);
    Bird_Nesting_Ground.setVisible(false);
    Horseshoe_Crab.setVisible(false);
    Mangroves_lyr.setVisible(false);
    Marine_Protected_Area.setVisible(false);
    Mudflats.setVisible(false);
    Reserve_Forest.setVisible(false);
    Salt_Marshes.setVisible(false);
    Sand_Dunes.setVisible(false);
    Sea_Grass.setVisible(false);
    Turtle_Nesting_Ground.setVisible(false);
    
//private land Available
	
    baleshwar_clip.setVisible(false);
    bhadrak_clip.setVisible(false);
    cuttack_clip.setVisible(false);
    jagatshingpur_clip.setVisible(false);
    jajpur_clip.setVisible(false);
    khurdha_clip.setVisible(false);
    puri_clip.setVisible(false);  
  	//Cadastral 4k Land Private Patch

    bhadrak_lu_lc_4k.setVisible(false);
    baleshwar_lu_lc_4k.setVisible(false);
    khurdha_lu_lc_4k.setVisible(false);
    kendrapada_lu_lc_4k.setVisible(false);
    jagatsingpur_lu_lc_4k.setVisible(false);
    puri_lu_lc_4k.setVisible(false);
    jajpur_lu_lc_4k.setVisible(false);
    cuttack_lu_lc_4k.setVisible(false);

    //Cadastral 4k Land

    bhadrak_4k.setVisible(false);
    baleswar_4k.setVisible(false);
    ganjam_4k.setVisible(false);
    khurda_4k.setVisible(false);
    kendrapada_4k.setVisible(false);
    jagatsingpur_4k.setVisible(false);
    puri_4k.setVisible(false);
    jajpur_4k.setVisible(false);
    cuttack_4k.setVisible(false);
    
    //aqua pond
    bal_pond.setVisible(false);
    bhadrk_pond.setVisible(false);
    ganjam_pond.setVisible(false);
    puri_pond.setVisible(false);
    jagatsingh_pond.setVisible(false);
    kendrapada_pond.setVisible(false);
    khurdha_pond.setVisible(false);

    //feasible and

    bhadrak_feasible.setVisible(false);
    baleswar_feasible.setVisible(false);
    ganjam_feasible.setVisible(false);
    khurda_feasible.setVisible(false);
    kendrapada_feasible.setVisible(false);
    jagatsingpur_feasible.setVisible(false);
    puri_feasible.setVisible(false);
    jajpur_feasible.setVisible(false);
    cuttack_feasible.setVisible(false);
  	

    //Leased Farms

    baleswar_farm.setVisible(false);
    bhadrk_farm.setVisible(false);
    ganjam_farm.setVisible(false);
    puri_farm.setVisible(false);
    kendrapada_farm.setVisible(false);
    jagatsingh_farm.setVisible(false);

    //Govt land

    bhadrak_govt.setVisible(false);
    baleswar_govt.setVisible(false);
    ganjam_govt.setVisible(false);
    khurda_govt.setVisible(false);
    kendrapada_govt.setVisible(false);
    jagatsingpur_govt.setVisible(false);
    puri_govt.setVisible(false);
    jajpur_govt.setVisible(false);
    cuttack_govt.setVisible(false);
    
	/////Legend ///////
	$("#icon_private_land").hide();
    $("#icon_cadastral").hide();
    $("#icon_aquaponds").hide();
    $("#icon_feasible_land").hide();
    $("#icon_registered_farms").hide();
    $("#icon_govt_land").hide();

    $("#icon_caa_boundary").hide();   
        $("#icon_htl").hide();   
        $("#icon_crz").hide(); 
        $("#icon_crz_ia").hide();
        $("#icon_crz_50m_ia").hide(); 
        $("#icon_crz_ib").hide(); 
        $("#icon_crz_ii").hide(); 
        $("#icon_crz_ndz").hide(); 
        $("#icon_crz_iiib").hide(); 
        $("#icon_crz_iva").hide(); 
        $("#icon_crz_ivb").hide(); 
       
    $("#icon_marine_protected_area").hide();  
    $("#icon_reserve_forest").hide();        
   // $("#icon_sanctuary").hide();  
    $("#icon_mangroves").hide();  
    $("#icon_salt_marshes").hide(); 
    $("#icon_mudflats").hide(); 
    $("#icon_sea_grass").hide(); 
    $("#icon_sand_dunes").hide();
    $("#icon_turtle_nesting_ground").hide();
    $("#icon_horseshoe_crab").hide();
    $("#icon_bird_nesting").hide();
    $("#icon_asi").hide();

    $("#icon_district_boundary").show();
    $("#icon_tehsil").hide();
    $("#icon_gp_boundary").hide();
    $("#icon_village_boundary").hide();
  
    $("#icon_flc").hide();   
    $("#icon_cyclone_shelters").hide();
    $("#icon_major_location").hide();
    $("#icon_jetties").hide();
    $("#icon_port").hide();
    $("#icon_fishing_harbour").hide();
    $("#icon_light_house").hide();
    
    //CRZ Information CheckBox
    $("#chkhtl").change(function () {
        if (this.checked) {
        	$("#icon_htl").show();        	
            HTL.setVisible(true);

        }
        else {
        	$("#icon_htl").hide();
            HTL.setVisible(false);
        }
    });
    $("#chkcrz").change(function () {        	
            if (this.checked) {    		            	
            			$("#icon_crz").show();	            			
            			CRZ.setVisible(true);
                       	//bindecoinfowindow(Sanctuary, ["name"], ["Name"]);           		
            	} 
            else {
                $("#icon_crz").hide();
                $('#chkcrz').prop('checked', false); 
                CRZ.setVisible(false);
                //map.removeOverlay(popup);
                //popup.setPosition(undefined);
            }            
        });
        $("#chkcrz_ia").change(function () {
	        if (this.checked) {    		            	
	    			$("#icon_crz_ia").show();	            			
	    			crz_ia.setVisible(true);       	        	 		
	    	} 
	    	else {
	        $("#icon_crz_ia").hide();
	        $('#chkcrz_ia').prop('checked', false); 
	        crz_ia.setVisible(false);
	        //map.removeOverlay(popup);
	        //popup.setPosition(undefined);
	    	} 
                       
        });
        $("#chkcrz_50m_ia").change(function () {
            if (this.checked) {
                $("#icon_crz_50m_ia").show(); 
                fiftymtr_crz1a.setVisible(true);

            }
            else {
            	 $("#icon_crz_50m_ia").hide(); 
            	 $('#chkcrz_50m_ia').prop('checked', false); 
            	 fiftymtr_crz1a.setVisible(false);
            }
        });        
        
        $("#chkcrz_ii").change(function () {
        	if (this.checked) {
                $("#icon_crz_ii").show(); 
                crz_ii_area.setVisible(true);
                }
            else {
            	 $("#icon_crz_ii").hide();
            	 $('#chkcrz_ii').prop('checked', false); 
            	 crz_ii_area.setVisible(false);
            }
        });
        $("#chkcrz_ib").change(function () {
        	if (this.checked) {
                $("#icon_crz_ib").show(); 
                crz_ib.setVisible(true);
                }
            else {
            	 $("#icon_crz_ib").hide();
            	 $('#chkcrz_ib').prop('checked', false); 
            	 crz_ib.setVisible(false);
            }
        });
        $("#chkcrz_ndz").change(function () {
        	if (this.checked) {
                $("#icon_crz_ndz").show(); 
               no_development_zone.setVisible(true);
                }
            else {
            	 $("#icon_crz_ndz").hide();
            	 $('#chkcrz_ndz').prop('checked', false); 
            	 no_development_zone.setVisible(false);
            }
        });
        $("#chkcrz_iiib").change(function () {
        	if (this.checked) {
                $("#icon_crz_iiib").show(); 
                htl_200m_500m.setVisible(true);
                }
            else {
            	 $("#icon_crz_iiib").hide();
            	 $('#chkcrz_iiib').prop('checked', false); 
            	 htl_200m_500m.setVisible(false);
            }
        });
        $("#chkcrz_iva").change(function () {
        	if (this.checked) {
                $("#icon_crz_iva").show(); 
                waterbody_crz_iva.setVisible(true);
                }
            else {
            	 $("#icon_crz_iva").hide();
            	 $('#chkcrz_iva').prop('checked', false); 
            	 waterbody_crz_iva.setVisible(false);
            }
        });
        $("#chkcrz_ivb").change(function () {
        	if (this.checked) {
                $("#icon_crz_ivb").show(); 
                waterbody_crz_ivb.setVisible(true);
                }
            else {
            	 $("#icon_crz_ivb").hide();
            	 $('#chkcrz_ivb').prop('checked', false); 
            	 waterbody_crz_ivb.setVisible(false);
            }
        });
    $("#chkasi").change(function () {
        if (this.checked) {
            $("#icon_asi").show();
            $("#icon_horseshoe_crab").show();
            $("#icon_bird_nesting").show();
            $("#icon_mangroves").show(); 
            $("#icon_marine_protected_area").show();  
            $("#icon_mudflats").show();
            $("#icon_reserve_forest").show();        
            $("#icon_salt_marshes").show(); 
            $("#icon_sand_dunes").show();
            $("#icon_sea_grass").show(); 
            $("#icon_turtle_nesting_ground").show();
            ecoasi.setVisible(true);
            Horseshoe_Crab.setVisible(true);
            Bird_Nesting_Ground.setVisible(true);
            Mangroves_lyr.setVisible(true);
            Marine_Protected_Area.setVisible(true);
            Mudflats.setVisible(true);
            Reserve_Forest.setVisible(true);
            Salt_Marshes.setVisible(true);
            Sand_Dunes.setVisible(true);
            Sea_Grass.setVisible(true);
            Turtle_Nesting_Ground.setVisible(true);
            bindecoinfowindow(ecoasi, ["dist_name", "site_name", "area_sqm"], ["District", "Site Name", "Area(in Sqm)"]);
        }
        else {
            ecoasi.setVisible(false);
            Horseshoe_Crab.setVisible(false);
            Bird_Nesting_Ground.setVisible(false);
            Mangroves_lyr.setVisible(false);
            Marine_Protected_Area.setVisible(false);
            Mudflats.setVisible(false);
            Reserve_Forest.setVisible(false);
            Salt_Marshes.setVisible(false);
            Sand_Dunes.setVisible(false);
            Sea_Grass.setVisible(false);
            Turtle_Nesting_Ground.setVisible(false);
            $("#icon_asi").hide();
            $("#icon_horseshoe_crab").hide();
            $("#icon_bird_nesting").hide();
            $("#icon_mangroves").hide(); 
            $("#icon_marine_protected_area").hide();  
            $("#icon_mudflats").hide();
            $("#icon_reserve_forest").hide();        
            $("#icon_salt_marshes").hide(); 
            $("#icon_sand_dunes").hide();
            $("#icon_sea_grass").hide(); 
            $("#icon_turtle_nesting_ground").hide();
        }
    });
  //Administrative Boundary chkbox
    $("#chkstateboundary").change(function () {
        if (this.checked) {
            stateboundarylayer.setVisible(true);

        }
        else {
            stateboundarylayer.setVisible(false);
        }
    });
    $("#chkdistrict").change(function () {
        if (this.checked) {
        	$("#icon_district_boundary").show();
            popup.setPosition(undefined);
            map.removeOverlay(popup);
            if ($("#ddldist option:selected").val()== ""){
               
            	  distlayer.setVisible(true);
            }
            if(dist_current_layer!=null){
               
                map.addLayer(dist_current_layer);
             } 
            bindecoinfowindow(distlayer, ["dist_name", "coast_dist"], ["Name", "Coastal"]);
        }
        else {
        	 $("#icon_district_boundary").hide();
            distlayer.setVisible(false);
            map.removeOverlay(popup);
            if(dist_current_layer!=null){
                map.removeLayer(dist_current_layer);
             } 
            popup.setPosition(undefined);
        }
    });
    
    $("#chktehesil").change(function () {
        if ($("#ddldist option:selected").val() != "") {
        	 if ($("#ddltehesil option:selected").val() != "ALL"){
        		 if (this.checked) {
        			 $("#icon_tehsil").show();
                     //tehesil.getSource().updateParams({ 'CQL_FILTER': "dist_name='" + $("#ddldist option:selected").text() + "'" });
                     //tehesil.setVisible(true);
                     if(tehsil_current_layer!=null){
                         map.addLayer(tehsil_current_layer);
                       }
                 }
                 else {
                	 $("#icon_tehsil").hide();
                 	if(tehsil_current_layer!=null){
                         map.removeLayer(tehsil_current_layer);
                     }
                    // tehesil.setVisible(false);
                 }
        	 }else {
                 alert("Please select Tehsil!");
                 document.getElementById("ddltehesil").focus();
                 $('#chktehesil').prop('checked', false); 
                 return false;
             }
        }
        else {
            alert("Please select district!");
            document.getElementById("ddldist").focus();
            $('#chktehesil').prop('checked', false); 
            return false;
        }
    });
    $("#chkgp").change(function () {
        if ($("#ddldist option:selected").val() != "") {
        	 if ($("#ddltehesil option:selected").val() != "ALL"){
        		 if ($("#ddlgp option:selected").val() != "ALL"){
            		 if (this.checked) {
                        $("#icon_gp_boundary").show();
                         if(gp_current_layer!=null){
                             map.addLayer(gp_current_layer);
                           }
                     }
                     else {
                        $("#icon_gp_boundary").hide();
                     	if(gp_current_layer!=null){
                             map.removeLayer(gp_current_layer);
                         }
                     }
        		 }else {
                     alert("Please select GP!");
                     document.getElementById("ddlgp").focus();
                     $('#chkgp').prop('checked', false); 
                     return false;
                 }
        	 }else {
                 alert("Please select Tehsil!");
                 document.getElementById("ddltehesil").focus();
                 $('#chkgp').prop('checked', false); 
                 return false;
             }
        }
        else {
            alert("Please select district!");
            document.getElementById("ddldist").focus();
            $('#chkgp').prop('checked', false); 
            return false;
        }
    });
    $("#chkstdyvil").change(function () {
        if ($("#ddldist option:selected").val() != "") {
        	 if ($("#ddltehesil option:selected").val() != "ALL"){
        		 if ($("#ddlgp option:selected").val() != "ALL"){
        			 if ($("#ddlvillage option:selected").val() != "ALL"){
	            		 if (this.checked) {
                            $("#icon_village_boundary").show();
	                         if(vill_current_layer!=null){
	                             map.addLayer(vill_current_layer);
	                           }
	                     }
	                     else {
                            $("#icon_village_boundary").hide();
	                     	if(vill_current_layer!=null){
	                             map.removeLayer(vill_current_layer);
	                         }
	                     }
        			 }else {
                         alert("Please select Village!");
                         document.getElementById("ddlvillage").focus();
                         $('#chkstdyvil').prop('checked', false); 
                         return false;
                     }
        		 }else {
                     alert("Please select GP!");
                     document.getElementById("ddlgp").focus();
                     $('#chkstdyvil').prop('checked', false); 
                     return false;
                 }
        	 }else {
                 alert("Please select Tehsil!");
                 document.getElementById("ddltehesil").focus();
                 $('#chkstdyvil').prop('checked', false); 
                 return false;
             }
        }
        else {
            alert("Please select district!");
            document.getElementById("ddldist").focus();
            $('#chkgp').prop('checked', false); 
            return false;
        }
    });    
    
  //Infrastructure check box
    $("#chkmajloc").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
				if (this.checked) {  
                    $("#icon_major_location").show();     					
					//majorloc.getSource().updateParams({ 'CQL_FILTER': "dist_name='"+$('#ddldist').val()+"'" });
					majorloc.setVisible(true);
					bindecoinfowindow(majorloc, [ "dist_name", "major_loca" ],
							[ "District", "Location" ]);       								
				}		
			else{majorloc.setVisible(false);
                $("#icon_major_location").hide();
        		$('#chkmajloc').prop('checked', false); 
			}				
		});
    $("#chkFLC").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);			
					if (this.checked) {     
                            $("#icon_flc").show();     					
    						//Fish_land_centre.getSource().updateParams({ 'CQL_FILTER': "district='"+$('#ddldist').val()+"'" });
        					Fish_land_centre.setVisible(true);
        					bindecoinfowindow(Fish_land_centre, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);        								
    									
				}else{
                    $("#icon_flc").hide();
                    Fish_land_centre.setVisible(false);
            		$('#chkFLC').prop('checked', false);             		
				}
				
			});
    $("#chkJetties").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
					if (this.checked) {   
						$("#icon_jetties").show(); 
						//jetties.getSource().updateParams({ 'CQL_FILTER': "district='"+$('#ddldist').val()+"'" });
						jetties.setVisible(true);
        					bindecoinfowindow(jetties, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);   						
				}else{
					jetties.setVisible(false);
           			$("#icon_jetties").hide(); 
            		$('#chkJetties').prop('checked', false);             		
				}    				
			});
    $("#chkPort").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
					if (this.checked) {
						$("#icon_port").show();
						//port.getSource().updateParams({ 'CQL_FILTER': "district='"+$('#ddldist').val()+"'" });
						port.setVisible(true);
        				bindecoinfowindow(port, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);		
				}else{port.setVisible(false);
           			$("#icon_port").hide();
            		$('#chkPort').prop('checked', false);             		
				}
			});
    $("#chklighthouse").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
					if (this.checked) {
						$("#icon_light_house").show();  
						//light_house.getSource().updateParams({ 'CQL_FILTER': "district='"+$('#ddldist').val()+"'" });
						light_house.setVisible(true);
        				bindecoinfowindow(light_house, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]); 						
				}else{	
					light_house.setVisible(false);				
           			$("#icon_light_house").hide();
            		$('#chklighthouse').prop('checked', false); 
            		return false;
				}
			});
    $("#chkmcs").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
					if (this.checked) {
                        $("#icon_cyclone_shelters").show();     					
						//mcs.getSource().updateParams({ 'CQL_FILTER': "dist_name='"+$('#ddldist').val()+"'" });
						mcs.setVisible(true);
        					bindecoinfowindow(mcs, ["dist_name", "name", "shelter"], ["District", "Location", "Type"]);  
        		}else{mcs.setVisible(false);
                    $("#icon_cyclone_shelters").hide();
            		$('#chkmcs').prop('checked', false); 
				}    				
			});
    $("#chkfishinghrbr").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);				
					if (this.checked) {   
						$("#icon_fishing_harbour").show();  
						//Fishharbour.getSource().updateParams({ 'CQL_FILTER': "district='"+$('#ddldist').val()+"'" });
						Fishharbour.setVisible(true);
						bindecoinfowindow(Fishharbour, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]); 								
				}else{Fishharbour.setVisible(false);
           			$("#icon_fishing_harbour").hide(); 
            		$('#chkfishinghrbr').prop('checked', false); 
				}    				
			});
  //Coastal Aquaculture Authority Boundary
    $("#chkcaa").change(function () {
            if (this.checked) {
                $("#icon_caa_boundary").show();   
                caaboundary.setVisible(true);
            }
            else {
                $("#icon_caa_boundary").hide();   
                caaboundary.setVisible(false);
            }
        });    
  
 // Private Land Available
    
    $("#chkprivate4kkhuclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {
					$("#icon_private_land").show();
					  khurdha_clip.setVisible(true);
                     plot_4k_layer=khurdha_clip;
                     bindecoinfowindow(plot_4k_layer,"","");                  
			} else {
				$("#icon_private_land").hide();
				$('#chkprivate4kkhuclip').prop('checked', false); 
				khurdha_clip.setVisible(false);
			}
		});
$("#chkprivate4kjagtclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {  
				$("#icon_private_land").show();
				jagatshingpur_clip.setVisible(true);
                     plot_4k_layer=jagatshingpur_clip;
                     bindecoinfowindow(plot_4k_layer,"","");                         					
			} else {
				$("#icon_private_land").hide();
				jagatshingpur_clip.setVisible(false);
				$('#chkprivate4kjagtclip').prop('checked', false); 
			}
		});
/* $("#chkprivate4kkenclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {
				$("#icon_private_land").show();
               	kendrapada_lu_lc_4k.setVisible(true);
                  	plot_4k_layer=kendrapada_lu_lc_4k;
                   bindecoinfowindow(plot_4k_layer,"","");                   					
			} else {
				$("#icon_private_land").hide();
				kendrapada_lu_lc_4k.setVisible(false);
				$('#chkprivate4kkenclip').prop('checked', false); 
			}
		}); */
$("#chkprivate4kbhaclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {
				$("#icon_private_land").show();
				bhadrak_clip.setVisible(true);
					 plot_4k_layer=bhadrak_clip;
					 bindecoinfowindow(plot_4k_layer,"","");
			} else {
				$("#icon_private_land").hide();
				 $('#chkprivate4kbhaclip').prop('checked', false);
				 bhadrak_clip.setVisible(false);
			}
		});
$("#chkprivate4kbalclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {
				$("#icon_private_land").show();
				baleshwar_clip.setVisible(true);
                    plot_4k_layer=baleshwar_clip;
                    bindecoinfowindow(plot_4k_layer,"","");                  
             // baleshwar_lu_lc_4k.setVisible(true);
				   
			} else {
				$("#icon_private_land").hide();
				baleshwar_clip.setVisible(false);
				$('#chkprivate4kbalclip').prop('checked', false);
			}
		});
$("#chkprivate4kpurclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {
				$("#icon_private_land").show();
				puri_clip.setVisible(true);
                   plot_4k_layer=puri_clip;
                   bindecoinfowindow(plot_4k_layer,"","");                   
              // baleshwar_lu_lc_4k.setVisible(true);	   
			}
			 else {
				 $("#icon_private_land").hide();
				 puri_clip.setVisible(false);
				$('#chkprivate4kpurclip').prop('checked', false); 
			}
		});
$("#chkprivate4kcutclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {
				$("#icon_private_land").show();
				cuttack_clip.setVisible(true);
                   plot_4k_layer=cuttack_clip;   
                   bindecoinfowindow(plot_4k_layer,"","");   
              // baleshwar_lu_lc_4k.setVisible(true);	   
			}
			else {
				$("#icon_private_land").hide();
				cuttack_clip.setVisible(false);
				 $('#chkprivate4kcutclip').prop('checked', false);
			}
		});
$("#chkprivate4kjajclip").change(
		function() {
			map.removeOverlay(popup);
			popup.setPosition(undefined);
			if (this.checked) {
				$("#icon_private_land").show();
				jajpur_clip.setVisible(true);
               plot_4k_layer=jajpur_clip;
               bindecoinfowindow(plot_4k_layer,"","");
          // baleshwar_lu_lc_4k.setVisible(true);   
			}
		else {	
			$("#icon_private_land").hide();
			jajpur_clip.setVisible(false);
				$('#chkprivate4kjajclip').prop('checked', false); 
			}
		});

  
  //Cadastral 4k land Private Patch
  $("#chkprivate4kbal").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {
                         baleshwar_lu_lc_4k.setVisible(true);
                         plot_4k_layer=baleshwar_lu_lc_4k;
                         bindecoinfowindow(plot_4k_layer,"","");                  
                  // baleshwar_lu_lc_4k.setVisible(true);
					   
				} else {
					baleshwar_lu_lc_4k.setVisible(false);
					$('#chkprivate4kbal').prop('checked', false);
				}
			});
  $("#chkprivate4kbha").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {
						 bhadrak_lu_lc_4k.setVisible(true);
						 plot_4k_layer=bhadrak_lu_lc_4k;
						 bindecoinfowindow(plot_4k_layer,"","");
				} else {
					 $('#chkprivate4kbha').prop('checked', false);
					bhadrak_lu_lc_4k.setVisible(false);
				}
			});
  $("#chkprivate4kcut").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {
                  	cuttack_lu_lc_4k.setVisible(true);
                      plot_4k_layer=cuttack_lu_lc_4k;   
                      bindecoinfowindow(plot_4k_layer,"","");   
                 // baleshwar_lu_lc_4k.setVisible(true);	   
				}
				else {
					cuttack_lu_lc_4k.setVisible(false);
					 $('#chkprivate4kcut').prop('checked', false);
				}
			});
  $("#chkprivate4kjagt").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {                      	
                  	jagatsingpur_lu_lc_4k.setVisible(true);
                        plot_4k_layer=jagatsingpur_lu_lc_4k;
                        bindecoinfowindow(plot_4k_layer,"","");                         					
				} else {
					jagatsingpur_lu_lc_4k.setVisible(false);
					$('#chkprivate4kjagt').prop('checked', false); 
				}
			});
  $("#chkprivate4kjaj").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {
					jajpur_lu_lc_4k.setVisible(true);
                  plot_4k_layer=jajpur_lu_lc_4k;
                  bindecoinfowindow(plot_4k_layer,"","");
             // baleshwar_lu_lc_4k.setVisible(true);   
				}
			else {					
					jajpur_lu_lc_4k.setVisible(false);
					$('#chkprivate4kjaj').prop('checked', false); 
				}
			});
  $("#chkprivate4kken").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {
                  	kendrapada_lu_lc_4k.setVisible(true);
                     	plot_4k_layer=kendrapada_lu_lc_4k;
                      bindecoinfowindow(plot_4k_layer,"","");                   					
				} else {
					kendrapada_lu_lc_4k.setVisible(false);
					$('#chkprivate4kken').prop('checked', false); 
				}
			});
	$("#chkprivate4kkhu").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {                    	
						  khurdha_lu_lc_4k.setVisible(true);
                          plot_4k_layer=khurdha_lu_lc_4k;
                          bindecoinfowindow(plot_4k_layer,"","");                  
				} else {
					$('#chkprivate4kkhu').prop('checked', false); 
					khurdha_lu_lc_4k.setVisible(false);
				}
			});

	$("#chkprivate4kpur").change(
			function() {
				map.removeOverlay(popup);
				popup.setPosition(undefined);
				if (this.checked) {
                    	puri_lu_lc_4k.setVisible(true);
                        plot_4k_layer=puri_lu_lc_4k;
                        bindecoinfowindow(plot_4k_layer,"","");                   
                   // baleshwar_lu_lc_4k.setVisible(true);	   
 				}
				 else {
					puri_lu_lc_4k.setVisible(false);
					$('#chkprivate4kpur').prop('checked', false); 
				}
			});	
	
	
    //Cadastral 4k land
 $("#chk4kbal").change(
 		function() {
 			map.removeOverlay(popup);
 			popup.setPosition(undefined);
 			if (this.checked) { 					
 					    //$('#chk4kbal').prop('checked', true);
 					    $("#icon_cadastral").show();
 					   baleswar_4k.setVisible(true);
 					   plot_4k_layer=baleswar_4k;
 					   bindecoinfowindow(plot_4k_layer,"","");
 			} else {
 				$("#icon_cadastral").hide();
 				baleswar_4k.setVisible(false);
 				$('#chk4kbal').prop('checked', false);
 			}
 		});    
 $("#chk4kbha").change(function() {
 	map.removeOverlay(popup);
 	popup.setPosition(undefined);
 	if (this.checked) { 			
 			    //$('#chk4kbha').prop('checked', true);
 			    $("#icon_cadastral").show();
 			  	bhadrak_4k.setVisible(true);
 			    plot_4k_layer=bhadrak_4k;
 			   bindecoinfowindow(plot_4k_layer,"",""); 
 				/* bindecoinfowindow(bhadrak_4k, ["tehname", "gpname", "villname", "plotno", "crzsts"],
 						["Tehsil", "GP", "Village", "Plot No", "CRZ Status"]);	 */
 		}
 	else {
 		$("#icon_cadastral").hide();
 		bhadrak_4k.setVisible(false);
 		$('#chk4kbha').prop('checked', false);
 	}
 });
 $("#chk4kcut").change(
	 		function() {
	 			map.removeOverlay(popup);
	 			popup.setPosition(undefined);
	 			if (this.checked) {   
	 				$("#icon_cadastral").show(); 				
	                	cuttack_4k.setVisible(true);
	                	plot_4k_layer=cuttack_4k;
						bindecoinfowindow(plot_4k_layer,"","");
	                	/* bindecoinfowindow(cuttack_4k, ["teh_name", "gp_name", "vill_name", "plotno", "crz_sts"],
	 							["Tehsil", "GP", "Village", "Plot No", "CRZ Status"]); */                
	 			} else {
	 				$("#icon_cadastral").hide();
	 				cuttack_4k.setVisible(false);
	 				$('#chk4kcut').prop('checked', false); 
	 			}
	 		});
 
 $("#chk4kgan").change(
		function() {
			map.removeOverlay(popup);
          popup.setPosition(undefined);
			if (this.checked) {
           	  	  $("#icon_cadastral").show();
           	  	  ganjam_4k.setVisible(true);
                    plot_4k_layer=ganjam_4k;
                    bindecoinfowindow(plot_4k_layer,"","");                    
                    /* bindecoinfowindow(ganjam_4k, [ "tehname", "gpname",
							"villname", "plotno", "crzsts" ], [ "Tehsil",
							"GP", "Village", "Plot No", "CRZ Status" ]);  */              
			} else {
				$("#icon_cadastral").hide();
				ganjam_4k.setVisible(false);
				$('#chk4kgan').prop('checked', false); 
			}
		});
 
 $("#chk4kjagt").change(
	 		function() {
	 			map.removeOverlay(popup);
	 			popup.setPosition(undefined);
	 			if (this.checked) {
	 				$("#icon_cadastral").show();
	 					jagatsingpur_4k.setVisible(true);
	                	plot_4k_layer=jagatsingpur_4k;
	                	bindecoinfowindow(plot_4k_layer,"","");
	                	/* bindecoinfowindow(jagatsingpur_4k, ["tehname", "gpname", "villname", "plotno", "crzsts"],
	 							["Tehsil", "GP", "Village", "Plot No", "CRZ Status"]);              	
	          	 */
	 			} else {
	 				$("#icon_cadastral").hide();
	 				jagatsingpur_4k.setVisible(false);
	 				$('#chk4kjagt').prop('checked', false); 
	 			}
	 		});

 $("#chk4kjaj").change(
 		function() {
 			map.removeOverlay(popup);
 			popup.setPosition(undefined);
 			if (this.checked) {
 					$("#icon_cadastral").show();                	
                	jajpur_4k.setVisible(true);
                	plot_4k_layer=jajpur_4k;
					bindecoinfowindow(plot_4k_layer,"","");
                	/* bindecoinfowindow(jajpur_4k, ["tehname", "gpname", "villname", "plotno", "crzsts"],
 							["Tehsil", "GP", "Village", "Plot No", "CRZ Status"]); */              
 			} else {
 				$("#icon_cadastral").hide();
 				jajpur_4k.setVisible(false);
 				$('#chk4kjaj').prop('checked', false); 
 			}
 		});
	
 $("#chk4kken").change(
 		function() {
 			map.removeOverlay(popup);
 			popup.setPosition(undefined);
 			if (this.checked) {  	 
 				$("#icon_cadastral").show();
 					kendrapada_4k.setVisible(true);
 					plot_4k_layer=kendrapada_4k;
                	/* bindecoinfowindow(kendrapada_4k, ["teh_name", "gp_name", "vill_name", "plotno", "crz_sts"],
 							["Tehsil", "GP", "Village", "Plot No", "CRZ Status"]); */
                bindecoinfowindow(plot_4k_layer,"","");          
 			} else {
 				$("#icon_cadastral").hide();
 				kendrapada_4k.setVisible(false);
 				$('#chk4kken').prop('checked', false); 
 			}
 		});
  
 $("#chk4kkhu").change(
 		function() {
 			map.removeOverlay(popup);
 			popup.setPosition(undefined);
 			if (this.checked) {
 					$("#icon_cadastral").show();
 					khurda_4k.setVisible(true);
                	plot_4k_layer=khurda_4k;                	
                	bindecoinfowindow(plot_4k_layer,"","");
                	/* bindecoinfowindow(khurda_4k, [ "tehname", "gpname",
 						"villname", "plotno", "crzsts" ], [ "Tehsil",
 						"GP", "Village", "Plot No", "CRZ Status" ]); */
 			} else {
 				$("#icon_cadastral").hide();
 				khurda_4k.setVisible(false);
 				$('#chk4kkhu').prop('checked', false); 
 			}
 		});


 $("#chk4kpur").change(
 		function() {
 			map.removeOverlay(popup);
 			popup.setPosition(undefined);
 			if (this.checked) {
 				//$('#chk4kpur').prop('checked', true);
 				$("#icon_cadastral").show();                	
                	puri_4k.setVisible(true);
                	plot_4k_layer=puri_4k;
					bindecoinfowindow(plot_4k_layer,"","");
                	/* bindecoinfowindow(puri_4k, ["tehname", "gpname", "villname", "plotno", "crzsts"],
 							["Tehsil", "GP", "Village", "Plot No", "CRZ Status"]); */       
 			} else {
 				puri_4k.setVisible(false);
 				$("#icon_cadastral").hide();				
 				$('#chk4kpur').prop('checked', false); 
 			}
 		});

    
    //pond chkbox
    $("#chkbalpnd").change(function () {
        	 map.removeOverlay(popup);
             popup.setPosition(undefined);
            if (this.checked) {            	
            		 $("#icon_aquaponds").show();
            		 bal_pond.setVisible(true);
            		 plot_4k_layer=bal_pond;
             		 bindecoinfowindow(plot_4k_layer,"","");
                     //bindecoinfowindow(bal_pond,["distname", "tehname","gpname","villname","pondno","regno","licensed","areaac"], ["District", "Tehsil","Gp","Village","Pond No","Registration","Licensed","Area in acre"]);
            }	
            else {
            	$("#icon_aquaponds").hide();
                bal_pond.setVisible(false);               
                $('#chkbalpnd').prop('checked', false);
            }
        });
        $("#chkbhadrkpond").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_aquaponds").show();
            		 bhadrk_pond.setVisible(true);
            		 plot_4k_layer=bhadrk_pond;
             		 bindecoinfowindow(plot_4k_layer,"","");
                     //bhadrak_leased.setVisible(true);
                     //bindecoinfowindow(bhadrk_pond,["distname", "tehname","gpname","villname","pondno","regno","licensed","areaac"], ["District", "Tehsil","Gp","Village","Pond No","Registration","Licensed","Area in acre"]);
            }            	
            else {
            	$("#icon_aquaponds").hide();
                bhadrk_pond.setVisible(false);
                $('#chkbhadrkpond').prop('checked', false); 
            }
        });
        $("#chkganjampond").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {	            	
	            		$("#icon_aquaponds").show();
	            		 ganjam_pond.setVisible(true);
	            		 plot_4k_layer=ganjam_pond;
	             		 bindecoinfowindow(plot_4k_layer,"","");
	                     //bindecoinfowindow(ganjam_pond,["distname", "tehname","gpname","villname","pondno","regno","licensed","areaac"], ["District", "Tehsil","Gp","Village","Pond No","Registration","Licensed","Area in acre"]);
			 }
            else {
            	$("#icon_aquaponds").hide();
                ganjam_pond.setVisible(false);
                $('#chkganjampond').prop('checked', false); 
            }
        });
        $("#chkkhurdapond").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_aquaponds").show();
            		khurdha_pond.setVisible(true);
            		plot_4k_layer=khurdha_pond;
            		bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(khurdha_pond,["distname", "tehname","gpname","villname","pondno","regno","licensed","areaac"], ["District", "Tehsil","Gp","Village","Pond No","Registration","Licensed","Area in acre"]); 	
            }
            else {
            	$("#icon_aquaponds").hide();
                khurdha_pond.setVisible(false);
                $('#chkkhurdapond').prop('checked', false); 
            }
        });
        $("#chkjagatpond").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {
            		$("#icon_aquaponds").show();
            		jagatsingh_pond.setVisible(true);
            		plot_4k_layer=jagatsingh_pond;
            		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(jagatsingh_pond,["distname", "tehname","gpname","villname","pondno","regno","licensed","areaac"], ["District", "Tehsil","Gp","Village","Pond No","Registration","Licensed","Area in acre"]); 	
              }
            else {
            	$("#icon_aquaponds").hide();
                jagatsingh_pond.setVisible(false);
                $('#chkjagatpond').prop('checked', false); 
            }
        });
        $("#chkkendrapond").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_aquaponds").show();
            		kendrapada_pond.setVisible(true);
            		plot_4k_layer=kendrapada_pond;
            		bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(kendrapada_pond,["distname", "tehname","gpname","villname","pondno","regno","licensed","areaac"], ["District", "Tehsil","Gp","Village","Pond No","Registration","Licensed","Area in acre"]); 	
            }
            else {
            	$("#icon_aquaponds").hide();
                kendrapada_pond.setVisible(false);
                $('#chkkendrapond').prop('checked', false); 
            }
        });
        $("#chkpuripond").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_aquaponds").show();
            		 puri_pond.setVisible(true);
            		 plot_4k_layer=puri_pond;
             		 bindecoinfowindow(plot_4k_layer,"","");
                     //bindecoinfowindow(puri_pond,["distname", "tehname","gpname","villname","pondno","regno","licensed","areaac"], ["District", "Tehsil","Gp","Village","Pond No","Registration","Licensed","Area in acre"]); 	
            }
            else {
            	$("#icon_aquaponds").hide();
                puri_pond.setVisible(false);
                $('#chkpuripond').prop('checked', false); 
            }
        });

//Feasible Land Checkbox
   	$("#chkfesbhadrak").change(function () {
       	    map.removeOverlay(popup);
       	    popup.setPosition(undefined);
       	    if (this.checked) {
       	    		$("#icon_feasible_land").show();
       	    		bhadrak_feasible.setVisible(true);
       	    		plot_4k_layer=bhadrak_feasible; 
       	            bindecoinfowindow(plot_4k_layer,"","");                                 
       	    }
       	    else {
       	        bhadrak_feasible.setVisible(false);
       	        $("#icon_feasible_land").hide();
       	        $('#chkfesbhadrak').prop('checked', false); 
       	    }
       	});
       $("#chkfesbaleswar").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {
           		$("#icon_feasible_land").show();
           		baleswar_feasible.setVisible(true);  
           		plot_4k_layer=baleswar_feasible;            		                  
                   //bindecoinfowindow(baleswar_feasible,["teh_name","gp_name","vill_name", "plotno", "area_ac", "kisam_eng", "g_type"], ["Tehsil","Gp","Village","plot No", "Area in acre", "kissam", "Land Type"]);
           		bindecoinfowindow(plot_4k_layer,"","");  
           }
           else {
               baleswar_feasible.setVisible(false);
               $("#icon_feasible_land").hide();
               $('#chkfesbaleswar').prop('checked', false);
           }
       });
       $("#chkfesganjam").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {
           		$("#icon_feasible_land").show();
           		ganjam_feasible.setVisible(true);
                   plot_4k_layer=ganjam_feasible;
                  // bindecoinfowindow(ganjam_feasible, ["tehname","gpname","villname", "plotno", "khatano" , "areaac", "kisameng", "gtype"], ["Tehsil","Gp","Village", "plot No", "Khata No.", "Area in acre", "kissam", "Land Type"]);
                   bindecoinfowindow(plot_4k_layer,"","");  
           }
           else {
               ganjam_feasible.setVisible(false);
               $("#icon_feasible_land").hide();
               $('#chkfesganjam').prop('checked', false);
           }
       });
       $("#chkfeskhurda").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {
           		$("#icon_feasible_land").show();
           		khurda_feasible.setVisible(true);
                   plot_4k_layer=khurda_feasible;
                   //bindecoinfowindow(khurda_feasible, ["tehname","gpname", "villname", "plotno","khatano" , "areaac", "kisameng", "gtype"], ["Tehsil","Gp","Village", "plot No","Khata No.", "Area in acre", "kissam", "Land Type"]);
                   bindecoinfowindow(plot_4k_layer,"","");  
             }
           else {
               khurda_feasible.setVisible(false);
               $("#icon_feasible_land").hide();
               $('#chkfeskhurda').prop('checked', false); 
           }
       });
       $("#chkfesjagat").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {   
           		$("#icon_feasible_land").show();
           		jagatsingpur_feasible.setVisible(true);
                   plot_4k_layer=jagatsingpur_feasible;
                   //bindecoinfowindow(jagatsingpur_feasible, ["tehname","gpname", "villname", "plotno","khatano" , "areaac", "kisameng", "gtype"], ["Tehsil","Gp","Village", "plot No","Khata No.", "Area in acre", "kissam", "Land Type"]);
                   bindecoinfowindow(plot_4k_layer,"","");  
                  }
           else {
           	$("#icon_feasible_land").hide();
               jagatsingpur_feasible.setVisible(false);
               $('#chkfesjagat').prop('checked', false); 
           }
       });
       $("#chkfeskendra").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {  
           		$("#icon_feasible_land").show();
           		kendrapada_feasible.setVisible(true);
                   plot_4k_layer=kendrapada_feasible;
                   //bindecoinfowindow(kendrapada_feasible, ["tehname", "gpname", "villname", "plotno","khatano" , "areaac", "kisameng", "gtype"], ["Tehsil","Gp", "Village", "plot No","Khata No.", "Area in acre", "kissam", "Land Type"]);                   
                   bindecoinfowindow(plot_4k_layer,"","");  
           }
           
           else {
           	$("#icon_feasible_land").hide();
               kendrapada_feasible.setVisible(false);
               $('#chkfeskendra').prop('checked', false); 
           }
       });
       $("#chkfesctk").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {
           		$("#icon_feasible_land").show();
           		cuttack_feasible.setVisible(true);
                   plot_4k_layer=cuttack_feasible;
                   //bindecoinfowindow(cuttack_feasible, ["tehname","gpname","villname", "plotno","khatano" , "areaac", "kisameng", "gtype"], ["Tehsil","Gp","Village", "plot No","Khata No.", "Area in acre", "kissam", "Land Type"]);
                   bindecoinfowindow(plot_4k_layer,"","");  
           }
           else {
           	$("#icon_feasible_land").hide();
               cuttack_feasible.setVisible(false);
               $('#chkfesctk').prop('checked', false); 
           }
       });
       $("#chkfesjajpur").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {     
           		$("#icon_feasible_land").show();
           		jajpur_feasible.setVisible(true);
                   plot_4k_layer=jajpur_feasible;
                   //bindecoinfowindow(jajpur_feasible, ["tehname", "villname", "plotno","khatano" , "areaac", "kisameng", "gtype"], ["Tehsil", "Village", "plot No","Khata No.", "Area in acre", "kissam", "Land Type"]);                   
                   bindecoinfowindow(plot_4k_layer,"","");  
             }
           else {
           	$("#icon_feasible_land").hide();
               jajpur_feasible.setVisible(false);
               $('#chkfesjajpur').prop('checked', false); 
           }
       });
       $("#chkfespuri").change(function () {
           map.removeOverlay(popup);
           popup.setPosition(undefined);
           if (this.checked) {
           	$("#icon_feasible_land").show();
           	puri_feasible.setVisible(true);
               plot_4k_layer=puri_feasible;
               //bindecoinfowindow(puri_feasible, ["tehname", "villname", "plotno","khatano" , "areaac", "kisameng", "gtype"], ["Tehsil", "Village", "plot No","Khata No.", "Area in acre", "kissam", "Land Type"]);
               bindecoinfowindow(plot_4k_layer,"","");  
        	 }
           else {
           	$("#icon_feasible_land").hide();
               puri_feasible.setVisible(false);
               $('#chkfespuri').prop('checked', false); 
           }
       });
       
 //leased farms chkbox
     $("#chkfarmbhadrak").change(function () {
            	map.removeOverlay(popup);
                popup.setPosition(undefined);
            if (this.checked) {				
					$("#icon_registered_farms").show();									
					bhadrk_farm.setVisible(true);	
					plot_4k_layer=jajpur_4k;
					bindecoinfowindow(plot_4k_layer,"","");
                	//bindecoinfowindow(bhadrk_farm,'','');                	
            }
            else {
            	$("#icon_registered_farms").hide();	
                bhadrk_farm.setVisible(false);
                $('#chkfarmbhadrak').prop('checked', false); 
            }
        });
        $("#chkfarmbaleswar").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
				$("#icon_registered_farms").show();	
            	baleswar_farm.setVisible(true);
            	plot_4k_layer=baleswar_farm;
				bindecoinfowindow(plot_4k_layer,"","");
            	//bindecoinfowindow(baleswar_farm, ["villname","plotno","areaac"], ["Tehsil", "Plot No", "Area"]);
            	//bindecoinfowindow(plot_current_layer,'','');
            }
            else {
            	$("#icon_registered_farms").hide();
                baleswar_farm.setVisible(false);
                $('#chkfarmbaleswar').prop('checked', false); 
            }
        });
        $("#chkfarmganjam").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_registered_farms").show();	
            		ganjam_farm.setVisible(true);
            		plot_4k_layer=ganjam_farm;
    				bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(ganjam_farm,["tehname", "plotno", "areaac"], ["Tehsil", "Plot No", "Area"]);
            }
            else {
            	$("#icon_registered_farms").hide();
                ganjam_farm.setVisible(false);
                $('#chkfarmganjam').prop('checked', false); 
            }
        });
        $("#chkfarmjagatsinghpur").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_registered_farms").show();	
            		jagatsingh_farm.setVisible(true);
            		plot_4k_layer=jagatsingh_farm;
            		bindecoinfowindow(plot_4k_layer,"","");
                   // bindecoinfowindow(jagatsingh_farm, ["tehname", "plotno", "areaac"], ["Tehsil", "Pond No", "Area"]);
            }
            else {
            	$("#icon_registered_farms").hide();
                jagatsingh_farm.setVisible(false);
                $('#chkfarmjagatsinghpur').prop('checked', false); 
            }
        });
        $("#chkfarmkendrapara").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_registered_farms").show();	
            		kendrapada_farm.setVisible(true);
            		plot_4k_layer=kendrapada_farm;
            		bindecoinfowindow(plot_4k_layer,"","");
                   // bindecoinfowindow(kendrapada_farm, ["tehname", "plotno", "areaac"], ["Tehsil", "Pond No", "Area"]);
            }
            else {
            	$("#icon_registered_farms").hide();
                kendrapada_farm.setVisible(false);
                $('#chkfarmkendrapara').prop('checked', false); 
            }
        });
        $("#chkfarmpuri").change(function () {
        	map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_registered_farms").show();	
            		 puri_farm.setVisible(true);
            		 plot_4k_layer=puri_farm;
             		 bindecoinfowindow(plot_4k_layer,"","");
                     //bindecoinfowindow(puri_farm, ["teh_name", "plotno", "area_ac"], ["Tehsil", "Pond No", "Area"]);
            }                       	
            else {
            	$("#icon_registered_farms").hide();
                puri_farm.setVisible(false);
                $('#chkfarmpuri').prop('checked', false); 
            }
        });
        
    //govt land
   $("#chkgvtgan").change(function () {
            if (this.checked) {
            		$("#icon_govt_land").show();
            		ganjam_govt.setVisible(true);
            		 plot_4k_layer=ganjam_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(ganjam_govt,["tehname", "plotno", "khatano","kisameng","gtype","areaac"], ["Tehsil","Plot No", "Khata No", "Kissam","Land Type","Area in acre"]); 	              
            }
            else {
            	$("#icon_govt_land").hide();
                ganjam_govt.setVisible(false);
                $('#chkgvtgan').prop('checked', false); 
            }
        });
        $("#chkgvtkhu").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_govt_land").show();
            		khurda_govt.setVisible(true);
            		 plot_4k_layer=khurda_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(khurda_govt,["tehname","gpname","villname","plotno", "khatano","kisameng","gtype","areaac"], ["Tehsil","Gp","Village","Plot No", "Khata No", "Kissam","Land Type","Area in acre"]);
            }
            else {
            	$("#icon_govt_land").hide();
                khurda_govt.setVisible(false);
                $('#chkgvtkhu').prop('checked', false); 
            }
        });
        $("#chkgvtjag").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_govt_land").show();
            		jagatsingpur_govt.setVisible(true);
            		 plot_4k_layer=jagatsingpur_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(jagatsingpur_govt,["tehname","gpname","villname","plotno", "khatano","kisameng","gtype","areaac"], ["Tehsil","Gp","Village","Plot No", "Khata No", "Kissam","Land Type","Area in acre"]);
            }else {
            	$("#icon_govt_land").hide();
                jagatsingpur_govt.setVisible(false);
                $('#chkgvtjag').prop('checked', false); 
            }
        });
        $("#chkgvtken").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {
            		$("#icon_govt_land").show();
            		kendrapada_govt.setVisible(true);
            		 plot_4k_layer=kendrapada_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(kendrapada_govt,["tehname","gpname","villname","plotno", "khatano","kisameng","gtype","areaac"], ["Tehsil","Gp","Village","Plot No", "Khata No", "Kissam","Land Type","Area in acre"]);
            } else {
            	$("#icon_govt_land").hide();
                kendrapada_govt.setVisible(false);
                $('#chkgvtken').prop('checked', false); 
            }
        });
        $("#chkgvtlandbha").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_govt_land").show();
            		bhadrak_govt.setVisible(true);
            		 plot_4k_layer=bhadrak_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(bhadrak_govt,["teh_name","vill_name","plotno", "kh_no_type","kisam","area_ac"], ["Tehsil","Village","Plot No", "Khata No",  "Kissam", "Area in acre"]);
             }
            else {
            	$("#icon_govt_land").hide();
                bhadrak_govt.setVisible(false);
                $('#chkgvtlandbha').prop('checked', false); 
            }
        });
        $("#chkgvtlandbal").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {
            		$("#icon_govt_land").show();
            		baleswar_govt.setVisible(true);
            		 plot_4k_layer=baleswar_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(baleswar_govt,["teh_name","vill_name","plotno", "kh_no_type","kisam","area_ac"], ["Tehsil","Village","Plot No", "Khata No",  "Kissam", "Area in acre"]);              
            }
            else {
            	$("#icon_govt_land").hide();
                baleswar_govt.setVisible(false);
                $('#chkgvtlandbal').prop('checked', false); 
            }
        });
        $("#chkgvtpur").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            
            		$("#icon_govt_land").show();
            		puri_govt.setVisible(true);
            		 plot_4k_layer=puri_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(puri_govt,["tehname","gpname","villname","plotno", "khatano","kisameng","type","areaac"], ["Tehsil","Gp","Village","Plot No", "Khata No", "Kissam","Land Type","Area in acre"]);
            	}
            else {
            	$("#icon_govt_land").hide();
                puri_govt.setVisible(false);
                $('#chkgvtpur').prop('checked', false); 
            }
        });
        $("#chkgvtcut").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {            	
            		$("#icon_govt_land").show();
            		cuttack_govt.setVisible(true);
            		 plot_4k_layer=cuttack_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(cuttack_govt,["tehname","gpname","villname","plotno", "khatano","kisameng","gtype","areaac"], ["Tehsil","Gp","Village","Plot No", "Khata No", "Kissam","Land Type","Area in acre"]);
            }
            else {
            	$("#icon_govt_land").hide();
                cuttack_govt.setVisible(false);
                $('#chkgvtcut').prop('checked', false); 
            }
        });
        $("#chkgvtjaj").change(function () {
            map.removeOverlay(popup);
            popup.setPosition(undefined);
            if (this.checked) {

            		$("#icon_govt_land").show();
            		jajpur_govt.setVisible(true);
            		 plot_4k_layer=jajpur_govt;
             		 bindecoinfowindow(plot_4k_layer,"","");
                    //bindecoinfowindow(jajpur_govt,["tehname","gpname","villname","plotno","khatano","kisameng","gtype","areaac"], ["Tehsil","Gp","Village","Plot No", "Khata No", "Kissam","Land Type","Area in acre"]);
            	}
            else {
            	$("#icon_govt_land").hide();
                jajpur_govt.setVisible(false);
                $('#chkgvtjaj').prop('checked', false); 
            }
        });

///Basemap

    $("#terrain").click(function () {
        baselayer.setVisible(true);
        raster.setVisible(false);
        carto.setVisible(false);
        bingMap.setVisible(false);
    });
    $("#osm").click(function () {
        raster.setVisible(true);
        baselayer.setVisible(false);
        carto.setVisible(false);
        bingMap.setVisible(false);
    });
    $("#cartography").click(function () {
        carto.setVisible(true);
        baselayer.setVisible(false);
        raster.setVisible(false);
        bingMap.setVisible(false);
    });
    $("#bingmap").click(function() {
    	bingMap.setVisible(true);
		carto.setVisible(false);
		baselayer.setVisible(false);
		raster.setVisible(false);
		
	});
    /*Measurement tool Started*/
    var measurementRadios = $('[type=radio]');
    var resultElement = $('#js-result');
    var measuringTool;
    var listener;
    var enableMeasuringTool = function () {
        map.removeInteraction(measuringTool);
        var geometryType = measurementRadios.filter(':checked').val();
        var html = geometryType === 'Polygon' ? '<sup>2</sup>' : '';
        measuringTool = new ol.interaction.Draw({
            type: geometryType,
            source: vectorLayer.getSource()
        });
        measuringTool.on('drawstart', function (event) {

            vectorLayer.getSource().clear();

            listener = event.feature.on('change', function (event) {
                var geom = event.target;
                var measurement = geometryType === 'Polygon' ?
                    event.target.getGeometry().getArea() :
                    event.target.getGeometry().getLength();               
                //console.clear();
                var measurementFormatted = measurement > 100 ? (measurement / 1000).toFixed(2) + 'km' :
                    measurement.toFixed(2) + 'm';
                //console.log(measurementFormatted);
                resultElement.html(measurementFormatted + html);
            });
        });
        map.addInteraction(measuringTool);
    };
    measurementRadios.on('change', enableMeasuringTool); 
    $("#measureDiv").click(function () {
        enableMeasuringTool();
    });
    $("#legendDiv").click(function () {
        map.removeInteraction(measuringTool);
    });
    $("#baseDiv").click(function () {
        map.removeInteraction(measuringTool);
    });
    $("#layerDiv").click(function () {
        map.removeInteraction(measuringTool);
    });

    var selectSingleClick = new ol.interaction.Select();
    map.addInteraction(selectSingleClick);
    var xmlstring = "";
    function clearlayer()
    {               
                bal_pond.setVisible(false);
                bhadrk_pond.setVisible(false);
                ganjam_pond.setVisible(false);
                puri_pond.setVisible(false);
                jagatsingh_pond.setVisible(false);
                kendrapada_pond.setVisible(false);
                khurdha_pond.setVisible(false);
                bhadrak_feasible.setVisible(false);
                baleswar_feasible.setVisible(false);
                ganjam_feasible.setVisible(false);
                khurda_feasible.setVisible(false);
                kendrapada_feasible.setVisible(false);
                jagatsingpur_feasible.setVisible(false);
                puri_feasible.setVisible(false);
                jajpur_feasible.setVisible(false);
                cuttack_feasible.setVisible(false);
    }
    
    function zoomLayer(url, zoom) {
        var vectorSource = new ol.source.Vector({
            url: url,
            format: new ol.format.GeoJSON(),
            wrapX: false,
        });
        var vector = new ol.layer.Vector({
            source: vectorSource
        });
        map.addLayer(vector);
        vectorSource.once('change', function (e) {
            if (vectorSource.getState() === 'ready') {
                if (vector.getSource().getFeatures().length > 0) {
                    //console.log(vectorSource.getExtent()[0]);
                    if (vectorSource.getExtent()[0] != "Infinity") {
                        var ext = new ol.proj.transformExtent(vectorSource.getExtent(), ol.proj.get('EPSG:3857'), ol.proj.get('EPSG:4326'));
                        var center = new ol.extent.getCenter(ext);
                        map.setView(new ol.View({
                            center: ol.proj.fromLonLat([center[0], center[1]]),//zoom to the center of your feature
                            zoom: zoom //here you define the levelof zoom
                            
                        }));
                        vector.setVisible(false);
                        var format = new ol.format.KML();
                        xmlstring = format.writeFeatures(vector.getSource().getFeatures(), { featureProjection: 'EPSG:3857' });
                    }
                    else
                    {
                        alert("Data not available..")
                    }

                    //var ext =new  ol.proj.transformExtent(vectorSource.getExtent(), ol.proj.get('EPSG:4326'), ol.proj.get('EPSG:32645'));
                    // map.getView().fit(ext,map.getSize());
                }
            }
        });
    }
    function loadDoc() {
        var pom = document.createElement('a');
        var filename = "feasibleland.kml";
        var pom = document.createElement('a');
        var bb = new Blob([xmlstring], { type: 'kml/plain' });
        pom.setAttribute('href', window.URL.createObjectURL(bb));
        pom.setAttribute('download', filename);
        pom.dataset.downloadurl = ['kml/plain', pom.download, pom.href].join(':');
        pom.draggable = true;
        pom.classList.add('dragout');
        pom.click();
        window.onbeforeunload = function () {
        return 'Your kml file download complete';
        };
        
    }
    $("#btnsubmit").click(function () {
    	//loader call
    	$(document).ajaxSend(function() {
			$("#loaderdiv").show();
		}).ajaxComplete(function() {
			$("#loaderdiv").hide();
		});

        $('#tab1').removeClass('active');
        $('#tab2').addClass('active');
        $('.tab1').removeClass('active');
        $('.tab2').addClass('active');
        var c = $("#ddldist option:selected").text();
        var t = $("#ddltehesil option:selected").text();
        var gp = $("#ddlgp option:selected").text();
        var vill = $("#ddlvillage option:selected").text();
                    
        if(c=="-- Select --")  
        {
		 alert('Please select district!');
		 document.getElementById("ddldist").focus();
         return false;                    
		 }                   
                             
        else{
           	 if(t=="ALL"){
               	alert('Please select Tehsil/Block!');
                document.getElementById("ddltehesil").focus();
                return false;
            	  }
           	 else if(gp=="ALL"){
           	 	alert('Please select Gram Panchayat!');
                document.getElementById("ddlgp").focus();
                return false;
           	 }
           	 else if(vill=="ALL"){
            	 	alert('Please select Village!');
                 document.getElementById("ddlvillage").focus();
                 return false;
            	 }
           	 else{
           		$.ajax({
                    //url: "/coast/getFesLand",
                    url: "/getFesLand",
        			data: { 'dist': c, 'tehsil': $('#ddltehesil').val(), 'gp': $('#ddlgp').val(), 'village': $('#ddlvillage').val(), 'query': $('#ddllandtype').val() },
                    type: "GET",
                    success: function (data) {
                        $('#myData tbody').empty();
                        var sl = 1;                       
                        //console.log(data);
                        //alert(sl);
                        $.each(data, function (i, item1) {
                        	var khata=(item1[4]==null)?"aaaaaa":item1[4];
                        	  console.log(data);                   	
                            var rows = "<tr>" +
                                "<td>" + parseFloat(sl++) + "</td>" +
                                "<td>" + item1[0] + "</td>" +
                                "<td>" + item1[1] + "</td>" +
                                "<td>" + item1[2] + "</td>" +
                                "<td>" + item1[3] + "</td>" +
                                /* "<td>" + ((item1[4]==null)?" ":item1[4]) + "</td>" + */
                                "<td>" + item1[5] + "</td>" +
                                "<td>" + item1[6] + "</td>" +
                                "<td>" + item1[7] + "</td>" +
                                "<td>" + item1[8] + "</td>" +
                                "<td>" + item1[9] + "</td>" +
                                "<td>" + item1[10] + "</td>" +
                                "<td>" + item1[11] + "</td>" +
                                "<td class='hiddata'><div class='dropdown'><a class='dropdown-toggle' id='dropdownMenuButton' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i class='fa fa-cog'></i></a> <div class='dropdown-menu' aria-labelledby='dropdownMenuButton'><a data-toggle='tab' href='#tab1' role='tab' value=" + item1[5]+ " onclick='return MapPlot(" + item1[5] + ","+item1[7]+")' class='dropdown-item nav-link'>View in Map</a><a href='' onclick='loadDoc()' class='dropdown-item'>Download KML </a></div></div></td>" +
                                "</tr>";
                            $('.tbody').append(rows);
                        });
                        rows = '<tr><td></td><td></td><td></td><td></td><td></td><td></td><td>Total</td><td id="sum1"></td><td id="sum2"></td><td id="sum3"></td><td></td><td></td><td></td></tr>';
                        $("#myData").css("display", "table");
                        $('.tbody').append(rows);
                        tablesum();
                        var a = data.length;
                        $("#result").text(a + " Records Found");
                    },
                    error: function (errormessage) {
                        alert('server error');
                    }

    			});
          	  
           	 } 
              function tablesum() {
                  var sum1 = 0;
                  var sum2 = 0;
                  var sum3 = 0;
                  $("#myData tr").not(':first').not(':last').each(function () 
                 {
                      sum1 += parseFloat($(this).find("td:eq(7)").text());
                      sum2 += parseFloat($(this).find("td:eq(8)").text());
                      sum3 += parseFloat($(this).find("td:eq(9)").text());
                  });

                  $("#sum1").text(sum1.toFixed(3));
                  $("#sum2").text(sum2.toFixed(3));
                  $("#sum3").text(sum3.toFixed(3));
              }
           	 
           	 }           	  
        
        });
    function MapPlot(plot,gis_area) {
    	console.log(gis_area);
    	$(document).ajaxSend(function () {
            $("#loaderdiv").show();
        }).ajaxComplete(function () {
            $("#loaderdiv").hide();
        });
    	  $('.nav-link').removeClass('active');
          $('.tab1').addClass('active');
          var plotNo = plot;
          clearlayer();
          var c = $("#ddldist option:selected").text();
          if (c != '-- Select --') {
                  if ($('#ddltehesil').val() != 'ALL') {
                      if ($('#ddlgp').val() != 'ALL') {
                          if ($('#ddlvillage').val() != 'ALL') {
                          	 if ($('#txtplotno').val() != "") {
                                    plotZoomLayer(plotNo);
                                    bindecoinfowindow(plot_current_layer,'','',gis_area);
                               }else {
                                   alert('Please select PlotNo');
                               }
                          }else {
                                alert('Please select Village');
                              }
                      }else {
                             alert('Please select Gram Panchayat');
                          }
                  }else {
                         alert('Please select Tehsil');
                 }
              }else {
                  alert('Please select District');
              }
    	}
    
    $("#pdf").click(function () {
        $('.custom-hide').hide();
        var doc = new jsPDF('l', 'pt');
        var res = doc.autoTableHtmlToJson(document.getElementById("myData"));
        //doc.autoTable(res.columns, res.data, { margin: { top: 80 } });
        var header = function (data) {
            doc.setFontSize(18);
            doc.setTextColor(40);
            doc.setFontStyle('normal');
            //doc.addImage(headerImgData, 'JPEG', data.settings.margin.left, 20, 50, 50);
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
            $row.append($tds.eq(0).clone()).append($tds.eq(1).clone()).append($tds.eq(2).clone()).append($tds.eq(3).clone()).append($tds.eq(4).clone()).append($tds.eq(5).clone()).append($tds.eq(6).clone()).append($tds.eq(7).clone()).append($tds.eq(8).clone()).append($tds.eq(9).clone()).append($tds.eq(10).clone()).append($tds.eq(11).clone()).append($tds.eq(12).clone()).append($tds.eq(13).clone()).appendTo($target);
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
    })
    
    $("#btnsubmit").click(function () {
        $("#showLtl").show();
    })
    $("#showLtl").click(function (event) {
        $(this).find('i').toggleClass('fa-arrow-up');
    });
    </script>      
<script type="text/javascript">
//var dist_current_layer,tehsil_current_layer,gp_current_layer,vill_current_layer,plot_current_layer;
function distzoom() 
{
	if(dist_current_layer!=null){
        map.removeLayer(dist_current_layer);
     } if(tehsil_current_layer!=null){
            map.removeLayer(tehsil_current_layer);
     }if(gp_current_layer!=null){
        map.removeLayer(gp_current_layer);
     }
     if(vill_current_layer!=null){
        map.removeLayer(vill_current_layer);
    }
	clearlayer();
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
 	    dist_current_layer=vectorLayer;
 	    vectorLayer.getSource().addFeatures(features);
 		map.getView().fit(vectorSource.getExtent());
 	});
}
function tehzoom() {
	tehesil.setVisible(false);
	if(tehsil_current_layer!=null){
        map.removeLayer(tehsil_current_layer);
    }if(gp_current_layer!=null){
      map.removeLayer(gp_current_layer);
    }
    if(vill_current_layer!=null){
      map.removeLayer(vill_current_layer);
    }
	var vectorSource = new ol.source.Vector();
	var styles =new ol.style.Style({
        stroke : new ol.style.Stroke({
				color : 'rgb(0, 119, 158)',
				width : 3,
            //lineDash: [.1, 5] //or other combinations
           }),
           //zIndex: 2,
         fill: new ol.style.Fill({
             color: 'rgba(0, 119, 158, 0.1)',
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
	var param='dist='+$('#ddldist').val()+'&tehsil='+$('#ddltehesil').val();
	fetch('/geojson/getTehsilJson?'+param, {
  		method : 'GET',
  	}).then(function(response) {
  		return response.json();
  	}).then(function(json) {
  		var vectorLayer = new ol.layer.Vector({
	  		source : vectorSource,
            style: function() {
                      styles.getText().setText($('#ddltehesil').val());
                      return styles;
                    },
	  	});
  		var features =gjFormat.readFeatures(json.geojson);
 		map.addLayer(vectorLayer);
 		tehsil_current_layer=vectorLayer;
 	    vectorLayer.getSource().addFeatures(features);
 		map.getView().fit(vectorSource.getExtent());
  	});
	
}
function gpzoom() {
	gplayer.setVisible(false);
	if(gp_current_layer!=null){
        map.removeLayer(gp_current_layer);
    }
    if(vill_current_layer!=null){
        map.removeLayer(vill_current_layer);
    }
	var vectorSource = new ol.source.Vector();
	var styles =new ol.style.Style({
        stroke : new ol.style.Stroke({
				color : 'rgb(37, 139, 172)',
				width : 3,
            lineDash: [.9, 20] //or other combinations
           }),
           //zIndex: 2,
         fill: new ol.style.Fill({
             color: 'rgba(37, 139, 172, 0.1)',
            })
   	});
	var gjFormat =  new ol.format.GeoJSON({
        featureProjection: 'EPSG:3857',
     });
	var param='dist='+$('#ddldist').val()+'&tehsil='+$('#ddltehesil').val()+'&gp='+$('#ddlgp').val();
	fetch('/geojson/getGpJson?'+param, {
  		method : 'GET',
  	}).then(function(response) {
 		return response.json();
  	}).then(function(json) {
  		var vectorLayer = new ol.layer.Vector({
	  		source : vectorSource,
            style: styles
	  	});
  		var features =gjFormat.readFeatures(json.geojson);
 		map.addLayer(vectorLayer);
 		gp_current_layer=vectorLayer;
 	    vectorLayer.getSource().addFeatures(features);
 		map.getView().fit(vectorSource.getExtent());

  	});
}
function villzoom() {
	//alert("1")
	//villstdylayer.setVisible(false);	
	if(vill_current_layer!=null){
        map.removeLayer(vill_current_layer);
    }
  	//villstdylayer.setVisible(false);
  	var vectorSource = new ol.source.Vector();
    var styles =new ol.style.Style({
            stroke : new ol.style.Stroke({
 				color : 'rgb(64, 59, 61)',
 				width : 2,
                lineDash: [.1, 5] //or other combinations
               }),
               zIndex: 2,
             fill: new ol.style.Fill({
                 color: 'rgba(64, 59, 61, 0.1)',
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
   	var param='dist='+$('#ddldist').val()+'&tehsil='+$('#ddltehesil').val()+'&gp='+$('#ddlgp').val()+'&vill='+$('#ddlvillage').val();
   	console.log(param);
  	fetch('/geojson/getVillageJson?'+param, {
   		method : 'GET',
   	}).then(function(response) {
  		return response.json();
  	}).then(function(json) {
  		var vectorLayer = new ol.layer.Vector({
	  		source : vectorSource,
            style: function() {
                      styles.getText().setText($('#ddlvillage').val());
                      return styles;
                    },
	  	});
  		var features =gjFormat.readFeatures(json.geojson);
 		map.addLayer(vectorLayer);
 		vill_current_layer=vectorLayer;
 	    vectorLayer.getSource().addFeatures(features);
 		map.getView().fit(vectorSource.getExtent());
  	});
}

function plotZoomLayer(plotno) {
    var vectorSource = new ol.source.Vector();
    var styles =new ol.style.Style({
         stroke : new ol.style.Stroke({
  				color : 'rgb(120, 18, 30)',
  				width : 3,
                 //lineDash: [.1, 5] //or other combinations
                }),
                //zIndex: 2,
              fill: new ol.style.Fill({
                  color: 'rgba(191, 147, 152, 0.1)',
                 })
        });
    var gjFormat =  new ol.format.GeoJSON({
        featureProjection: 'EPSG:3857',
     });
    var param='dist='+$('#ddldist').val()+'&tehsil='+$('#ddltehesil').val()+'&gp='+$('#ddlgp').val()+'&vill='+$('#ddlvillage').val()+'&plotno='+plotno;
  	fetch('/geojson/getPlotInfoGeoJson?'+param, {
  		method : 'GET',
  	}).then(function(response) {
  		return response.json();
  	}).then(function(json) {
  		console.log(json);
  		var vectorLayer = new ol.layer.Vector({
	  		source : vectorSource,
            style: styles,
            updateWhileAnimating: true,
 	        updateWhileInteracting: true
	  	});
  		var features =gjFormat.readFeatures(json.geojson);
 		map.addLayer(vectorLayer);
 		plot_current_layer=vectorLayer;
 	    vectorLayer.getSource().addFeatures(features);
 		map.getView().fit(vectorSource.getExtent());
  	  });
    }
function loader_Div(){
	$(document).ajaxSend(function() {
		$("#loaderdiv").show();
	}).ajaxComplete(function() {
		$("#loaderdiv").hide();
	});
}  
function bindecoinfowindow(layer, p, n,gis_area){
	     
	     if(layer==plot_current_layer){
	    	 map.addOverlay(popup);
		     map.on('click', function (evt) 
		     {			loader_Div();
		    	 	   var info="";
		    	 	   var lonlat = new ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');
	                   var lon = lonlat[0].toFixed(6);
                       var lat = lonlat[1].toFixed(6);
	                   //console.log(lon);
	                   //console.log(lat);
	                   var khatano,plotno,policestn,landtype,Owner,Area_Acre,Area_Hect,distance_htl,crz_category,crz_category_distance;
	                   
	                   var dist=$("#ddldist option:selected").text();
	                   var tehsil=$('#ddltehesil').val();
	                   var gp=$('#ddlgp').val();
	                   var vill=$('#ddlvillage').val(); 
	                   //var plot=$('#txtplotno').val();
	               
	                   info ="<b>------------PLOT INFO-------------</b>";
	                   info=info + "<br /><b>District : </b>" + ( dist== null ? "Not Available" : dist);
	                   info=info + "<br /><b>Tehsil: </b>" + ( tehsil== null ? "Not Available" : tehsil);
	                   info=info + "<br /><b>GP: </b>" + ( gp== null ? "Not Available" : gp);
	                   info=info + "<br /><b>Village: </b>" + ( vill== null ? "Not Available" : vill);
	                   info=info + "<br /><b>GIS area(Acre): </b>" + gis_area;
	                   info=info + "<br /><b>Latitude: </b>" + ( lat== null ? "Not Available" : lat);
                       info=info + "<br /><b>Longitude: </b>" + ( lon== null ? "Not Available" : lon);
			      
	                   $.ajax({
	                       url:"https://odisha4kgeo.in/index.php/mapview/showForestRevenueinfo",
	                       data: { 'cordinates[0]': lon,'cordinates[1]': lat  },
	                       type: "POST",
	                       success: function (data) 
	                       {               
	                           var obj = JSON.parse(data);   
	                           //console.log(obj);
	                           khatano=obj.post.revenue[0].khatano;
	                           plotno=obj.post.revenue[0].plotno;
	                           policestn=obj.post.police[0].cctns_ps_n;
	                           landtype=obj.post.ror[0].LandType;
	                           Owner=obj.post.ror[0].Owner;
	                           Area_Acre=obj.post.ror[0].Area_Acre;
	                           Area_Hect=Math.round((Area_Acre/(2.471)) * 100) / 100;
	                           //status=obj.status;
	                           //console.log(status);
	                           
	                       info =info + "<br/><b>------------KYFL Info--------------</b>";
	                       //info=info + "<br/><b>GIS area (Acre): </b>" + ( Area_Acre== null ? "Not Available" : Area_Acre);
	                       info=info + "<br/><b>ROR area (Hect): </b>" + ( Area_Hect== null ? "Not Available" : Area_Hect);
	                       info=info + "<br/><b>Khata No: </b>" + ( khatano== null ? "Not Available" : khatano);
	                       info=info + "<br/><b>Plot No: </b>" + ( plotno== null ? "Not Available" : plotno);                       
	                       info=info + "<br/><b>Police Station: </b>" + ( policestn== null ? "Not Available" : policestn);
	                       info=info + "<br/><b>Landtype: </b>" + ( landtype== null ? "Not Available" : landtype);                       
	                       info=info + "<br/><b>Owner: </b>" + ( Owner== null ? "Not Available" : Owner); 
	                      // info=info + "<br/><b>Status: </b>" + ( status== null ? "Not Available" : status); 	                       
	                       popup.show(evt.coordinate, info);
	                       },
	                       error: function (errormessage) {
	                           alert(errormessage.responseText);
	                       }
	                   });
	                   $.ajax({
                       url:"https://odisha4kgeo.in/index.php/mapview/getOtherDetailsCoast",
                       data: { 'cordinates[0]': lon,'cordinates[1]': lat  },
                       type: "POST",
                       success: function (data1) 
                       {
                    	   info =info + "<br/><b>-----------CRZ INFO--------------</b>";
                           var obj = JSON.parse(data1);
                           console.log(obj);
                           distance_htl=obj.post.distance_htl[0].distance;
                           var crz_status="";
                           const hasKey =obj.post.crz_category[0].hasOwnProperty('distance');
                           if(hasKey){
                          	 crz_category_distance=obj.post.crz_category[0].distance;
                          	 crz_status="Outside CRZ";                                   	
                          	 info=info + "<br/><b>Distance from CRZ Category Boundary : </b>" + ( crz_category_distance== null ? "Not Available" : crz_category_distance+" mtrs"); 
                           }else{
                          	 crz_status="Inside CRZ";
                          	 crz_category=obj.post.crz_category[0].crz_category;
                          	 info=info + "<br/><b>CRZ Category : </b>" + ( crz_category== null ? "Not Available" : crz_category); 
                           }
                           info=info + "<br/><b>CRZ Status: </b>" + crz_status ;
                           info=info + "<br/><b>Distance From HTL : </b>" + ( distance_htl== null ? "Not Available" : distance_htl+" mtrs");
                           
                           popup.show(evt.coordinate, info);
                       },
                       error: function (errormessage) {
                           alert(errormessage.responseText);
                       }          
                   });
	     });	     
    	}    
	     else if(layer==plot_4k_layer){
     		map.addOverlay(popup);
     		map.on('click', function (evt) {
     			loader_Div();
     			var info="";
     			 var lonlat = new ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');
     			var lon = lonlat[0].toFixed(6);
                var lat = lonlat[1].toFixed(6);
                  var khatano,plotno,policestn,landtype,Owner,Area_Acre,Area_Hect,distance_htl,crz_category,crz_category_distance;
                  $.ajax({
                      url:"https://odisha4kgeo.in/index.php/mapview/showForestRevenueinfo",
                      data: { 'cordinates[0]': lon,'cordinates[1]': lat  },
                      type: "POST",
                      success: function (data) 
                      {               
                          var obj = JSON.parse(data);   
                          console.log(obj);
                          District=obj.post.revenue[0].district_name;
                          Tehsil=obj.post.revenue[0].tehsil_name;
                          Gp=obj.post.revenue[0].grampanchayat_name;                                    
                          khatano=obj.post.revenue[0].khatano;
                          plotno=obj.post.revenue[0].plotno;
                          policestn=obj.post.police[0].cctns_ps_n;
                          landtype=obj.post.ror[0].LandType;
                          Owner=obj.post.ror[0].Owner;
                          Area_Acre=obj.post.ror[0].Area_Acre;
                          Area_Hect=Math.round((Area_Acre/(2.471)) * 1000) / 1000;
                          //status=obj.status;
                          
                          info =info + "<br/><b>------------KYFL INFO--------------</b>";
                          //info=info + "<br/><b>GIS area (Acre): </b>" + ( Area_Acre== null ? "Not Available" : Area_Acre);
                          info=info + "<br/><b>District: </b>" + ( District== null ? "Not Available" : District);
                          info=info + "<br/><b>Tehsil: </b>" + ( Tehsil== null ? "Not Available" : Tehsil);
                          info=info + "<br/><b>Gram Panchayat: </b>" + ( Gp== null ? "Not Available" : Gp);
                          info=info + "<br/><b>ROR area (Hect): </b>" + ( Area_Hect== null ? "Not Available" : Area_Hect);
                          info=info + "<br/><b>Khata No: </b>" + ( khatano== null ? "Not Available" : khatano);
                          info=info + "<br/><b>Plot No: </b>" + ( plotno== null ? "Not Available" : plotno);                       
                          info=info + "<br/><b>Police Station: </b>" + ( policestn== null ? "Not Available" : policestn);
                          info=info + "<br/><b>Landtype: </b>" + ( landtype== null ? "Not Available" : landtype);                       
                          info=info + "<br/><b>Owner: </b>" + ( Owner== null ? "Not Available" : Owner); 
                          info=info + "<br /><b>Latitude: </b>" + ( lat== null ? "Not Available" : lat);
                          info=info + "<br /><b>Longitude: </b>" + ( lon== null ? "Not Available" : lon);
                          //info=info + "<br/><b>Status: </b>" + ( status== null ? "Not Available" : status); 
                      
                      popup.show(evt.coordinate, info);
                      },
                      error: function (errormessage) {
                          alert(errormessage.responseText);
                      }
                  });
                  $.ajax({
                      url:"https://odisha4kgeo.in/index.php/mapview/getOtherDetailsCoast",
                      data: { 'cordinates[0]': lon,'cordinates[1]': lat  },
                      type: "POST",
                      success: function (data1) 
                      {
                     	 info="<br/><b>-----------CRZ INFO--------------</b>";
                          var obj = JSON.parse(data1);
                          console.log(obj);
                          distance_htl=obj.post.distance_htl[0].distance;
                          var crz_status="";
                          const hasKey =obj.post.crz_category[0].hasOwnProperty('distance');
                          if(hasKey){
                         	 crz_category_distance=obj.post.crz_category[0].distance;
                         	 crz_status="Outside CRZ";                                   	
                         	 info=info + "<br/><b>Distance from CRZ Category Boundary : </b>" + ( crz_category_distance== null ? "Not Available" : crz_category_distance+" mtrs"); 
                          }else{
                         	 crz_status="Inside CRZ";
                         	 crz_category=obj.post.crz_category[0].crz_category;
                         	 info=info + "<br/><b>CRZ Category : </b>" + ( crz_category== null ? "Not Available" : crz_category); 
                          }
                          
                          info=info + "<br/><b>CRZ Status: </b>" + crz_status ;
                          info=info + "<br/><b>Distance From HTL : </b>" + ( distance_htl== null ? "Not Available" : distance_htl+" mtrs");
                          
                          //popup.show(evt.coordinate, info);
                          
                      },
                      error: function (errormessage) {
                          alert(errormessage.responseText);
                      }          
                  });
     		});
     	}
	     else{           	
             map.addOverlay(popup);
       	     map.on('click', function (evt) 
       	     {			loader_Div();
                          var prptyname;
                          var info = "";
                           for (i = 0; i < p.length; i++) 
                           {
                               if (prptyname == null)
                                   prptyname = '' + p[i] + '';
                               else
                                   prptyname = prptyname + ',' + p[i] + '';
                           }
                           var url = layer.getSource().getGetFeatureInfoUrl(
                               evt.coordinate,
                               map.getView().getResolution(),
                               map.getView().getProjection(), {
                                   'INFO_FORMAT': 'application/json',
                                   'propertyName': [prptyname]
                               }
                           );
                           fetch(url)
                           .then(function (response) { return response.json(); })
                           .then(function (data) {

                           var feature = data.features[0];
                           if (feature === undefined) {
                               popup.hide();
                           }
                           else {
                               var feature = data.features[0];
                               var props = feature.properties;
                               var info; var i;
                               for (i = 0; i < n.length; i++) 
                               {
                                   if (info == null) 
                                   {
                                       info = "<b>" + n[i] + ": </b>" + props['' + p[i] + ''];
                                       
                                   }else {
                                       if (n[i] != null && p[i] != null)
                                           /* if(p[i]===("crz_ctg"))
                                           {
                                               if(props['' + p[i] + ''] == '')
                                               {
                                                   info = info + "<br/><b>" + n[i] + ": </b>" + (props['' + p[i] + ''] == '' ?(crz_category==''?"Not Available":crz_category) : props['' + p[i] + '']);    
                                               }
                                           } */
                                           
                                           info = info + "<br /><b>" + n[i] + ": </b>" + (props['' + p[i] + ''] == null ? "Not Available" : props['' + p[i] + '']);
                                       }
                               }
                               popup.show(evt.coordinate, info);
                           }
                      });
                 });
            }
 }

</script>
        
    