function action_use(item_name) {
    var item = undefined;
    for (var i = 0; i < array_length(global.game_state.items); i++) {
        if (global.game_state.items[i].name == item_name) {
            item = global.game_state.items[i];
            break;
        }
    }
    if (item != undefined) {
        if (array_length(global.game_state.characters) > 0) {
            var character = global.game_state.characters[0]; // First character for simplicity
            global.last_action = "use";
            global.last_target = item_name;
            global.last_character = character.name;
            if (array_contains(character.fetishes, item.name)) {
                scr_chat("GAME",character.name + " reacts eagerly to the " + item.name + ".");
            } else {
                scr_chat("GAME",character.name + " seems uninterested in the " + item.name + ".");
            }
        } else {
            scr_chat("GAME","There's no one here to use that on.");
        }
    } else {
        scr_chat("GAME","You don't have that item.");
    }
}