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
		
	/* 
	*	 Create a Class Event
	*
	*/
	$('#event_modality_id').attr('disabled','disabled');
	// when choose a campus
	$("#event_campus_id").click(function() {
		// get cursus
		$.getJSON('/cursus.js', function(data) {
			var options = '';
			$.each(data, function(i,item){
				options += '<option value="'+ item.cursus.id +'" >'+ item.cursus.name +'</option>';
			});
			$("#event_cursus").html(options);
		});
		// active the cursuses
		$('#event_cursus').attr('disabled',''); 
	});
	
	// when choose a cursus
	$("#event_cursus").click(function() {
		
		var campus_id = $("#event_campus_id").val();
		
		// get classes
		$.getJSON('/classes.js?campus_id='+campus_id, function(data) {
			var options = '';
			$.each(data, function(i,item){
				options += '<option value="'+ item.classe.id +'" >'+ item.classe.name +'</option>';
			});
			$("#event_class").html(options);
		});
		// active the classes
		$('#event_class').attr('disabled',''); 
	});
	
	// when choose a class
	$("#event_class").click(function() {
		var class_id = $("#event_class").val();
		// get courses
		$.getJSON('/courses.js?classe_id='+class_id, function(data) {
			var options = '';
			$.each(data, function(i,item){
				options += '<option value="'+ item.course.id +'" >'+ item.course.name +'</option>';
			});
			$('#event_course').html(options);
		});
		// active the subjects
		$('#event_course').attr('disabled',''); 
	});
	
	// when choose a subject
	$("#event_class").click(function() {
		// active the subjects
		$('#event_modality_id').attr('disabled',''); 
		$('#event_starttime_1i').attr('disabled',''); 
		$('#event_starttime_2i').attr('disabled','');
		$('#event_starttime_3i').attr('disabled','');
		$('#event_starttime_4i').attr('disabled','');
		$('#event_starttime_5i').attr('disabled','');
		$('#event_lasts').attr('disabled','');
	});
		
	/*
	* MANAGE CURSUS
	*/
	// Add course
	$("#add_course_cursus_id").click(function() {
		// get study periods
		var cursus_id = $("#add_course_cursus_id").val();
		$.getJSON('/study_periods.js?cursus_id='+cursus_id, function(data) {
			var options = '';
			$.each(data, function(i,item){
				options += '<option value="'+ item.study_period.id +'" >'+ item.study_period.name +'</option>';
			});			
			if (options == ''){
				options = '<option disabled>No Study Period</option>';
				$('#add_course_study_period_id').html(options);
				$('#add_course_study_period_id').attr('disabled','disabled');
			}else{
				$('#add_course_study_period_id').html(options);
				$('#add_course_study_period_id').attr('disabled',''); 
			}
		});
	});
	
	/*
	* MANAGE Campus
	*/
	// Add class
	// when choose a cursus
	$("#add_classe_cursus_id").click(function() {
		// get study periods
		var campus_id = $("#classe_campus_id").val();
		var cursus_id = $("#add_classe_cursus_id").val();
		
		$.getJSON('/study_periods.js?cursus_id='+cursus_id, function(data) {
			var options = '';
			$.each(data, function(i,item){
				options += '<option value="'+ item.study_period.id +'" >'+ item.study_period.name +'</option>';
			});			
			if (options == ''){
				options = '<option disabled>No Study Period</option>';
				$('#add_classe_study_period_id').html(options);
				$('#add_classe_study_period_id').attr('disabled','disabled');
			}else{
				$('#add_classe_study_period_id').html(options);
				$('#add_classe_study_period_id').attr('disabled',''); 
			}
		});
	});
	// when choose a study period
	$("#add_classe_study_period_id").click(function() {
		// active the subjects
		$('#classe_name').attr('disabled',''); 
		$('#add_classe_submit').attr('disabled',''); 
	});
	
});
















