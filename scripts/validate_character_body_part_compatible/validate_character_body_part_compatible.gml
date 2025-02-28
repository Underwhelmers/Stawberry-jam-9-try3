function validate_character_body_part_compatible(_values) {
	var _character = _values[0];
	var _body_part = _values[1];
	
	return struct_exists(_character,"body") && struct_exists(_character.body, _body_part.name);
}