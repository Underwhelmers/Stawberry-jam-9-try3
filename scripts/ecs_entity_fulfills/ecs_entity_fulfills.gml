function ecs_entity_fulfills(entity, components) {
    for (var i = 0; i < array_length(components); i++) {
        var compo = components[i];
		
		if (string_char_at(compo,0) == "!") {
			compo = string_copy(compo,2,string_length(compo)-1);
			if (struct_exists(entity, compo)) {
	            return false;
	        }
		} else if (!struct_exists(entity, compo)) {
            return false;
        }
    }
    return true;
}