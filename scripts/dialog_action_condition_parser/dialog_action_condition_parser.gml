function dialog_action_condition_parser(_input) {
	// Handle parentheses first
	while (string_pos("(", _input) > 0) {
		var _start = string_pos("(", _input);
		var _end = string_pos(")", _input);
		
		// Extract the inner expression
		var _inner = string_copy(_input, _start + 1, _end - _start - 1);
		
		// Replace the parentheses with the result of parsing the inner expression
		var _inner_result = dialog_action_condition_parser(_inner);
		_input = string_replace(_input, "(" + _inner + ")", string(_inner_result));
	}
	
	// Handle OR conditions (||)
	var _split = string_split(_input, "||");
	if (array_length(_split) > 1) {
		for (var _i = 0; _i < array_length(_split); _i++) {
			if (dialog_action_condition_parser(_split[_i])) return true;
		}
		return false;
	}
	
	// Handle AND conditions (&&)
	_split = string_split(_input, "&&");
	if (array_length(_split) > 1) {
		for (var _i = 0; _i < array_length(_split); _i++) {
			if (!dialog_action_condition_parser(_split[_i])) return false;
		}
		return true;
	}
	
	// Handle comparisons and simple cases
	_split = string_split(_input, ";");
	if (array_length(_split) == 1) {
		return dialog_gamestate_get_value(string_trim(_input));
	} else if (array_length(_split) == 2) {
		switch (_split[0]) {
			case "check":
				return dialog_gamestate_get_value(string_trim(_split[1])) > 0;
			case "consume":
				var _state =  dialog_gamestate_get(string_trim(_split[1]),DialogGamestate.NUMERICAL);
				if (_state.type != DialogGamestate.NUMERICAL || _state.value < 1)
					return false;
				_state.value--;
				return true;
		}
	} else if (array_length(_split) == 3) {
		// Perform comparisons
		switch (_split[1]) {
			case "larger":
				return dialog_gamestate_get_value(string_trim(_split[0])) > dialog_gamestate_get_value(string_trim(_split[2]));
			case "lower":
				return dialog_gamestate_get_value(string_trim(_split[0])) < dialog_gamestate_get_value(string_trim(_split[2]));
			case "reached":
				return dialog_gamestate_get_value(string_trim(_split[0])) >= dialog_gamestate_get_value(string_trim(_split[2]));
			case "above": 
				return dialog_gamestate_get_value(string_trim(_split[0])) > dialog_gamestate_get_value(string_trim(_split[2]));
			case "below": 
				return dialog_gamestate_get_value(string_trim(_split[0])) < dialog_gamestate_get_value(string_trim(_split[2]));
		}
	}
	
	// Default case
	return false;
}
