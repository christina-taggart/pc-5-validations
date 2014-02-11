$(document).ready(function () {
	$('#create_event').on("submit", function(e){
		e.preventDefault();
		$.ajax({
			type: 'post',
			url: '/events/create',
			data: $(this).serialize()
		}).done(function(errors){
			$('#errors').html("")
			$('#errors').append(errors)
			if (errors == "none") {
				$(location).attr('href','/')
			}
		})
	})
});
