function ecs_setup_action004_push_in() {
    ecs_setup_system_multiplayer_action(
        "push your {name1} in their {name2}",
        [["is_bodypart", "is_phallus"], ["is_bodypart", "is_cavity"], ["is_player", "aligned"]],
        function(entities) {
            var char = entities[0];
            var bodypart = entities[1];
			
            scr_chat((char.name), "*you pushed your {0} in their {1}*", entities[0].name, entities[1].name);
        },
		function(_values) {
			var _your_part = _values[0];
			var _their_part = _values[1];
			var _player = _values[2];
	
			return struct_exists(_player.body, _your_part.name) && 
				struct_exists(_player.aligned, _your_part.name) &&
				_player.aligned[$ _your_part.name].to = _their_part
				;
		}
    );
}