function action_look(target) {
    if (target == undefined) {
        scr_chat("GAME",global.game_state.current_location.description);
    } else {
        var found = false;
        for (var i = 0; i < array_length(global.game_state.characters); i++) {
            if (global.game_state.characters[i].name == target) {
                var char = global.game_state.characters[i];
                var desc = char.name + ", a " + char.species.name + " with " + string_join_ext(", ", char.species.traits) + ".";
                scr_chat("GAME",desc);
                found = true;
                break;
            }
        }
        if (!found) {
            for (var i = 0; i < array_length(global.game_state.items); i++) {
                if (global.game_state.items[i].name == target) {
                    scr_chat("GAME",global.game_state.items[i].description);
                    found = true;
                    break;
                }
            }
        }
        if (!found) {
            scr_chat("GAME","You don't see that here.");
        }
    }
}