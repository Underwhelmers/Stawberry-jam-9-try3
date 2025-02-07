function dialog_load_file(_filepath) {
    // Open the file for reading
    var _file = file_text_open_read(_filepath);
    array_push(global.dialogs.loaded_files,_filepath);
	
    // Variables to keep track of the current dialog key and its associated values
    var _current_key = "";
	var _current_values = new List();

    // Read through the file line by line
    while (!file_text_eof(_file)) {
        var _current_text = file_text_read_string(_file);
        file_text_readln(_file); // Move to the next line

        // Process the line if it's not empty
        if (string_length(string_trim(_current_text)) > 0) {
			// Convert values from "v1 >v2> v3 > > v4 > " to ["v1","v2","v3","","v4",""]
			var _data = array_map(
				string_split(_current_text, ">"),
				function(_val) {
					return string_trim(_val);
				}
			);
			
			switch (_data[0]) { // _data[0] is the action
				case "dialog":
					// Save the previous key and its values to the map, if applicable
					if (_current_key != "") {
						ds_map_add(
							global.dialogs.available, _current_key, 
							_current_values.get_array_values()
						);
					}
					
					// Start a new dialog key
					_current_key = _data[1];
					_current_values.clear();
					break;
				default:
					_current_values.add(_data);
					break;
			}
        }
    }

    // Add the last key and its values to the map, if applicable
    if (_current_key != "") {
        ds_map_add(
			global.dialogs.available, _current_key, 
			_current_values.get_array_values()
		);
    }

    // Clean up memory
	_current_values.clean();
	delete _current_values;
    file_text_close(_file);
}
