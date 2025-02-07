function dialog_action_sound(_data) {
	var _sound = _data[2];
	if (!asset_get_type(_sound) != asset_sound) return true;
	
	switch(_data[1]) {
		case "loop": 
			var _sound_idx = asset_get_index(_sound);
			global.dialogs.sounds[? _sound] = audio_play_sound(_sound_idx,100,true);
			break;
		case "play": 
			var _sound_idx = asset_get_index(_sound);
			global.dialogs.sounds[? _sound] = audio_play_sound(_sound_idx,100,false);
			break;
		case "stop":
			audio_stop_sound(global.dialogs.sounds[? _sound]);
			break;
	}
	
	return true;
}