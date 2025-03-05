function StateComponents(_name, _parent = undefined) constructor {
	name = _name;
	childs = [self];
	manager = obj_ecs_manager.component_manager;
	if (_parent) {
		array_push(_parent.childs, self);
	}
	
	static exists_on = function(entity) {
		return struct_exists(entity, name);
	};
	
	static default_add = function(entity, value = true) {
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
		
		for (var i = 0, count = array_length(removed); i < count; i++) {
			manager.remove_component(entity, removed[i]);
		}
	};
	
	add_to = default_add;
	remove_from = default_remove;
}
