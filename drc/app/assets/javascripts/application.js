// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-modal
//= require bootstrap-button
//= require bootstrap-dropdown
//= require jquery-ui
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-pt-BR
//= require_tree .


function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".tablesorter").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    // $(link).parent().before(content.replace(regexp, new_id));
    $(link).before(content.replace(regexp, new_id));
}

$(document).ready(function(){




    $("#client").autocomplete({
        source: function( request, response ) {
            $.ajax({
                url: "/clients/search_clients",
                dataType: "json",
                data: {term: request.term},
                success: function(data) {
                    response($.map(data, function(item) {
                        return {
                            label: item.name,
                            id: item.id
                        };
                    }));
                }
            });
        },
        minLength: 1,
        select: function(event, ui) {
            $('#order_client_id').val(ui.item.id);
            $("#client").val(ui.item.name);
        }

    });
    $("#product").autocomplete({
        source: function( request, response ) {
            $.ajax({
                url: "/products/search_products",
                dataType: "json",
                data: {term: request.term},
                success: function(data) {
                    response($.map(data, function(item) {
                        return {
                            label: item.name,
                            id: item.id
                        };
                    }));
                }
            });
        },
        minLength: 1,
        select: function(event, ui) {
            $('#order_item_product_id').val(ui.item.id);
            $("#product").val(ui.item.code +" - "+ui.item.name);
        }

    });
    $(".datepicker").datepicker();

});