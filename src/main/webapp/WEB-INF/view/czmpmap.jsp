<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <!--=============== basic  ===============-->
    <meta charset="UTF-8">
    <title>Coastal Aquaculture Information System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="robots" content="index, follow" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link type="text/css" rel="stylesheet" href="/asset-home/css/reset.css">
    <link type="text/css" rel="stylesheet" href="/asset-home/css/plugins.css">
    <link type="text/css" rel="stylesheet" href="/asset-home/css/style.css">
    <link type="text/css" rel="stylesheet" href="/asset-home/css/bootstrap.min.css">
    <link href="/css/popup.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
    <link rel="shortcut icon" href="images/favicon.png">
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
    </style>

</head>
<body>

    <header>
        <div class="header-inner">
            <div class="logo-holder">
                <a href="#"><img src="/images/logo-light.png" alt=""></a>
            </div>
        </div>
        <div class="show-share isShare">
            <a href="/index"><i class="fa fa-home"></i></a>
        </div>
    </header>
    <div id="map" class="mapHomeFrame" width="100%" height="100%" style="border:0">
        <div id="popup" class="ol-popup">
            <a href="#" id="popup-closer" class="ol-popup-closer"></a>
            <div id="popup-content"></div>
        </div>
    </div>
    <footer class="content-footer">
        <!--  container  -->
        <div class="container">
            <div class="row">
                <div class="col-md-3"><div class="footer-item footer-logo"><h4 class="text-link">Disclaimer</h4></div></div>
                <div class="col-md-9"><div class="footer-item"><h4 class="text-link">Links</h4></div></div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <!-- Footer logo -->
                    <div class="footer-item footer-logo">
                        <p>This is the Official Web Portal of Coastal Aquaculture Information System. The portal is developed and hosted by ORSAC. Contents in this portal is maintained by Coastal Aquaculture Information System. Any queries may be sent to Secretary, Coastal Aquaculture Information System. E-mail: fardsec.od@nic.in, Ph: 0674-2536985,Fax: 0674-2390681.</p>
                    </div>
                    <!-- Footer logo end -->
                </div>
                <!-- Footer info -->
                <div class="col-md-2">
                    <div class="footer-item">
                        <ul>
                            <li><a href="http://nfdb.gov.in/" target="_blank">NFDB <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.cifnet.nic.in/" target="_blank">CIFNET <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.nafed.india.com/" target="_blank">NAFED <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="https://www.nabard.org/" target="_blank">NABARD <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.fao.org/home/en/" target="_blank">FAO <i class="fa fa-long-arrow-right"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Footer info end-->
                <!-- Footer info -->
                <div class="col-md-2">
                    <div class="footer-item">
                        <ul>
                            <li><a href="http://mofpi.nic.in/Index1.aspx" target="_blank">Food Processing <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://cifa.nic.in/" target="_blank">CIFA <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.ciba.res.in/" target="_blank">CIBA <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="https://mpeda.gov.in/MPEDA/#" target="_blank">MPEDA <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.chilika.com/" target="_blank">CDA <i class="fa fa-long-arrow-right"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Footer info end-->
                <!-- Footer info -->
                <div class="col-md-2">
                    <div class="footer-item">
                        <ul>
                            <li><a href="http://fishcopfed.com/" target="_blank">FISCOPFED <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.cife.edu.in/cifemod2/index.php" target="_blank">CIFE <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.cmfri.org.in/" target="_blank">CMFRI <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.ifsi.in/cifri/cifri.htm" target="_blank">CIFRI <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.nbfgr.res.in/" target="_blank">NBFGR <i class="fa fa-long-arrow-right"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Footer info end-->
                <!-- Footer info -->
                <div class="col-md-2">
                    <div class="footer-item">
                        <ul>
                            <li><a href="http://www.cift.res.in/" target="_blank">CIFT <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.caa.gov.in/" target="_blank">CAA <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://dahd.nic.in/dahd/default.aspx" target="_blank">DAHD <i class="fa fa-long-arrow-right"></i></a></li>
                            <li><a href="http://www.icar.org.in/" target="_blank">ICAR <i class="fa fa-long-arrow-right"></i></a></li>
                        </ul>
                    </div>
                </div>
                <!-- Footer info end-->
            </div>
            <!-- Footer copyright -->
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <div class="footer-wrap">
                        <span class="copyright">
                            Developed by <a href="http://sparcindia.com/" target="_blank">SPARC (P) Ltd.</a> Under Ageis of <a href="http://www.orsac.gov.in/" target="_blank">ORSAC</a>
                        </span>
                        <span class="to-top">To Top</span>
                    </div>
                </div>
            </div>
            <!-- Footer copyright end -->
        </div>
        <!--  container  end -->
        <!-- Hover animation  -->
        <canvas class="particular" width="1349" height="657" style="display: none;"></canvas>
        <!-- Hover animation  end -->
    </footer>


    <script src="https://openlayers.org/en/v4.6.5/build/ol-debug.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.4.3/proj4.js"></script>
    <script src="https://unpkg.com/ol-popup@4.0.0"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/reqwest/2.0.5/reqwest.min.js"></script>
    <script src="https://epsg.io/4326.js"></script>
    <script src="https://epsg.io/32645.js"></script>
    <script src="<spring:url value="/js/config.js"/>"></script>
    
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
        var osm25kgrid = new ol.layer.Image({
            source: new ol.source.ImageWMS({
                url: baseURLWMS,
                params: {
                    'LAYERS': 'COAST:OSM_25K_Grid',
                    'VERSION': '1.1.0',
                    'TILED': false
                },
                serverType: 'geoserver',
                transition: 0

            })
        });
        var vectorSource = new ol.source.Vector();
        var vector = new ol.layer.Vector({
            source: vectorSource,
            style: new ol.style.Style({
                stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 255, 1.0)',
                    width: 2
                })
            })
        });
        var map = new ol.Map({
            layers: [baselayer, carto, raster, vectorLayer, stateboundarylayer, osm25kgrid, vector],
            controls: ol.control.defaults().extend([
                new ol.control.ScaleLine({
                    units: 'metric'
                }),
            ]),
            target: 'map',
            view: new ol.View({
                center: ol.proj.fromLonLat([85.190055, 20.886785]),
                zoom: 8,
                maxZoom: 23,
                minZoom: 5,
            })
        });
        
        var popup = new Popup();
        map.addOverlay(popup);
        carto.setVisible(false);
        raster.setVisible(false);
        vectorLayer.setVisible(false);
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
                fetch(url)
                    .then(function (response) { return response.json(); }).then(function (data) {

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
                                var id = props['' + p[i] + ''];
                                info = info + '<br><strong>pdf &nbsp; </strong><a href="" onclick="test(' +id+')"><i class="fa fa-2x fa-file-pdf-o text-danger"></i></a></br>'
                            }


                        }
                        popup.show(evt.coordinate, info);
                    }
                });

            });
        }
        bindecoinfowindow(osm25kgrid, ["state_name", "map"], ["State", "Map No."])
        function test(mapid) { 
            var url = '/pdf/geopdf/' +'CZMP 2019 Map No-'+ mapid + ".pdf";
            window.open(url, '_blank');
            //window.open('@Url.Action("~/wwwroot/geopdf/")' + mapid+".pdf", "_new", "resizeable,scrollbar");

    }
    </script>
</body>
</html>