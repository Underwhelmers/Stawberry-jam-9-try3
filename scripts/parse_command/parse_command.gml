function parse_command(input) {
    var words = string_split(input, " ");
    var action = words[0];
    var target = (array_length(words) > 1) ? words[1] : undefined;
    
    switch (action) {
        case "look":
            action_look(target);
            break;
        case "talk":
            action_talk(target);
            break;
        case "use":
            action_use(target);
            break;
        default:
            scr_chat("GAME","Unknown command: " + action);
            break;
    }
    check_events(); // Check for triggered events after each action
}