function make_new_character(_name) {
	var char = obj_ecs_manager.entity_manager.create_entity();
	Components.types.identity.add_to(char, _name);
	Components.types.add_all(char, ["apearance", "is_npc"]);
	
	var specie = array_choose(CharacterSpecies.all_instances);
	show_debug_message(specie.name);
	specie.setup_character(char);
	
	return char;
}