function GroupHandler(_groupkey) constructor {
    selected = noone;
    on_select = global.empty_func_1param;
    on_deselect = global.empty_func_1param;
    
    // Select an instance and trigger callbacks for all others
    static select = function(_new_selected) {
        if (selected == _new_selected) return;  // Ignore redundant selections
        var _old_selected = selected;
		
		if (instance_exists(_old_selected)) {
			on_deselect(_old_selected);
		}
		on_select(_new_selected);
		
		selected = _new_selected;
    };
	
	static groups = ds_map_create();
	ds_map_add(groups,_groupkey,self);
	static select_as = function(_groupkey, _new_selected) {
		groups[?_groupkey].select(_new_selected);
	}
}
