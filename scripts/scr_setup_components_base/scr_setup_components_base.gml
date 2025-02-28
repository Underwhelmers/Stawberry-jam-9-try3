function scr_setup_components_base() {
    StateComponents.types.is_npc = new StateComponents("is_npc");
    StateComponents.types.is_item = new StateComponents("is_item");
    StateComponents.types.is_player = new StateComponents("is_player");
    StateComponents.types.is_location = new StateComponents("is_location");
    StateComponents.types.is_body_part = new StateComponents("is_body_part");
	
	StateComponents.types.identity = new StateComponents("identity");
	StateComponents.types.identity.add_to = method(
        StateComponents.types.identity,
        function(entity, _name, _description) {
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
			_location.contents.add(entity);
			
            default_add(entity, {
				location: _position
			});
        }
    );
	
	StateComponents.types.contents = new StateComponents("contents");
	StateComponents.types.contents.add_to = method(
        StateComponents.types.contents,
        function(entity) {
            default_add(entity, new List());
        }
    );
}