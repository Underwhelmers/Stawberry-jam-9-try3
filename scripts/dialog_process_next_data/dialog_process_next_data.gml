function dialog_process_next_data(_data) {
	var _new_data = array_create(array_length(_data));
	for (var _idx = 0, _count = array_length(_data); _idx < _count; _idx++) {
		var _entry = _data[_idx];
		
		// Find and replace all occurrences of @gs:<key>;
        var _regex = "@gs:([^;]+);"; // Regex to match @gs:<key>;
        while (string_pos("@gs:", _entry) > 0) {
            var _start_pos = string_pos("@gs:", _entry);
            var _end_pos = string_pos_ext(";", _entry, _start_pos);
            
            if (_end_pos > _start_pos) {
                var _key = string_copy(_entry, _start_pos + 4, _end_pos - _start_pos - 4);
                var _value = dialog_gamestate_get_value(_key);
				
                _entry = string_replace_all(_entry, string("@gs:{0};",_key), string(_value));
            } else {
                break; // No closing `;` found
            }
        }
        
        _new_data[_idx] = _entry;
	}
	_data = _new_data;
	
    switch (_data[0]) {
        case "name": return dialog_action_name(_data);
        case "text": return dialog_action_text(_data);
        case "image": return dialog_action_image(_data);
        case "script": return dialog_action_script(_data);
        case "choice": return dialog_action_choice(_data);
        case "gamestate": return dialog_action_gamestate(_data);
        case "if": return dialog_action_if(_data);
        case "start-nested-dialog": return dialog_action_start_nested(_data);
        case "wait-confirmation": return false;
		case "sound": return dialog_action_sound(_data);
		case "followup": return dialog_action_followup(_data);
    }
    return dialog_action_text(["text","ERROR WITH: "+string_join_ext(">",_data)]);
}
