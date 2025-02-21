function symobj_inventory() : scene_object("inventory") constructor {
	static inspect = function() {
		for (var i = 1, count = array_length(global.player.inventory); i < count; i++) {
			var item = global.player.inventory[i];
			item.enumerate();
		}
	}
}