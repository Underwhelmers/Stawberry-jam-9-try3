/// @param {string} _name
/// @param {string} _desc
/// @param {string} _with_art
function CharacterBodyParts(_name, _desc, _with_art, _extra_comps = []) constructor {
	obj_ecs_manager.entity_manager.create_entity(self);
	
    Components.types[$ "name"].add_to(self, _name);
    Components.types[$ "is_body_part"].add_to(self);
    Components.types[$ "basic_description"].add_to(self, _desc);
	with_article = _with_art;
	
	static instantiate = function() {
		return { covered_by: undefined };
	};
	
	for (var i = 0, count = array_length(_extra_comps); i < count; i++) {
		Components.types[$ _extra_comps[i]].add_to(self);
	}
	
	static all_instances = [];
	array_push(all_instances,self);
}
