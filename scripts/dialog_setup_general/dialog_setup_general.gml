function dialog_setup_general() {
	dialog_setup_gamestate_types();
	global.dialogs = new GlobalDialogs();
}

function GlobalDialogs() constructor {
	loaded_files = [];
	available = ds_map_create();
	gamestate = ds_map_create();
}