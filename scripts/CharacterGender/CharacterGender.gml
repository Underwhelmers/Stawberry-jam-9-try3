function CharacterGender(_gender_name, _as_adjective, _body_parts, _extra_traits) constructor {
	name = _gender_name;
	as_adjective = _as_adjective;
	body_parts = _body_parts;
	extra_traits = _extra_traits;
	
	static setup_character = function(_char) {
		_char.body.add_all(body_parts)
		Components.types.add_all(_char, extra_traits);
		
		_char.apearance.specie_description = as_adjective + " " + _char.apearance.specie_description;
	}	
}