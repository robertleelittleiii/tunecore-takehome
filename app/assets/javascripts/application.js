// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .




$(document).ready(function () {

    bindSearchForm();

});

function updateResultsDiv(data) {
    $("div#results-space").html(data);
    bindPaginationClick();
    bindSort();
    $("div.pagination a").button();
    $("a#sort_button.sort-asc").button({
        icon: "ui-icon-triangle-1-n",
        iconPosition: "end"})
    $("a#sort_button.sort-desc").button({
        icon: "ui-icon-triangle-1-s",
        iconPosition: "end"})
}

function bindSort() {
    $('a#sort_button').bind("ajax:beforeSend", function (evt) {

        console.log("ajax:before");
        console.log(evt);

    }).bind("ajax:success", function (evt) {
        console.log("ajax:succes");
        console.log(evt.detail[2].response);
        updateResultsDiv(evt.detail[2].response);

    }).bind('ajax:complete', function (evt) {
        console.log("ajax:complete");
        console.log(evt);

    }).bind("ajax:error", function (evt) {
        console.log("ajax:error");

    });
}
function bindSearchForm() {

    $('form#search-form').bind("ajax:beforeSend", function (evt) {

        console.log("ajax:before");
        console.log(evt);

    }).bind("ajax:success", function (evt) {
        console.log("ajax:succes");
        console.log(evt.detail[2].response);
        updateResultsDiv(evt.detail[2].response);



    }).bind('ajax:complete', function (evt) {
        console.log("ajax:complete");
        console.log(evt);
    }).bind("ajax:error", function (evt) {
        console.log("ajax:error");
    });

}


function bindPaginationClick()
{
    $("div.pagination a").on("click", function (evt) {

        evt.preventDefault();

        $.ajax({
            type: 'GET',
            url: this.href,
            dataType: 'html',
            success: function (data)
            {
                updateResultsDiv(data)
            },
            error: function (e)
            {
                alert(e.message);
            }
        });

    })


}