function CharacterSpecies(_specie_name, _loose_description, _body_parts, _traits, _genders) constructor {
	name = _specie_name;
	loose_description = _loose_description;
	body_parts = _body_parts;
	traits = _traits;
	gender_specific = _genders;
	
	
	static setup_character = function(_char, _gender = array_choose(gender_specific)) {
		_char.specie = name;
		_char.apearance.specie_description = loose_description;
		
		Components.types.body.add_to(_char, body_parts);
		Components.types.add_all(_char, traits);
		
		_gender.setup_character(_char);
	}
	
	static all_instances = [];
	array_push(all_instances,self);
}