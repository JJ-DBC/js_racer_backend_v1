// refactored player() to player(number,key) 

// next step : refactor so takes number of players
//             and length of track
//             modify the html tr and tds

// p = 80
// q = 81

function player(number){
  // console.log('you pressed ', );
  var activeEl = $("tr#player"+number+"_strip td.active");
  activeEl.removeClass('active');
  activeEl.next().addClass('active')

  var track = $("tr#player"+number+"_strip td");

  if (track.last().hasClass('active')){
   $('body').append("<p>Player "+number+" Wins</p>")
   $(document).unbind("keyup");
   $("p#"+number).addClass("winner");
   // var serializedData = $("p#"+number).serialize();
   // ajax post to same url
   var pathname = window.location.pathname;
   console.log(pathname);
   // gets winner name as string
   var winnerName = $("p#"+number).text();
   // console.log($("p#"+number).text());

   $.post(pathname, { winner: winnerName}, function(response){
    console.log(response)
    $('html').html(response);
   });
   // window.location.href="/gameover"

  // $.ajax({
  //   type: "POST",
  //   url: pathname,
  //   data: '{"winner":"' + winnerName + '"}',
  //   contentType: "application/json; charset=utf-8",
  //   dataType: "json",
  //   success: function(data) {
  //       alert(data.d);
  //   },
  //   error: function(data){
  //       alert("fail");
  //   }
  // });

  };
};


function racer(){
  $(document).keyup(function(e){
    e.preventDefault();

    
    var c= String.fromCharCode(event.keyCode);
    var isWordcharacter = c.match(/\w/);
    console.log(isWordcharacter[0]);

    // loop through number of players and call method for each

    if (isWordcharacter[0] == 'P'){
      player(1);
    };

    if (isWordcharacter[0] == 'Q'){
      player(2);
    };
  });

}


$(document).ready(function () {
  racer();
});

