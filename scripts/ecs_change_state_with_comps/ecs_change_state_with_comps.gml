function ecs_change_state_with_comps(_entity, _olds, _news) {
	var manager = obj_ecs_manager.component_manager;
	for (var i = 0, count = array_length(_olds); i < count; i++) {
		manager.remove_component(_entity,_olds[i]);
	}
	for (var i = 0, count = array_length(_news); i < count; i++) {
		manager.add_component(_entity,_news[i],true);
	}
}
