function scr_process_command(input) {
    var command = scr_command_parser(input);
    
    if (ds_map_exists(global.action_map, command.action)) {
        var action_func = ds_map_find_value(global.action_map, command.action);
        script_execute(action_func, command);
    } else {
        scr_inform("Unknown command: " + command.toString());
    }
}