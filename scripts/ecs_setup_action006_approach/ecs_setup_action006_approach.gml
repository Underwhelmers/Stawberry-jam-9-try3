function ecs_setup_action006_approach() {
    var syst = ecs_setup_system_multiplayer_action(
        "approach {name1}",
        [["position", "!is_in_reach", "!is_player"], ["is_player", "position", "!engaged"]],
        function(entities) {
            var thing = entities[0];
            var player = entities[1];
			
			ds_list_foreach(Components.types.is_in_reach.current_entities, function(item) {
				Components.types.is_in_reach.remove_from(item);
			});
			
			Components.types.is_in_reach.add_to(thing);
			scr_inform("*You approached {0}*", thing.name);
        },
		function(_values) {
			return _values[0].position.location == _values[1].position.location;
		}
    );
	
}