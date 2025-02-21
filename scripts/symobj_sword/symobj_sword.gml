function symobj_sword() : scene_object("sword") constructor {
	description = "A dusty old sword.";
	
	static use = function() {
		scr_chat(global.player.name, "On where?");
	}
}