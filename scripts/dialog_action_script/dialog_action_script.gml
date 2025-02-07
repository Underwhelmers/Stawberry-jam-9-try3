function dialog_action_script(_data) {
	var _asset = asset_get_index(_data[1]);
	script_execute_ext(_asset, _data, 2);
	return true;
}