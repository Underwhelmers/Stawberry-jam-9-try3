function dialog_gamestate_get(_key, _type) {
	var _gamestate = global.dialogs.gamestate;
    if (!ds_map_exists(_gamestate, _key)) {
		_gamestate[? _key] = new DialogGamestate(_type);
    }
	return _gamestate[? _key];
}
