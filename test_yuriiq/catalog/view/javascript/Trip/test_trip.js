$(document).ready(function() {
var trip = new Trip([
   { 
		position : 'screen-center',
		content : 'Привет, мы рады что ты нашел наш сайт. Мы учимся делать подсказки, так что извини, если что:)',
		delay : 1000
   },
   {
       sel : $('#test_item'),
	   position : 'w',
       content : 'Основное меню сайта'
   }
], {
    tripTheme : "black",
    onStart : function() {
      console.log("onStart");
    },
    onEnd : function() {
      console.log("onEnd");
    },
    onTripStop : function() {
      console.log("onTripStop");
    },
    onTripChange : function(index, tripBlock) {
      console.log("onTripChange");
    },
    backToTopWhenEnded : true,
    delay : 2000
  });

  $(".logo").click(function() {
    trip.start();
  });

  window.trip = trip;
});