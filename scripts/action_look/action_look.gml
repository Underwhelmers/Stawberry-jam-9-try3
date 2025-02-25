function action_look(command) {
    var actor = command.actor;           // "You" or NPC name
    var targets = command.targets;       // Array of targets (may be empty)
    var modifier = command.modifier;     // Optional adverb (e.g., "intently")
    var output = "";
    var is_player = (actor == "You");

    if (array_length(targets) == 0) {
        // No target: look around
        if (is_player) {
            output = "You look around. The room is " + choose("cozy", "dim", "spacious") + ".";
        } else {
            output = actor + " looks around " + (modifier != "" ? modifier : "calmly") + ".";
        }
    } else {
        // Looking at a specific target
        var target = targets[0]; // Handle first target only for simplicity

        if (is_player) {
            // Player looking at something
            if (ds_map_exists(obj_game_manager.characters, target)) {
				var char = obj_game_manager.characters[? target];
                // Target is a character
				var mood = char.mood;
                var eye_color = char.eye_color;
				output = "You look at " + target + ". They have |" + eye_color + "| and seem |" + mood + "|.";
                output += " " + target + " glances back at you.";
            } else {
                // Target is an object
                var texture = choose("smooth", "rough", "soft");
                output = "You look at the " + target + ". It feels " + texture + ".";
            }
            if (modifier != "") {
                output = "You " + modifier + " look at " + target + ". " + output;
            }
        } else {
            // NPC looking at something
            var manner = (modifier != "" ? modifier : "curiously");
            output = actor + " looks " + manner + " at " + target + ".";
        }
    }

    // Output the result to the chat system
    scr_chat(actor, output);
}