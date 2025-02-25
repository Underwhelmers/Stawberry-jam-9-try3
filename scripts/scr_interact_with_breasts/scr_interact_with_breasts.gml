function scr_interact_with_breasts(target) {
    var character = obj_game_manager.characters[? target];
    if (!character || ds_list_find_index(obj_game_manager.current_scene.characters, character) == -1) {
        return "No one named " + target + " is here.";
    }
    
    var player = global.player;
    if (!player.body.hands.free) {
        return "Your hands are already occupied.";
    }
    
    var description = global.word_variants.breast_description.get();
    var action = global.word_variants.breast_action.get();
    var reaction = global.word_variants.breast_reaction.get();
    
    var text = "You " + action + " her " + description + ". ";
    text += reaction + " in response.";
    
    player.body.hands.free = false;
    character.body.breasts.state = "aroused";
    character.arousal += 15;
    
    return text;
}