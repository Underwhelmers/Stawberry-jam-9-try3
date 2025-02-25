function action_talk(target) {
    var character = undefined;
    for (var i = 0; i < array_length(global.game_state.characters); i++) {
        if (global.game_state.characters[i].name == target) {
            character = global.game_state.characters[i];
            break;
        }
    }
    if (character != undefined) {
        var dialogue = "Greetings, I'm " + character.name + ". ";
        dialogue += choose(
            "Care to join me in a " + character.species.norms[0] + "?",
            "I'm feeling " + character.personality + " tonight.",
            "My people favor " + character.species.preferences[0] + " pleasures."
        );
        scr_chat("GAME",dialogue);
    } else {
        scr_chat("GAME","No one by that name is here.");
    }
}