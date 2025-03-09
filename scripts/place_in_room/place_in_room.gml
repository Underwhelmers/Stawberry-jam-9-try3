function place_in_room(location, entities) {
	var compo = Components.types.position;
	for (var i = 0, count = array_length(entities); i < count; i++) {
		compo.add_to(entities[i], location);
	}
}