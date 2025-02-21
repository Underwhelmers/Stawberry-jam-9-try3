scr_setup_action_synonyms();

global.current_room = {
    name: "The Dark Forest",
    description: "A gloomy forest with thick trees and the sound of distant howls.",
    items: [
		new symobj_lamp(), 
		new symobj_key()
	],  // List of objects in the room
};




global.player = {
    name: "Adventurer",
    inventory: [
		new symobj_inventory(),
		new symobj_sword(), 
		new symobj_apple()
	],  // Items the player is carrying
};

keyboard_string = "";