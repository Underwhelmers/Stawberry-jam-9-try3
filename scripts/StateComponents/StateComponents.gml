function StateComponents(_name, _value_generator, _parent = undefined) constructor {
	name = _name;
	childs = [self];
	if (_parent) {
		array_push(_parent.childs, self);
	}
	value_generator = _value_generator;
	manager = obj_ecs_manager.component_manager;
	current_entities = ds_list_create();
	
	static exists_on = function(entity) {
		return struct_exists(entity, name);
	};
	
	static default_add = function(entity, value = true) {
		ds_list_add(current_entities, )
		manager.add_component(entity, name, value);
	};
	
	static default_remove = function(entity) {
		var removed = [self.name];
		var pending = ds_queue_create();
		ds_queue_enqueue(pending, childs);
		
		while(!ds_queue_empty(pending)) {
			var current = ds_queue_dequeue(pending);
			for (var i = 1, count = array_length(current); i < count; i++) {
				array_push(removed,current[i].name);
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
	
	StateComponents.types.on_the_floor =  new StateComponents("on_the_floor");
	StateComponents.types.storable_in_backpack =  new StateComponents("storable_in_backpack");
	StateComponents.types.on_inventory =  new StateComponents("on_inventory");
	StateComponents.types.fragile =  new StateComponents("fragile");
	StateComponents.types.fragile.add_to = function (entity, fragility) {
		obj_ecs_manager.component_manager.add_component(entity, "fragile", { fragility: fragility });
	StateComponents.types.storable_in_backpack =  new StateComponents("storable_in_backpack", just_true);
	
	
	StateComponents.types.already_introduced =  new StateComponents("already_introduced");
	StateComponents.types.name_is_known =  new StateComponents("name_is_known");
	StateComponents.types.interested_sexualy =  new StateComponents("interested_sexualy");
	StateComponents.types.is_aroused =  new StateComponents("is_aroused", just_true);
	
	StateComponents.types.reached_climax =  new StateComponents("reached_climax");
	StateComponents.types.is_aroused =  new StateComponents("is_aroused");
	StateComponents.types.is_naked =  new StateComponents("is_naked");
	StateComponents.types.is_satisfied =  new StateComponents("is_satisfied");
	StateComponents.types.is_comfortable =  new StateComponents("is_comfortable");
	StateComponents.types.waiting_player_response = new StateComponents("waiting_player_response");
	StateComponents.types.out_of_reach =  new StateComponents("out_of_reach", just_true);
	
	StateComponents.types.banging_state = ecs_setup_component_banging_state();
	
	StateComponents.types.is_in_reach =  new StateComponents("is_in_reach");
	StateComponents.types.in_conversation =  new StateComponents("in_conversation", StateComponents.types.is_in_reach);
	StateComponents.types.sitting_together =  new StateComponents("sitting_together", StateComponents.types.is_in_reach);
	StateComponents.types.alone_with_pc = new StateComponents("alone_with_pc", StateComponents.types.is_in_reach);
	
	StateComponents.types.is_location = new StateComponents("is_location");
    StateComponents.types.shares_location_with_pc = new StateComponents("shares_location_with_pc");
    
    // Customize location component
	StateComponents.types.location = new StateComponents("location");
    StateComponents.types.location.add_to = function(entity) {
        obj_ecs_manager.component_manager.add_component(entity, "location", undefined); // Will hold location entity ID
    };
    
    // Customize door component
    StateComponents.types.door = new StateComponents("door");
    StateComponents.types.door.add_to = function(entity) {
        obj_ecs_manager.component_manager.add_component(entity, "door", {
            target_location: undefined // ID of target location entity
        });
    };
    
    // Customize transition component (generalized for other types)
    StateComponents.types.transition = new StateComponents("transition");
		obj_ecs_manager.component_manager.add_component(entity, "fragile", { fragility: fragility });
	};
    StateComponents.types.transition.add_to = function(entity) {
        obj_ecs_manager.component_manager.add_component(entity, "transition", {
            target_location: undefined,
            type: "generic" // e.g., "stairs", "window"
        });
    };
}