for (var i = 0; i < array_length(obj_run.party.members); i++) {
	instance_create_depth(x-(i+1) * 96,y,depth,obj_caravan_integrant, {
		image_index: 1
	})
}