function split_text_by_height(input_text, max_height, text_width) {
    // Split the text into words.
    var words = string_split(input_text, " ");
    var chunks = [];
    var current_chunk = "";
    
    for (var i = 0; i < array_length(words); i++) {
        // Build a candidate by appending the current word.
        var candidate = (current_chunk == "") ? words[i] : current_chunk + " " + words[i];
        // If the candidate fits within max_height, accept it.
        if (string_height_ext(candidate, -1, text_width) <= max_height) {
            current_chunk = candidate;
        } else if (string_pos(words[i],"\n")) {
			var lines = string_split(words[i], "\n");
            // Process the first part of the word.
            var new_candidate = (current_chunk == "") ? lines[0] : current_chunk + " " + lines[0];
            if (string_height_ext(new_candidate, -1, text_width) <= max_height) {
                current_chunk = new_candidate;
            } else {
                chunks[array_length(chunks)] = current_chunk;
                current_chunk = lines[0];
            }
            // Process any subsequent parts.
            for (var j = 1; j < array_length(lines); j++) {
                new_candidate = current_chunk + "\n" + lines[j];
                if (j < array_length(lines) - 1) {
                    // For every part except the last, force a break if the candidate overflows.
                    if (string_height_ext(new_candidate, -1, text_width) <= max_height) {
                        current_chunk = new_candidate;
                    } else {
                        chunks[array_length(chunks)] = current_chunk;
                        current_chunk = lines[j];
                    }
                } else {
                    // For the last part, append it regardless to avoid splitting it off into a new group.
                    current_chunk = new_candidate;
                }
            }
		} else {
			// Otherwise, push the current chunk and start a new one.
	        chunks[array_length(chunks)] = current_chunk;
	        current_chunk = words[i];
		}
    }
    
    // Add any remaining text as a final chunk.
    if (current_chunk != "") {
        chunks[array_length(chunks)] = current_chunk;
    }
	
	for (var i = 0; i < array_length(chunks); i++) {
		chunks[i] = string_trim(chunks[i]);
		while (string_starts_with(chunks[i],"\n")) {
			chunks[i] = string_copy(chunks[i],2,array_length(chunks)-1);
		}
	}
    
    return chunks;
}