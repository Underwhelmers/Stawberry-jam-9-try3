function ecs_setup_components_base() {
    Components.types = {
		add_all: function(_entity, _names) {
			for (var i = 0, count = array_length(_names); i < count; i++) {
				self[$ _names[i]].add_to(_entity);
			}
		}
	};
	
    Components.types.is_npc = new Components("is_npc");
    Components.types.is_item = new Components("is_item");
    Components.types.is_player = new Components("is_player");
    Components.types.is_location = new Components("is_location");
    Components.types.is_bodypart = new Components("is_bodypart");
	
	Components.types.identity = new Components("identity");
	Components.types.identity.add_to = method(
        Components.types.identity,
        function(entity, _name = "", _description = "") {
			entity.name = _name;
            default_add(entity, {
				name: _name,
				description: _description
			});
        }
    );
	
	
	Components.types.apearance = new Components("apearance");
	Components.types.apearance.add_to = method(
        Components.types.apearance,
        function(entity) {
            default_add(entity, {
				specie_description: ""
			});
        }
    );
	
	Components.types.position = new Components("position");
	Components.types.position.add_to = method(
        Components.types.position,
        function(entity, _location = {}) {
			_location.contents.add(entity);
			
            default_add(entity, {
				location: _position
			});
        }
    );
	
	Components.types.contents = new Components("contents");
	Components.types.contents.add_to = method(
        Components.types.contents,
        function(entity) {
            default_add(entity, new List());
        }
    );
}