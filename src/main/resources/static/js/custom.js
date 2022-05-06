//click pop-up function 
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
        reqwest({
            url: url,
            type: 'json',
        }).then(function (data) {

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