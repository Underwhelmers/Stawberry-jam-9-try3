function dialog_gamestate_set(_key, _type, _value) {
	var _gamestate = global.dialogs.gamestate;
	_gamestate[? _key] = new DialogGamestate(_type);
	_gamestate[? _key].value = _value;
}
