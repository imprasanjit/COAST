$(document).ready(function() {
    $("#datatable").DataTable(), $("#datatable-buttons").DataTable({
        lengthChange: !1,
        // buttons: ["copy", "excel", "pdf", "colvis"]
        buttons: ["excel", "pdf", "print"]
    }).buttons().container().appendTo("#datatable-buttons_wrapper .col-md-6:eq(0)")

});

$(document).ready(function() {
    $("#datatable-buttons-2").DataTable({
        lengthChange: !1,
        buttons: ["excel", "pdf", "print"]
    }).buttons().container().appendTo("#datatable-buttons-2_wrapper .col-md-6:eq(0)")
});

$(document).ready(function() {
    $("#datatable-buttons-3").DataTable({
        lengthChange: !1,
        buttons: ["excel", "pdf", "print"]
    }).buttons().container().appendTo("#datatable-buttons-3_wrapper .col-md-6:eq(0)")
});

$(document).ready(function () {
    $("#datatable-buttons-4").DataTable({
        lengthChange: !1,
        buttons: ["excel", "pdf", "print"]
    }).buttons().container().appendTo("#datatable-buttons-4_wrapper .col-md-6:eq(0)")
});

