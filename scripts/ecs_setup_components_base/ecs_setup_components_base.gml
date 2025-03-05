function ecs_setup_components_base() {
    StateComponents.types = {};
    StateComponents.types.is_npc = new StateComponents("is_npc");
    StateComponents.types.is_item = new StateComponents("is_item");
    StateComponents.types.is_player = new StateComponents("is_player");
    StateComponents.types.is_location = new StateComponents("is_location");
    StateComponents.types.is_bodypart = new StateComponents("is_bodypart");
	
	StateComponents.types.identity = new StateComponents("identity");
	StateComponents.types.identity.add_to = method(
        StateComponents.types.identity,
        function(entity, _name, _description) {
			entity.name = _name;
            default_add(entity, {
				name: _name,
				description: _description
			});
        }
    );
	
	
	StateComponents.types.position = new StateComponents("position");
	StateComponents.types.position.add_to = method(
        StateComponents.types.position,
        function(entity, _location) {
			ds_list_add(_location.contents, entity);
			
            default_add(entity, {
				location: _location
			});
        }
    );
	
	StateComponents.types.contents = new StateComponents("contents");
	StateComponents.types.contents.add_to = method(
        StateComponents.types.contents,
        function(entity) {
            default_add(entity, ds_list_create());
        }
    );
}