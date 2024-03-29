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
//= require jQuery.succinct.min
//= require angular
//= require angucomplete.js
//= require select2
//= require ./client/app
//= require_tree ./client/
//= require turbolinks
//= require_tree .

$(function() {

    $('.landing.actor').click(function () {
      $('.landing').hide();
      $('.actor_intro').slideDown('slow');
    });

    $('.landing.theatre').click(function () {
      $('.landing').hide();
      $('.theatre_intro').slideDown('slow');
    });

    $('.theatre_intro i.fa-times-circle').click(function () {
      $('.theatre_intro').hide();
      $('.landing').fadeIn();
    });

    $('.actor_intro i.fa-times-circle').click(function () {
      $('.actor_intro').hide();
      $('.landing').fadeIn();
    });

    $('span.text').succinct({
      size: 150
    });

    $('select#gender').select2({
      placeholder: "Men and Women",
      allowClear: true,
      width: "197px",
      minimumResultsForSearch: -1
    });

    $('select#equity').select2({
      placeholder: "Any equity status",
      allowClear: true,
      width: "197px",
      minimumResultsForSearch: -1
    });

    $('select#age_range').select2({
      placeholder: "All ages",
      allowClear: true,
      width: "197px",
      minimumResultsForSearch: -1
    });

    $('select#ethnic_appearance').select2({
      placeholder: "All looks",
      allowClear: true,
      width: "197px",
      minimumResultsForSearch: -1
    });

    $('.table_search i.fa-plus-circle').click(function () {
      console.log("poop");
      meep = $(this).parent();
      derp = meep.parent();
      slurp = derp.next();
      leep = slurp.next().next().next();
      console.log(leep);
      leep.fadeIn('slow');
    });

    $('select#callsheet_role_name').select2({
      placeholder: "Any role",
      allowClear: true,
      width: "100%",
      minimumResultsForSearch: -1
    });

    $('select#callsheet_status').select2({
      placeholder: "Status",
      allowClear: true,
      width: "100%",
      minimumResultsForSearch: -1
    });

    $('.role h2').click(function () {
      $('.role_add').slideToggle();
      $('.fa-plus-circle').toggleClass("fa-chevron-circle-up");
    });

    $('span.text').succinct({
      size: 150
    });

    //ROLE-FILTER-SEARCH BAM
    if ($("input#search").length) {
      $("input#search").autocomplete({
        source: "/roles/json_search",
        minLength: 3,
      })
      .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
        value = item.value
        console.log(value);
        // play = $.get( "/roles/full_json?term=" + name ).done(function( data ) { return data; });
        // console.log(play);
        return $( "<li>" )
        .append( "<a>" + item.label + "<br><span class='role_show'>" + item.show + "</span></a>" )
        .appendTo( ul );
      };
    };


  //   $( "#playsauto" ).autocomplete({
  //       source: "/plays/json",
  //       minLength: 3
  //   });


    // $( "#rolesauto" ).keypress(function () {
    //   first_auto = $("#ui-id-2 li a").first().html()
    //   if(first_auto != undefined) {
    //     // console.log(first_auto);
    //     $("#ui-id-2 a").each(function () {
    //       returned = $(this).text();
    //       $.get( "/roles/full_json?term=" + returned )
    //         .done(function( data ) {
    //           play_id = data[0].play_id;
    //           $.get( "/plays/full_json?term=" + play_id )
    //             .done(function( data ) {
    //               play_title = data[0].title;
    //               console.log(returned);
    //               console.log(play_title);

    //               // $(this).html().append("<span>" play_title "</span>");
    //             });
    //         });
    //     });
    //   }
    // });

    // var find_play = function( role ) {
    //   console.log(role);
    //   $.get( "/roles/full_json?term=" + role )
    //     .done(function( data ) {
    //       return data;
    //       $play_number = data[0].play_id;
    //       // return $play_number;
    //       $.get( "/plays/full_json?term=" + play_number )
    //         .done(function( data ) {
    //           var play_name = data[0].title;
    //           // return play_name;
    //       });
    //     });
    //   };

    // find_play("elphaba");

    // function find_play(role) {
    //     $.get("/roles/full_json?term=" + role, function( data ) {
    //       console.log(data);
    //     });
    //   };
    //   // var find_play = function( role ) {
    //     // return role;
    //     // return data;
    //   // };

    // var elphaba = find_play("elphaba");
    // return elphaba;

//ROLE SEARCH STUFF YEAH ***************
if ($("#rolesauto").length) {
    $( "#rolesauto" ).autocomplete({
        source: "/roles/json_search",
        minLength: 3,
        select: function( event, ui ) {
          var selected = ui.item.value;
          console.log(selected);
          // $("#rolesauto").val('selected');
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
    })
    .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
      name = item.value;
      console.log(name);
      // play = $.get( "/roles/full_json?term=" + name ).done(function( data ) { return data; });
      // console.log(play);
      return $( "<li>" )
        .append( "<a>" + item.label + "<br><span class='role_show'>" + item.show + "</span></a>" )
        .appendTo( ul );
    };
  };

    $( "#theatresauto" ).autocomplete({
        source: "/theatres/json",
        minLength: 1,
        select: function( event, ui ) {
          var selected = ui.item.value;
          console.log(selected);
          $.get( "/theatres/full_json?term=" + selected )
            .done(function( data ) {
              theatre_city = data[0].city;
              console.log(theatre_city);
              $('#citiesauto').val(theatre_city);
            });
        }
    });

    $("button.type").click(function() {
      $(".search1").slideDown();
      $(".search2").hide();
      $(this).addClass("active");
      $("button.role").removeClass("active");
    });

    $("button.role").click(function() {
      $(".search2").slideDown();
      $(".search1").hide();
      $(this).addClass("active");
      $("button.type").removeClass("active");
    });
});
