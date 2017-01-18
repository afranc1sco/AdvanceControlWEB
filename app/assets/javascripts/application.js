// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/extras/dataTables.responsive
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require bootstrap-datepicker
//= require jquery.remotipart
//= require select2-full
//= require_tree .

$(function(){
  $("#cp_search input").keyup(function(){
    $.get($("#cp_search").attr("action"), $("#cp_search").serialize(), null, "script");
    return false;
  });

  $("#clientes_captados_search").submit(function(){
    $.get(this.action,$(this).serialize(), null, "script");
    return false;
  });

  $("#ventas_search").submit(function(){
    $.get(this.action,$(this).serialize(), null, "script");
    return false;
  });

});

$(document).ready(function() {

  $(".js-example-basic-single").select2();
  $(".dropdown1").select2();




  });



  /*
  $(document).ready(function() {
    $(".js-example-basic-single").select2(
      setVal: function (val) {
        if (this.select) {
            this.select.val(val);
        } else {

            //filter out duplicates
            var distinct = [];
            var unique = {};
            for (var i in val) {

                if (typeof (unique[val[i]]) == "undefined") {
                    distinct.push(val[i]);
                }
                unique[val[i]] = 0;
            }

            this.opts.element.val(distinct.length === 0 ? "" : distinct.join(this.opts.separator));
        }
    });



    });
*/
