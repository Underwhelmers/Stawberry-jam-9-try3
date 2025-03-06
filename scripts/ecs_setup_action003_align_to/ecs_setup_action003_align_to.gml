function ecs_setup_action003_align_to() {
    ecs_setup_system_multiplayer_action(
        "align your {name3} to {name1}'s {name2}",
        [["is_npc", "body"], ["is_bodypart"], ["is_bodypart"]],
        function(entities) {
            var char = entities[0];
            var their = entities[1];
			var your = entities[2];
			
			var _player = global.player;
			Components.types.aligned.add_to(_player);
			_player.aligned.new_alignment(your, their, char);
			
			
			scr_chat((char.name), "*They stand expectant*");
        },
		function(_values) {
			var _character = _values[0];
			var _their_part = _values[1];
			var _your_part = _values[2];
	
			return struct_exists(_character.body, _their_part.name) &&
				struct_exists(global.player.body, _your_part.name);
		}
    );
	
	Components.types.aligned = new Components("aligned", undefined, 
		function(entity) {
			default_add(entity, {
				new_alignment: function(what, to, partner) {
					self[$ what.name] = { to: to, of: partner };
				},
			});
		}
	);
}