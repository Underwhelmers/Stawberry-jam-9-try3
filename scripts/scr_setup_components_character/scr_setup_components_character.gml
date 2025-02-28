function scr_setup_components_character() {
    StateComponents.types.gender = new StateComponents("gender");
    StateComponents.types.specie = new StateComponents("specie");
    StateComponents.types.background = new StateComponents("background");
    StateComponents.types.appearance = new StateComponents("appearance");
	
	// Relationship stages
    StateComponents.types.strager = new StateComponents("strager");
    StateComponents.types.knows_name = new StateComponents("knows_name");
    StateComponents.types.interested_sexually = new StateComponents("interested_sexually");
    StateComponents.types.willing_to_have_sex = new StateComponents("willing_to_have_sex");
    StateComponents.types.following_player = new StateComponents("following_player");
	
	// Conversation stages
	StateComponents.types.in_conversation = new StateComponents("in_conversation");
	StateComponents.types.flirting_progress = new StateComponents("flirting_progress", StateComponents.types.in_conversation);
	StateComponents.types.flirting_progress.add_to = method(
        StateComponents.types.flirting_progress,
        function(entity) {
            default_add(entity, {
				interest: 5,
				desire: 0
			});
        }
    );
	
	// Intercourse stages
	StateComponents.types.alone_with_player = new StateComponents("alone_with_player");
	StateComponents.types.is_naked = new StateComponents("is_naked");
	StateComponents.types.genitals_are_ready = new StateComponents("genitals_are_ready");
	StateComponents.types.stimulation_progress = new StateComponents("stimulation_progress");
	StateComponents.types.stimulation_progress.add_to = method(
        StateComponents.types.stimulation_progress,
        function(entity, _tool, _target, _action) {
            default_add(entity, {
				tool_used: _tool,
				target: _target,
				action: _action,
				intensity: 1,
				
				buildup: 0
			});
        }
    );
	
}