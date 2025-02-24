function StateComponents(_name, _parent = undefined) constructor {
	name = _name;
	childs = [self];
	if (_parent) {
		array_push(_parent.childs, self);
	}
	
	static exists_on = function(entity) {
		return struct_exists(entity, name);
	};
	
	static default_add = function(entity) {
		obj_ecs_manager.component_manager.add_component(entity, name, true);
	};
	
	static default_remove = function(entity) {
		var removed = [self.name];
		var pending = ds_queue_create();
		ds_queue_enqueue(pending, childs);
		
		while(!ds_queue_empty(pending)) {
			var current = ds_queue_dequeue(pending);
			for (var i = 1, count = array_length(current); i < count; i++) {
				ds_array_push(removed,current[i].name);
				ds_queue_enqueue(pending,current[i].childs);
			}
		}
		
		ecs_change_state_with_comps(entity, removed, []);
	};
	
	add_to = default_add;
	remove_from = default_remove;
}

function ecs_setup_state_components() {
	StateComponents.types = {};
	StateComponents.types.is_npc =  new StateComponents("is_npc");
	StateComponents.types.is_object =  new StateComponents("is_object");
	
	StateComponents.types.on_the_floor =  new StateComponents("on_the_floor");
	StateComponents.types.storable_in_backpack =  new StateComponents("storable_in_backpack");
	
	StateComponents.types.already_introduced =  new StateComponents("already_introduced");
	StateComponents.types.name_is_known =  new StateComponents("name_is_known");
	StateComponents.types.interested_sexualy =  new StateComponents("interested_sexualy");
	
	StateComponents.types.reached_climax =  new StateComponents("reached_climax");
	StateComponents.types.is_aroused =  new StateComponents("is_aroused");
	StateComponents.types.is_naked =  new StateComponents("is_naked");
	StateComponents.types.is_satisfied =  new StateComponents("is_satisfied");
	StateComponents.types.is_comfortable =  new StateComponents("is_comfortable");
	
	StateComponents.types.banging_state = ecs_setup_component_banging_state();
	StateComponents.types.is_banging =  new StateComponents("is_banging", StateComponents.types.banging_state);
	
	StateComponents.types.out_of_reach =  new StateComponents("out_of_reach");
	StateComponents.types.is_in_reach =  new StateComponents("is_in_reach");
	StateComponents.types.in_conversation =  new StateComponents("in_conversation", StateComponents.types.is_in_reach);
	StateComponents.types.sitting_together =  new StateComponents("sitting_together", StateComponents.types.is_in_reach);
}