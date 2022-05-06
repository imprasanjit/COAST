<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="master.jsp"%>
<link href="/css/popup.css" rel="stylesheet" />
<link href='<spring:url value="/css/popup.css"/>' rel="stylesheet" />
<link href='https://unpkg.com/ol-popup@4.0.0/src/ol-popup.css'
	rel="stylesheet" />
<link href='https://openlayers.org/en/v5.3.0/css/ol.css'
	rel="stylesheet" />
<style>
a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {
  background-color: #ddd;
  color: black;
}
.previous {
  background-color: #04AA6D;
  color: white;
}
.right{
  float: right !important;
  width: 100% !important;
}
.round {
  border-radius: 50%;
}
</style>
<div class="content-page" style="margin-top:-28px">
	<div class="content">
	    <div class="container-fluid">
	        <div class="page-title-box">
	            <div class="row align-items-center">
	                <div class="col-sm-6">
	                    <h4 class="page-title">Details</h4>
	                </div>
	                <div class="col-sm-6">
	                    <ol class="breadcrumb">
	                       <li class="breadcrumb-item active"><a href="/dashboard1">Home</a></li>
	                        <li class="breadcrumb-item active"><a href="#">Details</a></li>
	                    </ol>
	                </div>
	            </div>
	        </div>
	        
	        <div class="row">
	            <div class="col-xl-12">
	                <div class="card">
	                    <div class="card-body p-1">
	                        <!-- <h4 class="mt-0 header-title mb-4">Map</h4> -->
	                       
                            <div id="map" class="fixHeightLeft" width="100%" height="100%" style="border:0">
                                <button id="back_link" class="btn btn-sm btn-secondary btn-float-right" onclick="history.back()"><i class="fa fa-chevron-left">&nbsp;</i>Back</button>
	                            <div id="popup" class="ol-popup">
	                                <a href="#" id="popup-closer" class="ol-popup-closer"></a>
	                                <div id="popup-content"></div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!-- end card -->
	            </div>
	        </div>
	    </div>
	</div>
</div>
<link rel="stylesheet" href="https://unpkg.com/ol-popup@4.0.0/src/ol-popup.css" />
<script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
<script src="https://unpkg.com/ol-popup@4.0.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/reqwest/2.0.5/reqwest.min.js"></script>
 <script src="<spring:url value="/js/config.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //zoomlyr("plotsearch")
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
 // aqua pond

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

   // govt land

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

  // feasible land

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
        var khurda_feasible = new ol.layer.Image({
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

    //leased farms
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
 

    var map = new ol.Map({
        layers: [baselayer, carto, raster, vectorLayer, stateboundarylayer, distlayer, Fishharbour, port, Fish_land_centre, jetties, light_house, tehesil, bhadrk_pond, khurdha_pond, jagatsingh_pond, kendrapada_pond, puri_pond, ganjam_pond, bal_pond,
            bhadrak_govt, baleswar_govt, bhadrak_feasible, baleswar_feasible, ganjam_feasible, khurda_feasible, kendrapada_feasible, jagatsingpur_feasible, puri_feasible, jajpur_feasible,
            cuttack_feasible, ganjam_govt, khurda_govt, kendrapada_govt, jagatsingpur_govt, puri_govt, jajpur_govt, cuttack_govt, baleswar_farm, bhadrk_farm, ganjam_farm, puri_farm, kendrapada_farm, jagatsingh_farm, mcs],
        target: 'map',
        view: new ol.View({
            center: ol.proj.fromLonLat([85.190055, 20.886785]),
            zoom: 7,
            maxZoom: 23,
            minZoom: 5,
        })
    });

    var popup = new Popup();
    map.addOverlay(popup);
    baselayer.setVisible(true);
    raster.setVisible(false);
    carto.setVisible(false);
    vectorLayer.setVisible(false);
    port.setVisible(false);
    Fishharbour.setVisible(false);
    Fish_land_centre.setVisible(false);
    jetties.setVisible(false);
    light_house.setVisible(false);
    mcs.setVisible(false);
    stateboundarylayer.setVisible(true);
    distlayer.setVisible(true);
    tehesil.setVisible(false);
    

    bal_pond.setVisible(false);
    bhadrk_pond.setVisible(false);
    bhadrak_govt.setVisible(false);
    ganjam_pond.setVisible(false);
    puri_pond.setVisible(false);
    kendrapada_pond.setVisible(false);
    jagatsingh_pond.setVisible(false);
    khurdha_pond.setVisible(false);

    baleswar_govt.setVisible(false);
    ganjam_govt.setVisible(false);
    khurda_govt.setVisible(false);
    kendrapada_govt.setVisible(false);
    jagatsingpur_govt.setVisible(false);
    puri_govt.setVisible(false);
    jajpur_govt.setVisible(false);
    cuttack_govt.setVisible(false);

    bhadrak_feasible.setVisible(false);
    baleswar_feasible.setVisible(false);
    ganjam_feasible.setVisible(false);
    kendrapada_feasible.setVisible(false);
    jagatsingpur_feasible.setVisible(false);
    puri_feasible.setVisible(false);
    jajpur_feasible.setVisible(false);
    cuttack_feasible.setVisible(false);
    khurda_feasible.setVisible(false);

    baleswar_farm.setVisible(false);
    bhadrk_farm.setVisible(false);
    ganjam_farm.setVisible(false);
    puri_farm.setVisible(false);
    kendrapada_farm.setVisible(false);
    jagatsingh_farm.setVisible(false);    
    var exp = "";
    var distnm ='<%=session.getAttribute("dist")%>';   
  	 //alert(distnm)      
    //var muldist = distnm=='all' ? 'Nodata':distnm;
    var muldist ='<%=session.getAttribute("muldist")%>';   
    //alert(muldist)
    var clkname ='<%=session.getAttribute("clkname")%>';
   //alert(clkname)
    var distclk ='';
    var tehclk =''; 

    if (clkname == 'aqua') {
        distlayer.getSource().updateParams({ 'CQL_FILTER': "dist_name='" + '' + "'" });
        distlayer.setVisible(true);
        if (distnm == 'all') {
            exp = "distname='" + '' + "'";
        }

        else {
            exp = "distname='" + distnm + "' && tehname='" + '' + "'";
            tehesil.getSource().updateParams({ 'CQL_FILTER': "tehname='" + '' + "'" });
            tehesil.setVisible(true);
        }

        if (distclk.toLowerCase() == 'baleshwar') {
            bal_pond.getSource().updateParams({ 'CQL_FILTER': exp });
            bal_pond.setVisible(true);
            bindecoinfowindow(bal_pond, ["distname", "tehname", "pondno", "areaac"], ["District", "Tehsil", "Pond No", "Area"]);

        }
        else if (distclk.toLowerCase() == 'bhadrak') {
            bhadrk_pond.getSource().updateParams({ 'CQL_FILTER': exp });
            bhadrk_pond.setVisible(true);
            bindecoinfowindow(bhadrk_pond, ["distname", "tehname", "pondno", "areaac"], ["District", "Tehsil", "Pond No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'puri') {
            puri_pond.getSource().updateParams({ 'CQL_FILTER': exp });
            puri_pond.setVisible(true);
            bindecoinfowindow(puri_pond, ["distname", "tehname", "pondno", "areaac"], ["District", "Tehsil", "Pond No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'kendrapara') {
            kendrapada_pond.getSource().updateParams({ 'CQL_FILTER': exp });
            kendrapada_pond.setVisible(true);
            bindecoinfowindow(kendrapada_pond, ["distname", "tehname", "pondno", "areaac"], ["District", "Tehsil", "Pond No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'jagatsinghapur') {
            jagatsingh_pond.getSource().updateParams({ 'CQL_FILTER': exp });
            jagatsingh_pond.setVisible(true);
            jagatsingh_pond(bhadrk_pond, ["distname", "tehname", "pondno", "areaac"], ["District", "Tehsil", "Pond No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'khurdha') {
            khurdha_pond.getSource().updateParams({ 'CQL_FILTER': exp });
            khurdha_pond.setVisible(true);
            bindecoinfowindow(khurdha_pond, ["distname", "tehname", "pondno", "areaac"], ["District", "Tehsil", "Pond No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'ganjam') {
            ganjam_pond.getSource().updateParams({ 'CQL_FILTER': exp });
            ganjam_pond.setVisible(true);
            bindecoinfowindow(ganjam_pond, ["distname", "tehname", "pondno", "areaac"], ["District", "Tehsil", "Pond No", "Area"]);
        }

    }
    else if (clkname == 'govtlnd') {
        //var ck=ViewBag.distclk;
        distlayer.getSource().updateParams({ 'CQL_FILTER': "dist_name='" + '' + "'" });
        distlayer.setVisible(true);
        if (distnm == 'all') {
            exp = "";
        }
        else {
            exp = "teh_name='" + '' + "'";;
        }

        if (distclk.toLowerCase() == 'baleshwar') {
            if (exp) {
                baleswar_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            baleswar_govt.setVisible(true);
            bindecoinfowindow(baleswar_govt, ["teh_name", "vill_name", "plotno", "kh_no_type", "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "kissam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'bhadrak') {
            if (exp) {
                bhadrak_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            bhadrak_govt.setVisible(true);
            bindecoinfowindow(bhadrak_govt, ["teh_name", "vill_name", "plotno", "kh_no_type", "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "kissam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'puri') {
            if (exp) {
                puri_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            puri_govt.setVisible(true);
            bindecoinfowindow(puri_govt, ["tehname", "villname", "plotno", "khatano", "type" , "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "Khata Type", "kissam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'khurdha') {
            if (exp) {
                khurda_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            khurda_govt.setVisible(true);
            bindecoinfowindow(khurda_govt, ["tehname", "villname", "plotno", "khatano", "kisam", "final_sts", "areaac"], ["Tehsil", "Village", "plot No", "Khata No", "kisam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'ganjam') {
            if (exp) {
                ganjam_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            ganjam_govt.setVisible(true);
            bindecoinfowindow(ganjam_govt, ["teh_name", "vill_name", "plot_no", "kh_no_type", "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "kisam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'kendrapara') {
            if (exp) {
                kendrapada_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            kendrapada_govt.setVisible(true);
            bindecoinfowindow(kendrapada_govt, ["teh_name", "vill_name", "plot_no", "kh_no_type", "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "kisam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'cuttack') {

            if (exp) {
                cuttack_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            cuttack_govt.setVisible(true);
            bindecoinfowindow(cuttack_govt, ["teh_name", "vill_name", "plot_no", "kh_no_type", "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "kisam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'jajapur') {
            if (exp) {
                jajpur_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            jajpur_govt.setVisible(true);
            bindecoinfowindow(jajpur_govt, ["teh_name", "vill_name", "plot_no", "kh_no_type", "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "kisam", "Status", "Area"]);
        }
        else if (distclk.toLowerCase() == 'jagatsinghapur') {
            if (exp) {
                jagatsingpur_govt.getSource().updateParams({ 'CQL_FILTER': exp });
            }
            jagatsingpur_govt.setVisible(true);
            bindecoinfowindow(jagatsingpur_govt, ["teh_name", "vill_name", "plot_no", "kh_no_type", "kisam", "final_sts", "area_ac"], ["Tehsil", "Village", "plot No", "Khata No", "kisam", "Status", "Area"]);
        }
    }
    else if (clkname == 'feaslnd') {
        distlayer.getSource().updateParams({ 'CQL_FILTER': "dist_name='" + '' + "'" });
        distlayer.setVisible(true);
        if (distnm == 'all') {
            exp = "dist_name='" + '' + "'";
        }
        else {
            exp = "dist_name='" + distnm + "' && teh_name='" + '' + "'";
        }

        if (distclk.toLowerCase() == 'baleshwar') {

            baleswar_farm.getSource().updateParams({ 'CQL_FILTER': exp });
            baleswar_farm.setVisible(true);
            bindecoinfowindow(baleswar_farm, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);

        }
        else if (distclk.toLowerCase() == 'bhadrak') {

            bhadrk_farm.getSource().updateParams({ 'CQL_FILTER': exp });
            bhadrk_farm.setVisible(true);
            bindecoinfowindow(bhadrk_farm, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'ganjam') {

            ganjam_farm.getSource().updateParams({ 'CQL_FILTER': exp });
            ganjam_farm.setVisible(true);
            bindecoinfowindow(ganjam_farm, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'puri') {

            puri_farm.getSource().updateParams({ 'CQL_FILTER': exp });
            puri_farm.setVisible(true);
            bindecoinfowindow(puri_farm, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'khurdha') {

            //bhadrak_feasable.getSource().updateParams({ 'CQL_FILTER': exp });
            //bhadrak_feasable.setVisible(true);
            //bindecoinfowindow(bhadrak_feasable, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'kendrapara') {

            kendrapada_farm.getSource().updateParams({ 'CQL_FILTER': exp });
            kendrapada_farm.setVisible(true);
            bindecoinfowindow(kendrapada_farm, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'jagatsinghapur') {

            jagatsingh_farm.getSource().updateParams({ 'CQL_FILTER': exp });
            jagatsingh_farm.setVisible(true);
            bindecoinfowindow(jagatsingh_farm, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'cuttack') {

            // cuttack_feasible.getSource().updateParams({ 'CQL_FILTER': exp });
            // cuttack_feasible.setVisible(true);
            // bindecoinfowindow(cuttack_feasible, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
        else if (distclk.toLowerCase() == 'jajpur') {

            //jajpur_feasible.getSource().updateParams({ 'CQL_FILTER': exp });
            // jajpur_feasible.setVisible(true);
            // bindecoinfowindow(jajpur_feasible, ["dist_name", "teh_name", "vill_name", "plot_no", "area_ac"], ["District", "Tehsil", "Village", "plot No", "Area"]);
        }
    }
    else {
        var temp = clkname;
        if (temp == "mcs") {
            if (distnm == 'all') {
                mcs.setVisible(true);                
                bindecoinfowindow(mcs, ["name", "scheme", "dist_name", "teh_name", "gp_name", "name_of_vl"], ["MCS Name", "Scheme", "District", "Tehsil", "GP", "Village"]);
            }
            else {
            	//alert("")
                exp = "";
                var str = muldist.split(",");
                //'dist_name=' + str[i] + ' or ';
                    for (var i = 0; i < str.length; i++)
                    {
                        if (i != str.length-1)
                        {
                            exp = exp + "dist_name='" + str[i] + "' or ";
                        }
                        else
                        {
                            exp = exp + "dist_name='" + str[i] + "'";
                        }
                }
                distlayer.getSource().updateParams({ 'CQL_FILTER': exp });
                distlayer.setVisible(true);
                mcs.getSource().updateParams({ 'CQL_FILTER': exp });
                mcs.setVisible(true);
                bindecoinfowindow(mcs, ["name", "scheme", "dist_name", "teh_name", "gp_name", "name_of_vl"], ["MCS Name", "Scheme", "District", "Tehsil", "GP", "Village"]);
            }
        }
        else {
            if (distnm == 'all') {
                var temp = clkname;
                exp = "desc_='" + clkname + "'";
                distlayer.setVisible(true);
            }
            else {
                //exp = "desc='" + @ViewBag.clkname +"'&&";
                exp = "desc_='" +clkname+ "'" + " && ";
                var exp1 = "";
                var str = muldist.split(",");                
                //'dist_name=' + str[i] + ' or ';
                    for (var i = 0; i < str.length; i++)
                    {
                        if (i != str.length-1)
                        {                            
                        	exp = exp  +"district='" + str[i] + "' or desc_='" +clkname+ "' && ";
                            exp1 = exp1 + "dist_name='" + str[i] + "' or ";
                        }
                        else
                        {
                            exp = exp + "district='" + str[i] + "'";
                            exp1 = exp1 + "dist_name='" + str[i] + "'";
                        }
                	}      
                distlayer.getSource().updateParams({ 'CQL_FILTER': exp1 });             
                //console.log(exp1);
                distlayer.setVisible(true);
                zoomlyr();
                if(clkname=='PORT'){
                	port.getSource().updateParams({ 'CQL_FILTER': exp });
                    port.setVisible(true);
                    bindecoinfowindow(port, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
                }
                else if(clkname=='FISHING HARBOUR'){
                	console.log(exp);
                	Fishharbour.getSource().updateParams({ 'CQL_FILTER': exp });
                	Fishharbour.setVisible(true);                                    
                    bindecoinfowindow(Fishharbour, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
                }
                else if(clkname=='FLC'){                	
                	Fish_land_centre.getSource().updateParams({ 'CQL_FILTER': exp });                	
                    bindecoinfowindow(Fish_land_centre, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
                    Fish_land_centre.setVisible(true);
                }
                else if(clkname=='JETTIES'){
                	jetties.getSource().updateParams({ 'CQL_FILTER': exp });
                	jetties.setVisible(true);
                    bindecoinfowindow(jetties, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
                }               
                else if(clkname=='LIGHT_HOUSE'){
                	light_house.getSource().updateParams({ 'CQL_FILTER': exp });
    				light_house.setVisible(true);
                    bindecoinfowindow(light_house, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
                }
                
        		}
            }
            
            if(exp=="desc_='PORT'"){
            	 port.getSource().updateParams({ 'CQL_FILTER': exp });
                 port.setVisible(true);
                 bindecoinfowindow(port, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
            }
            else if(exp=="desc_='FISHING HARBOUR'"){
            	Fishharbour.getSource().updateParams({ 'CQL_FILTER': exp });
            	Fishharbour.setVisible(true);                              
                bindecoinfowindow(Fishharbour, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
            }
            else if(exp=="desc_='FLC'"){
            	Fish_land_centre.getSource().updateParams({ 'CQL_FILTER': exp });
            	Fish_land_centre.setVisible(true);
                //zoomlyr(port);
                bindecoinfowindow(Fish_land_centre, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
            }
            else if(exp=="desc_='JETTIES'"){
            	jetties.getSource().updateParams({ 'CQL_FILTER': exp });
            	jetties.setVisible(true);
                //zoomlyr(port);
                bindecoinfowindow(jetties, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
            }
			else if(exp=="desc_='LIGHT_HOUSE'"){
				light_house.getSource().updateParams({ 'CQL_FILTER': exp });
				light_house.setVisible(true);
               // zoomlyr(port);
                bindecoinfowindow(light_house, ["district", "fish_landi", "desc_"], ["District", "Location", "Type"]);
            }
           
        }
   

 function bindecoinfowindow(layer, p, n) {
    map.addOverlay(popup);
    map.on('click', function (evt) {
        var prptyname;
        for (i = 0; i < p.length; i++) {
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
        //reqwest({
        //    url: url,
        //    type: 'json',
        //})
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
                for (i = 0; i < n.length; i++) {

                    if (info == null) {
                        info = "<b>" + n[i] + ": </b>" + props['' + p[i] + ''];
                    }
                    else {
                        if (n[i] != null && p[i] != null)
                            info = info + "<br /><b>" + n[i] + ": </b>" + (props['' + p[i] + ''] == null ? "Not Available" : props['' + p[i] + '']);
                    }
                }
                popup.show(evt.coordinate, info);
            }
        });

    });
}
});
   /*  function back_function(){
    	
    	  var element = document.getElementById('back_link');
    	  element.setAttribute('href', document.referrer);    	  
    	  history.back();
    		return false;    		
    } */

</script>
<script>
    function zoomlyr(layer) {    	
        var urlname = 'https://mapserver.odisha4kgeo.in//geoserver/COAST/wms?service=WMS&version=1.1.0&request=GetCapabilities';
        var parser = new ol.format.WMSCapabilities();
        $.ajax({
            url: urlname,
            type: "GET",
            crossDomain: true,
            dataType: "xml",
            contentType: "application/xml",
            cache: false,
            xhrFields: {
                withCredentials: true
            },
            success: function (data) {
                var obj = parser.read(data);
                var Layers = obj.Capability.Layer.Layer;
                var extent;
                for (var i = 0, len = Layers.length; i < len; i++) {
                    var layerobj = Layers[i];
                    if (layerobj.Name == layer) {
                        extent = layerobj.BoundingBox[0].extent;
                        var ext = new ol.proj.transformExtent(extent, ol.proj.get('EPSG:3857'), ol.proj.get('EPSG:4326'));
                        var center = new ol.extent.getCenter(ext);
                        map.setView(new ol.View({
                            center: ol.proj.fromLonLat([center[0], center[1]]),
                            zoom: 9
                        }));
                        //map.getView().fit(center , map.getSize());
                        break;
                    }
                }
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
</script>
<body>
</body>
