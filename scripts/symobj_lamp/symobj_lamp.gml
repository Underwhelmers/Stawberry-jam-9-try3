function symobj_lamp() : scene_object("lamp") constructor {
	description = "A dusty old lamp.";
	
	turned_on = false;
	static use = function() {
		turned_on = !turned_on;
		scr_inform(turned_on ? "Lamp turned on.":"Lamp turned off.");
	}
	
	
}