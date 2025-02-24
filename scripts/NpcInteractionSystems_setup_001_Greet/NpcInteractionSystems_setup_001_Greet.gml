function NpcInteractionSystems_setup_001_Greet() {
	NpcInteractionSystems.Greet = ecs_setup_system_player_action(
		"greet {name}", 
        ["!already_introduced", "is_in_reach", "relationship_with_pc", "traits"], 
        function(entity, args) {
			resp = scr_apply_traits(entity, args.system_event, { behaviour_is_overriten: false });
            if (resp.behaviour_is_overriten) return;
			
            scr_chat(global.player.name, "greet_player");
            scr_chat(entity.name, 
				struct_exists(args, "final_chat")? 
				args.final_chat :"greet_positive"
			);
			
			
			StateComponents[$ "in_conversation"].add_to(entity);
			StateComponents[$ "already_introduced"].add_to(entity);
            entity.relationship_with_pc.interact(5);
        }
    );
	
	new_word_variant("greet_player", ["|Hello|!"]);
    new_word_variant("greet_positive", ["|Hello|!","|Formal_hello|."]);
}