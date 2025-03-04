/// @param {string} _name
/// @param {string} _desc
/// @param {string} _with_art
function ecs_new_body_part(_name, _desc, _with_art, _extra_comps = []) {
    var entity = obj_ecs_manager.entity_manager.create_entity();
    StateComponents.types[$ "name"].add_to(entity, _name);
    StateComponents.types[$ "is_body_part"].add_to(entity);
    StateComponents.types[$ "basic_description"].add_to(entity, _desc);
    entity.new_instance = function() {
		return { covered_by: undefined };
	};
	entity.with_article = _with_art;
	
	for (var i = 0, count = array_length(_extra_comps); i < count; i++) {
		StateComponents.types[$ _extra_comps[i]].add_to(entity);
	}
	return entity;
}