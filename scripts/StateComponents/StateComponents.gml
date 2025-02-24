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

function scr_setup_state_components() {
	StateComponents.is_npc =  new StateComponents("is_npc");
	StateComponents.is_object =  new StateComponents("is_object");
	
	StateComponents.on_the_floor =  new StateComponents("on_the_floor");
	StateComponents.storable_in_backpack =  new StateComponents("storable_in_backpack");
	
	StateComponents.already_introduced =  new StateComponents("already_introduced");
	StateComponents.name_is_known =  new StateComponents("name_is_known");
	StateComponents.interested_sexualy =  new StateComponents("interested_sexualy");
	
	StateComponents.reached_climax =  new StateComponents("reached_climax");
	StateComponents.is_aroused =  new StateComponents("is_aroused");
	StateComponents.is_naked =  new StateComponents("is_naked");
	StateComponents.is_satisfied =  new StateComponents("is_satisfied");
	StateComponents.is_comfortable =  new StateComponents("is_comfortable");
	
	StateComponents.banging_state = ecs_setup_component_banging_state();
	StateComponents.is_banging =  new StateComponents("is_banging", StateComponents.banging_state);
	
	StateComponents.out_of_reach =  new StateComponents("out_of_reach");
	StateComponents.is_in_reach =  new StateComponents("is_in_reach");
	StateComponents.in_conversation =  new StateComponents("in_conversation", StateComponents.is_in_reach);
	StateComponents.sitting_together =  new StateComponents("sitting_together", StateComponents.is_in_reach);
	
}