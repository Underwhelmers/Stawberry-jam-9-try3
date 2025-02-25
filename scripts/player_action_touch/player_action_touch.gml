function player_action_touch(target, body_part) {
    var character = obj_game_manager.characters[? target];
    if (!character || ds_list_find_index(obj_game_manager.current_scene.characters, character) == -1) {
        return "No one named '" + target + "' is here.";
    }
    
    var player = global.player;
    if (!player.body.hands.free) {
        return "Your hands are already occupied.";
    }
    
	var description = generate_phrase_with_variants(
		"You |touch_action| her |"+ body_part +"|, feeling their |touch_sensation|. She |character_reaction|."
	);
	
    player.body.hands.free = false; // Update state
    character.arousal += 10;        // Increase arousal
    player.arousal += 5;           // Player arousal
    
    scr_inform(description);
}