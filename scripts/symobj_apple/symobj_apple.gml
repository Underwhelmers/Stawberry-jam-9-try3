function symobj_apple() : scene_object("apple") constructor {
	description = "A dusty old apple.";
	
	static consume = function() {
		scr_chat(global.player.name, "Mmmm... Crunchy and infite.");
	}
}