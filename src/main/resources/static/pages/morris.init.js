!function(e) {
    "use strict";
    var a=function() {}
    ;
    a.prototype.createLineChart=function(e, a, r, t, i, o) {
        Morris.Line( {
            element: e, data: a, xkey: r, ykeys: t, labels: i, hideHover: "auto", gridLineColor: "#eef0f2", resize: !0, lineColors: o, lineWidth: 2
        }
        )
    }
    ,
    a.prototype.createBarChart=function(e, a, r, t, i, o) {
        Morris.Bar( {
            element: e, data: a, xkey: r, ykeys: t, labels: i, gridLineColor: "#eef0f2", barSizeRatio: .4, resize: !0, hideHover: "auto", barColors: o
        }
        )
    }
    ,
    a.prototype.createAreaChart=function(e, a, r, t, i, o, c, y) {
        Morris.Area( {
            element: e, pointSize: 0, lineWidth: 0, data: t, xkey: i, ykeys: o, labels: c, resize: !0, gridLineColor: "#eee", hideHover: "auto", lineColors: y, fillOpacity: .6, behaveLikeLine: !0
        }
        )
    }
    ,
    a.prototype.createDonutChart=function(e, a, r) {
        Morris.Donut( {
            element: e, data: a, resize: !0, colors: r
        }
        )
    }
    ,
    a.prototype.createStackedChart=function(e, a, r, t, i, o) {
        Morris.Bar( {
            element: e, data: a, xkey: r, ykeys: t, stacked: !0, labels: i, hideHover: "auto", barSizeRatio: .4, resize: !0, gridLineColor: "#eeeeee", barColors: o
        }
        )
    }
    ,
    a.prototype.init=function() {
        // this.createLineChart("morris-line-example", [ {
        //     y: "2012", a: 50, b: 80, c: 20
        // }
        // , {
        //     y: "2013", a: 130, b: 100, c: 80
        // }
        // , {
        //     y: "2014", a: 80, b: 60, c: 70
        // }
        // , {
        //     y: "2015", a: 70, b: 200, c: 140
        // }
        // , {
        //     y: "2016", a: 180, b: 140, c: 150
        // }
        // , {
        //     y: "2017", a: 105, b: 100, c: 80
        // }
        // , {
        //     y: "2018", a: 250, b: 150, c: 200
        // }
        // ], "y", ["a", "b", "c"], ["Activated", "Pending", "Deactivated"], ["#ccc", "#3c4ccf", "#02a499"]);
        this.createBarChart("morris-bar-example", [ {
            y: "Khurda", a: 40, b: 35
        }
        , {
            y: "Ganjam", a: 30, b: 45
        }
        , {
            y: "Balasore", a: 75, b: 55
        }
        , {
            y: "Puri", a: 100, b: 60
        }
        , {
            y: "Cuttack", a: 65, b: 40
        }
        , {
            y: "Bhadrak", a: 25, b: 25
        }
        ], "y", ["a", "b"], ["Numbers", "Hectare"], ["#62add4", "#f0c21e"]);
        this.createBarChart("morris-bar-example2", [ {
            y: "Khurda", a: 100, b: 90
        }
        , {
            y: "Ganjam", a: 75, b: 65
        }
        , {
            y: "Balasore", a: 50, b: 40
        }
        , {
            y: "Puri", a: 50, b: 40
        }
        , {
            y: "Cuttack", a: 75, b: 65
        }
        , {
            y: "Bhadrak", a: 100, b: 90
        }
        ], "y", ["a", "b"], ["Village", "Hectare Area"], ["#fd9d76", "#02a499"]);
        // this.createAreaChart("morris-area-example", 0, 0, [ {
        //     y: "2012", a: 0, b: 0, c: 0
        // }
        // , {
        //     y: "2013", a: 150, b: 45, c: 15
        // }
        // , {
        //     y: "2014", a: 60, b: 150, c: 195
        // }
        // , {
        //     y: "2015", a: 180, b: 36, c: 21
        // }
        // , {
        //     y: "2016", a: 90, b: 60, c: 360
        // }
        // , {
        //     y: "2017", a: 75, b: 240, c: 120
        // }
        // , {
        //     y: "2018", a: 30, b: 30, c: 30
        // }
        // ], "y", ["a", "b", "c"], ["Series A", "Series B", "Series C"], ["#ccc", "#3c4ccf", "#02a499"]);
        // this.createDonutChart("morris-donut-example", [ {
        //     label: "Download Sales", value: 12
        // }
        // , {
        //     label: "In-Store Sales", value: 30
        // }
        // , {
        //     label: "Mail-Order Sales", value: 20
        // }
        // ], ["#f0f1f4", "#3c4ccf", "#02a499"]);
        this.createStackedChart("morris-bar-stacked", [ {
            y: "Khurda", a: 45
        }
        , {
            y: "Ganjam", a: 75
        }
        , {
            y: "Balasore", a: 100
        }
        , {
            y: "Puri", a: 100
        }
        , {
            y: "Cuttack", a: 75
        }
        , {
            y: "Bhadrak", a: 50
        }
        ], "y", ["a"], ["Area in Hectare"], ["#3c4ccf"])
    }
    ,
    e.MorrisCharts=new a,
    e.MorrisCharts.Constructor=a
}

(window.jQuery),
function(e) {
    "use strict";
    window.jQuery.MorrisCharts.init()
}

();