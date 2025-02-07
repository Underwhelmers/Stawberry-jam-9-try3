function DialogGamestateType(_name, _default) constructor {
	name = _name;
	default_value = _default;
}

function dialog_setup_gamestate_types() {
	DialogGamestateType.NUMBER   = new DialogGamestateType("number", 0);
	DialogGamestateType.STRING   = new DialogGamestateType("string", "NOT-SETTED");
	DialogGamestateType.BOOLEAN  = new DialogGamestateType("boolean", false);
	DialogGamestateType.TEMPORAL = new DialogGamestateType("temporal", false);
}