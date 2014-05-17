// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.autocomplete
//= require angular
//= require ngTextcomplete
//= require angucomplete
//= require ./client/app
//= require_tree ./client/
//= require turbolinks
//=# require_tree .

$(function() {

    $('.role h2').click(function () {
      $('.role_add').slideToggle();
      $('.fa-plus-circle').toggleClass("fa-chevron-circle-up");
    });

    $( "#playsauto" ).autocomplete({
        source: "/plays/json",
        minLength: 3
    });

    $( "#rolesauto" ).autocomplete({
        source: "/roles/json",
        minLength: 3,
        select: function( event, ui ) {
          var selected = ui.item.value;
          console.log(selected);
          $("#rolesauto").val('selected');
          $.get( "/roles/full_json?term=" + selected )
            .done(function( data ) {
              play_id = data[0].play_id;
              console.log(play_id);
              $.get( "/plays/full_json?term=" + play_id )
                .done(function( data ) {
                  play_title = data[0].title;
                  console.log(play_title);
                  $("#playsauto").val(play_title);
                });
            });
        }
    });

    // $( "#rolesauto" ).autocomplete({
    //   minLength: 3,
    //   source: "/roles/json",
    //   focus: function( event, ui ) {
    //     $( "#rolesauto" ).val( ui.item.character_name );
    //     return false;
    //   },
      // select: function( event, ui ) {
      //   $( "#rolesauto" ).val( ui.item.character_name );
      //   $( "#rolesauto-id" ).val( ui.item.id );
      //   return false;
      // }
    // })
    // .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    //   return $( "<li>" )
    //     .append( "<a>" + item.character_name + "<br>" + item.play_id + "</a>" )
    //     .appendTo( ul );
    // };


    $( "#theatresauto" ).autocomplete({
        source: "/theatres/json",
        minLength: 3,
        select: function( event, ui ) {
          var selected = ui.item.value;
          console.log(selected);
          $.get( "/theatres/full_json?term=" + selected )
            .done(function( data ) {
              theatre_city = data[0].city;
              console.log(theatre_city);
              $('#citiesauto').val(theatre_city)
            });
        }
    });

});
