function scr_prompt_player(prompt) {
    if (!obj_game_manager.input_active) {
        scr_inform(prompt);             // Display the prompt
        obj_game_manager.input_active = true;
        obj_game_manager.input_string = ""; // Reset input
        keyboard_string = "";           // Clear GameMaker's keyboard buffer
    }
    return obj_game_manager.input_string; // Return current input (empty until Enter is pressed)
}