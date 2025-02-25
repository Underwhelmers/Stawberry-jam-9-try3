function player_action_look_at_character(character_name) {
    var character = obj_game_manager.characters[? character_name];
    if (!character) {
        scr_inform("No one by that name is here.");
        return;
    }
    var desc = character.name + ": " + character.description.base + " ";
    desc += character.description.variants[irandom(array_length(character.description.variants) - 1)];
    if (character.body.skin.flushed) desc += " Her skin glows with a needy flush.";
    if (character.body.breasts.exposed) desc += " Her bare breasts rise with each breath.";
    scr_inform(desc);
}