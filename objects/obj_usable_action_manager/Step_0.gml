if (updating) {
	current_action_tree = new PhraseBuilderByStepsNode(function(_text, _args) {
		_args.inst.callback();
	});
	
	with (obj_usable_action) {
		other.current_action_tree.add_leaf(string("-{0}-",text), { inst: id });
	}
	
	//current_action_tree.compress();
	instance_destroy(obj_usable_action_part);
	
	var isnt = instance_create_depth(SCREEN_W/2, SCREEN_H/2,0,obj_usable_action_part, { 
		node: current_action_tree
	});
	
	if (current_action_tree.mytext == "") {
		isnt.visible = false;
		isnt.callback();
	}
}
		
updating = require_update;
require_update = false;