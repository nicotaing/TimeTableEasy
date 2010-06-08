$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	

	$('#calendar').fullCalendar({
		// US Holidays
		events: $.fullCalendar.gcalFeed('http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic'),

		eventClick: function(event) {
			// opens events in a popup window
			window.open(event.url, 'gcalevent', 'width=700,height=600');
			return false;
		},

		loading: function(bool) {
			if (bool) {
				$('#loading').show();
			}else{
				$('#loading').hide();
			}
		},
		editable: true,
		height: 580,
		header: {
			left: '',
			center: 'Hello',
			right: ''
		},
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1),
					className: 'university'
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2),
					className: 'campus'
				},
				{
					id: 999,
					title: 'EVAL Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false,
					className: 'courses_eval'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false,
					className: 'perso'
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false,
					className: 'perso'
				},
				{
					title: 'Fabien Birthday',
					start: new Date(2010, 12, 5, 12, 0),
					end: new Date(2010, 12, 5, 14, 0),
					allDay: true,
					className: 'campus'
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false,
					className: 'university'
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/',
					className: 'university'
				}
			]

	});
	$("#today").click(function() {
		$('#calendar').fullCalendar('today');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
	});
	$("#next").click(function() {
		$('#calendar').fullCalendar('next');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
	});
	$("#prev").click(function() {
		$('#calendar').fullCalendar('prev');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
	});
	$("#month").click(function() {
		$('#calendar').fullCalendar('changeView', 'month' );
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
		$('#month').addClass('selected_style');
	});
	$("#agendaWeek").click(function() {
		$('#calendar').fullCalendar('changeView', 'agendaWeek' );
		$('#month').removeClass('selected');
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
	});
	$("#agendaDay").click(function() {
		$('#calendar').fullCalendar('changeView', 'agendaDay' );
		var view = $('#calendar').fullCalendar('getView');
		document.all.CalendarTitle.innerHTML = view.title;
	});
});
