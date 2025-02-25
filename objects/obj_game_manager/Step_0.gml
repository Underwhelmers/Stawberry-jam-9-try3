if (input_active) {
    input_string = keyboard_string; // Update input with what’s typed
    if (keyboard_check_pressed(vk_enter) && string_length(input_string) > 0) {
        var command = input_string;
        input_active = false;         // Stop input mode
        input_string = "";            // Clear for next time
        keyboard_string = "";         // Reset buffer
        scr_process_command(command); // Process the command
    }
} else if (keyboard_check_pressed(vk_enter)) {
	input_active = true;
	keyboard_string = "";
}