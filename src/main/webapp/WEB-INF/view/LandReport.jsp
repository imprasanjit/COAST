<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<%@ include file="master.jsp" %>
<head>
<link href="/css/popup.css" rel="stylesheet" />
<link rel="stylesheet" href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
</head>
<div class="content-page">
    <div class="container-fluid">
        <div class="page-title-box">
            <div class="row align-items-center">
                <div class="col-sm-6">
                    <h4 class="page-title">Land Report</h4>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">Report</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="min-height: 160px;">
                        <h4 class="mt-0 header-title">Government Land</h4>
                        <div class="mail-list landRptLink m-t-20">
                            
                            <a href="/report/reportView/GT"><span class="mdi mdi-arrow-right-drop-circle text-warning float-right"></span>Tehsil Wise Summary Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="min-height: 160px;">
                        <h4 class="mt-0 header-title">Feasible Land</h4>
                        <div class="mail-list landRptLink m-t-20">
                            
                            <a href="/report/reportView/FT"><span class="mdi mdi-arrow-right-drop-circle text-danger float-right"></span>Tehsil Wise Summary Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="min-height: 160px;">
                        <h4 class="mt-0 header-title">Leased Farm Land</h4>
                        <div class="mail-list landRptLink m-t-20">
                            
                            <a href="/report/reportView/LT"><span class="mdi mdi-arrow-right-drop-circle text-info float-right"></span>Tehsil Wise Summary Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="min-height: 160px;">
                        <h4 class="mt-0 header-title">Aquaculture Pond Land</h4>
                        <div class="mail-list landRptLink m-t-20">
                            <a href="/report/reportView/AQ"><span class="mdi mdi-arrow-right-drop-circle text-warning float-right"></span>Tehsil Wise Summary Details</a>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="min-height: 160px;">
                        <h4 class="mt-0 header-title">Tehsil Statics Report</h4>
                        <div class="mail-list landRptLink m-t-20">
                            <a href="/report/tehsil_summary_report"><span class="mdi mdi-arrow-right-drop-circle text-warning float-right"></span>Tehsil Statics Report</a>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="min-height: 160px;">
                        <h4 class="mt-0 header-title">Village Statics Report</h4>
                        <div class="mail-list landRptLink m-t-20">
                            <a href="/report/vill_Summary_report"><span class="mdi mdi-arrow-right-drop-circle text-warning float-right"></span>Village Statics Report</a>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>