function scr_npc_flirt(entity) {
    var npc = entity.relationship_with_pc;
    npc.attraction += 5;
    npc.desire += 3;
    scr_chat(entity.name, generate_phrase_with_variants("|npc_flirt_positive|"));
    scr_prompt_player_response(entity, ["accept", "resist"]);
}


function scr_prompt_player_response(entity, options) {
    var x_pos = SCREEN_W * 0.5;
    var y_pos = SCREEN_H * 0.5;
	StateComponents.types[$ "waiting_player_response"].add_to(entity);
	obj_usable_action_manager.generate_player_actions = false;
	instance_destroy(obj_usable_action_part);
	
    for (var i = 0; i < array_length(options); i++) {
		var node = new PhraseBuilderByStepsNode(function(_text, _args) {
            if (_text == "-accept-") {
                _args.entity.relationship_with_pc.attraction += 10;
                scr_chat(_args.entity.name, "Oh, |yes|-you're in!");
            } else if (_text == "-resist-") {
                _args.entity.relationship_with_pc.interact(-5);
                scr_chat(_args.entity.name, "|No|, fine then.");
            }
			
			StateComponents.types[$ "waiting_player_response"].remove_from(_args.entity);
			obj_usable_action_manager.generate_player_actions = true;
			obj_usable_action_manager.require_update = true;
        });
		node.mytext = string("-{0}-",options[i]);
		node.args = { entity: entity };
		
        var inst = instance_create_depth(x_pos + i * 100, y_pos, 0, obj_usable_action_part, { node: node });
    }
}