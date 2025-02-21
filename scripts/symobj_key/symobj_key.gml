function symobj_key() : scene_object("key") constructor {
	description = "A dusty old key.";
	
	static use = function() {
		scr_chat(global.player.name, "On where?");
	}
}