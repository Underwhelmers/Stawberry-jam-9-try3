function dialog_action_text(_data) {
    text.restart_tags();
    var _new_text = generate_phrase_with_variants(_data[1]); 
    _new_text = string_replace_all(_new_text, "\\n","\n");

	var _max_height = 265;
	draw_set_font(fnt_dialog);
	if (!array_contains(_data,"no-split",2) && string_height_ext(_new_text,-1,text.width) > _max_height) {
		var _splitted_text = split_text_by_height(_new_text, _max_height, text.width)
		
		for (var i = 0; i < array_length(_splitted_text); i++) {
			var _newarray = array_create(3);
			_newarray[0] = "text";
			_newarray[1] = _splitted_text[i];
			_newarray[2] = "no-split"
			_splitted_text[i] = _newarray;
		}
		
		// Split the current dialog into "before" and "after"
	    var before = array_create(diag_progress-1);
		array_copy(before, 0, full_dialog, 0, diag_progress - 1); // All processed elements
	    var after = array_create(array_length(full_dialog)-diag_progress);
		array_copy(after, 0, full_dialog, diag_progress, array_length(after));        // Remaining elements

	    // Merge "before", "nested", and "after" into a new dialog
	    full_dialog = array_concat(before, _splitted_text, after);

	    // Adjust diag_progress to point to the first line of the nested dialog
	    diag_progress--; // Decrement to reprocess the current step (start of nested dialog)
		
		draw_set_font(fnt_default);
		return true;
	}
	draw_set_font(fnt_default);

    if (array_contains(_data,"prefix-newline",2))
        _new_text = "\n" + _new_text;

    if (array_contains(_data,"prefix-space",2))
        _new_text = " " + _new_text;

    if (array_contains(_data,"auto",2))
        text.dont_wait = true;
		
    if (array_contains(_data,"halign-center",2)) {
		text.x += text.backbox.width / 2;
        text.halign = fa_center;
	}
		

    for (var i = 2; i < array_length(_data); i++) {
        if (!string_starts_with(_data[i], "speed:"))
            continue;

        try {
            var _speed_value = real(string_copy(_data[i], 7, string_length(_data[i]) - 6));
            if (_speed_value > 0) {
                text.set_speed(_speed_value);
            }
        } catch(e) { }
        break;
    }

    if (array_contains(_data,"keep-old-text",2))
        text.append(_new_text);
    else
        text.set_full_text(_new_text);

    // Theese two tags in the same text make no sense.
    if (array_contains(_data,"instant",2))
        text.load_all_instantly();

    if (array_contains(_data,"unskippable",2))
        text.unskippable = true;
    // So, as a design decision, I prioritized instant to unskippable

    return text.dont_wait;
}