function dialog_gamestate_get_value(_state_key) {
	// Handle constants
	if (_state_key == "true") {
		return true;
	} else if (_state_key == "false") {
		return false;
	} else if (ds_map_exists(global.dialogs.gamestate, _state_key)) {
		var _state = global.dialogs.gamestate[? _state_key];
		if (_state.type == DialogGamestateType.TEMPORAL) {
			if (_state.value) {
				_state.value = false;
				return true;
			}
			return false;
		}
		return global.dialogs.gamestate[? _state_key].value;
	}
	
	try { _state_key = real(_state_key); } catch(e) {}
	if (is_string(_state_key))
		return 0; // is not real
	return _state_key; // real value of string
}