// $(document).ready(function(){
// 	$('#submit_availability').on('click', function(event){
// 		var form = $(this).parent('form');
// 		// prevent the form from submitting a html request (default behaviour)
// 		event.preventDefault();
// 		$.ajax({
// 			url: "/crafts/<%= @craft.id %>",
// 			method: "POST",
// 			// serialize all input values
// 			data: form.serialize(),
// 			dataType: 'json',
// 			// successful ajax action
// 			success: function(data){
// 				console.log(data);
// 				if (data.availability == false) {
// 					console.log(data.title + "is fully booked!");
// 					$('#' + data.id).html("NOT AVAILABLE");
// 				}
// 				else {
// 					console.log(data.title + "is still available.");
// 					$('#' + data.id).html("AVAILABLE!");
// 				}
// 			},
// 			// unsuccessful ajax action
// 			error: function(data){
// 				console.log('Error here :(');
// 			},
// 		});
// 	});
// });