var recorded = false;

function recordStart() {
	if (!recorded) {
		$.ajax({
			type: "GET",
	  		url: "camera_record_start",
	  		success: function(resp) {
	  			console.log(resp);
	  			recorded = true;
	  		},
	  		error: function(errors) {
	  			console.log(errors);
	  		}
		});
	} else {
		alert("Video já foi startado.");
	}
}

function recordStop() {
	if (recorded) {
		$.ajax({
			type: "GET",
	  		url: "camera_record_stop",
	  		success: function(resp) {
	  			console.log(resp);
	  			recorded = false;
	  		},
	  		error: function(errors) {
	  			console.log(errors);
	  		}
		});
	} else {
		alert("Video não foi startado ainda.");
	}
}