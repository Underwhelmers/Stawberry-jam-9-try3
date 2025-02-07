function dialog_unload_file(_filepath) {
    // Open the file for reading
    var _file = file_text_open_read(_filepath);
    array_filter_ext(
		global.dialogs.loaded_files,
		function(_val,_idx) { return _val == _filepath; }
	);

    // Read through the file line by line
    while (!file_text_eof(_file)) {
        var _current_text = file_text_read_string(_file);
        file_text_readln(_file); // Move to the next line

        // Process the line if it's not empty
        if (string_length(string_trim(_current_text)) > 0) {
            // Convert the line into an array of values
            var _data = array_map(
                string_split(_current_text, ">"),
                function(_val) {
                    return string_trim(_val);
                }
            );

            // If the action is "dialog", remove the associated key from the map
            if (_data[0] == "dialog") {
                var _key = _data[1];
                if (ds_map_exists(global.dialogs.available, _key)) {
                    ds_map_delete(global.dialogs.available, _key);
                }
            }
        }
    }

    // Close the file
    file_text_close(_file);
}
