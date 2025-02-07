function scr_generate_actions_on_screen() {
	var _enc = obj_tent_enc.simulation;
	
	
	var _available = ds_list_create();
	for (var i = 0; i < ds_list_size(global.all_tent_actions); i++) {
		var _action = global.all_tent_actions[| i];
		if (_action.can_use(_enc)) {
			ds_list_add(_available, {
				action: _action,
				rect: new Rectangle().cover_text(0,0, _action.option_text, fnt_default_button),
				text: _action.option_text,
			});
		}
	}
	
	var _array = array_from_list(_available);
	_array = array_map(_array, function(_val,_idx) { return _val.rect; });
	
	pos_separated_squares(SCREEN_W*2/3, SCREEN_H/2, 1000, _array);
	for (var i = 0; i < array_length(_array); i++) {
		_array[i].move_pos(SCREEN_W/6,SCREEN_H/2);
	}
	
	
	var _btn_spr = object_get_sprite(btn_tent_enc_action);
	var _btn_w = sprite_get_width(_btn_spr);
	var _btn_h = sprite_get_height(_btn_spr);
	for (var i = 0; i < ds_list_size(_available); i++) {
		var _params = _available[|i];
		_params.image_xscale = _params.rect.width / _btn_w;
		_params.image_yscale = _params.rect.height / _btn_h;
		
		instance_create_depth(
			_params.rect.xcenter, 
			_params.rect.ycenter, 0,
			btn_tent_enc_action, 
			_params
		);
	}
}
