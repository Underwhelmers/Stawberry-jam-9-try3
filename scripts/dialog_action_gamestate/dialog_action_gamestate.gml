function dialog_action_gamestate(_data) {
    if (array_length(_data) == 3)
		dialog_gamestate_update(_data[1], _data[2]);
	if (array_length(_data) == 4)
		dialog_gamestate_update(_data[1], _data[2], _data[3]);
	
    return true;
}
