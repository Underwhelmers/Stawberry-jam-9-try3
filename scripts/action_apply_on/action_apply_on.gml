function action_apply_on(_verb, _noun) {
	var inst = get_from_scene(_noun);
	
    if (is_array(inst)) {
        scr_chat("Player", string("There are multiple of {0}.", _noun));
    } else if (is_struct(inst)) {
		with (inst) inst[$ _verb]();
	} else {
        scr_chat("Player", string("I don't see here any {0}.", _noun));
    }
}