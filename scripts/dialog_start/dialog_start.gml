function dialog_start(_dialog_key) {
	if (!ds_map_exists(global.dialogs.available,_dialog_key))
		return;

	dialog_close();
	var _box = instance_create_depth(0,0,-100,obj_dialog);
	_box.full_dialog = global.dialogs.available[? _dialog_key];
}
