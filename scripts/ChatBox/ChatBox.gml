function ChatBox(width, height, font) constructor {
	log = ds_list_create();
	user_colour = ds_map_create();
	chat_font = font;
	chat_width = width;
	chat_height = height;
	
	user_colour[? "INFO"] = #9a9a9a;
	user_colour[? "Narrator"] = #9a9a9a;
	
	static draw = function(xleft, ybot) {
		var oldfont = draw_get_font();
		draw_set_font(chat_font);
		draw_set_valign(fa_bottom);
		
		var cursory = ybot;
		for (var i = ds_list_size(log) - 1; i >= 0 && cursory > ybot - chat_height; i--) {
			var _message = log[| i];
			var message_type = _message[1];
			var fulltext = string_capitalize(string_ext("{1}: {0}", _message));
			
			// Calculate the height of the message text
			var msg_height = string_height_ext(fulltext, -1, chat_width);
			
			// Set color based on message type (INFO, etc.)
			draw_set_color(user_colour[? message_type]);
			
			// Draw the text at the calculated position
			draw_text_ext(xleft, cursory, fulltext, -1, chat_width);
			
			// Adjust y for next message
			cursory -= msg_height + 2; // 2 for a bit of space between messages
		}
		
		draw_set_valign(fa_top);
		draw_set_font(oldfont);
		draw_set_color(c_white);
	}
	
	static send = function(from, text) {
		// If the user is unidentified, generate a random color for them
        if (!ds_map_exists(user_colour, from)) {
            user_colour[? from] = make_colour_hsv(random(255), 204, 179);
        }
        // Add the message with user color
        var _message = [text, from];
            
        // Add message to the log
        ds_list_add(log, _message);
	}
}


function scr_inform(_text) {
	var args = array_create(argument_count-1);
	for (var i = 0, count = argument_count-1; i < count; i++) {
		args[i] = argument[i+1];
	}
	
	scr_chat("INFO", string_ext(_text, args));
}

function scr_chat(_who,_text) {
	var args = array_create(argument_count-2);
	for (var i = 0, count = argument_count-2; i < count; i++) {
		args[i] = argument[i+2];
	}
	
	global.chat.send(_who, string_ext(
		generate_phrase_with_variants(_text),
		args
	));
}