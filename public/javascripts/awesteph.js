$(document).ready(function() {

	// Display the calendar
	$('#calendar').fullCalendar({
		editable: true,
		height: 580,
		header: {
			left: '',
			center: 'Hello',
			right: ''
		},
		//defaultView: 'agendaWeek',
		dragOpacity: "0.5",
    eventClick: function(event, jsEvent, view){
        showEventDetails(event);
    },
		eventClick: function(event) {
			// opens events in a popup window
			window.open(event.url, 'gcalevent', 'width=700,height=600');
			return false;
		},
		loading: function(bool) {
			apply_filters();
		},
		// Events
		events: "/events/get_all",
	});
		
	// Filters
	$("#university").click(function() {
		$(".university").toggle();
	});
	$("#campus").click(function() {
		$(".campus").toggle();
	});
	$("#courses").click(function() {
		$(".courses").toggle();
	});
	$("#perso").click(function() {
		$(".perso").toggle();
	});
	
	// Apply the filters
	function apply_filters(){
		$.each( ['university','campus','courses','perso'], function(i, n){
			if(!$('input:checkbox[name='+n+']').is(':checked')){
				$('.'+n).hide();
			}
		});
	}
	
	// Today
	$("#today").click(function() {
		$('#calendar').fullCalendar('today');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
		apply_filters();
	});
	
	// Next
	$("#next").click(function() {
		$('#calendar').fullCalendar('next');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
		apply_filters();
	});
	
	// Prev
	$("#prev").click(function() {
		$('#calendar').fullCalendar('prev');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
		apply_filters();
	});
	
	// Monthly
	$("#month").click(function() {
		$('#calendar').fullCalendar('changeView', 'month' );
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
		$('#month').addClass('selected_style');
		apply_filters();
	});
	
	// Weekly
	$("#agendaWeek").click(function() {
		$('#calendar').fullCalendar('changeView', 'agendaWeek' );
		$('#month').removeClass('selected');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
		apply_filters();
	});
	
	// Daily
	$("#agendaDay").click(function() {
		$('#calendar').fullCalendar('changeView', 'agendaDay' );
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
		apply_filters();
	});
		
});

