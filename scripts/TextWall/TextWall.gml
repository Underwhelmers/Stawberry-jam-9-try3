function TextWall() constructor {
    // Properties
    text_lines = ds_list_create();          // Array to store lines of text
    current_indent_depth = 0;       // Track the current indentation level
    indent_size = 4;          // Number of spaces per indent
	current_indent = "";

    // Write a single line of text
    static writeline = function(_text) {
        ds_list_add(text_lines, current_indent + _text);
    };

    // Start a new indentation level
    static start_indent = function() {
        current_indent_depth += 1;
        current_indent = string_repeat(" ", current_indent_depth * indent_size);
    };

    // End the current indentation level
    static end_indent = function() {
        current_indent_depth = max(0, current_indent_depth - 1); // Prevent negative indentation
        current_indent = string_repeat(" ", current_indent_depth * indent_size);
    };

	static start_group = function(_text) {
		writeline(_text);
		start_indent();
	};
	
	static end_group = function() {
		end_indent();
	};

    // Draw the text wall at a given position
    static draw = function(_x, _y) {
        var _draw_y = _y;
		var _size = ds_list_size(text_lines);
        for (var _idx = 0; _idx < _size;_idx++) {
            draw_text(_x, _draw_y, text_lines[|_idx]);
            _draw_y += string_height(text_lines[|_idx]) + 2; // Adjust spacing between lines
        }
    };
	
	static clean_up = function() {
		ds_list_destroy(text_lines);
		delete id;
	}
}