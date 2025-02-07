function TentEncAction(_option_text, _description, _preconditions, _effects) constructor {
	option_text = _option_text;
	description = _description;
	preconditions = _preconditions;
	effects = _effects;
	
	static can_use = function(_encounter) {
		for (var i = 0; i < array_length(preconditions); i++) {
			if (! preconditions[i].fulfilled_by(_encounter)) {
				return false;
			}
		}
		return true;
	}
	
	static apply = function(_encounter) {
		for (var i = 0; i < array_length(effects); i++) {
			effects[i].apply_to(_encounter);
		}
	}
	
	ds_list_add(global.all_tent_actions, self);
}

function scr_setup_tent_enc_actions() {
	global.all_tent_actions = ds_list_create();
	TentEncAction.NO_ACTION = new TentEncAction("NOACTION","NOACTION",[],[]);
	ds_list_clear(global.all_tent_actions);
	
	// setup a generic initializer to 
	var _tools   = TentEncTag.CAVITY_STIMULATOR.outter_childs();
	var _targets = TentEncTag.CAVITY_ENTRANCE  .outter_childs();
	
	for (var i = 0; i < array_length(_tools); i++) {
		var _tool = _tools[i];
		
		TentEncAction[$ string("TEASE_WITH_{0}",string_upper(_tool.name))] = new TentEncAction(
			string("Tease them with your {0}",_tool.name),
			string("You tese them with your |{0}|",_tool.name),
			[TentEncPrecond.PLAYER_HAS_TARGET_FOR(_tool)],
			[TentEncEffect.TEASE_WITH(_tool)]
		);
		
		if (_tool.is_valid(TentEncTag.PHALLUS))
		TentEncAction[$ string("INSERT_{0}",string_upper(_tool.name))] = new TentEncAction(
			string("Push your {0} in",_tool.name),
			string("Slide in your |{0}|",_tool.name),
			[TentEncPrecond.PLAYER_TARGET_FOR_IS(_tool, TentEncTag.CAVITY_ENTRANCE)],
			[TentEncEffect.INSERT(_tool)]
		);
		
		TentEncAction[$ string("PULL_OUT_{0}",string_upper(_tool.name))] = new TentEncAction(
			string("Pull your {0} out",_tool.name),
			string("Slide in your |{0}| out",_tool.name),
			[TentEncPrecond.PLAYER_USING(_tool)],
			[TentEncEffect.PULL_OUT(_tool)]
		);	
	
		for (var j = 0; j < array_length(_targets); j++) {
			var _targ = _targets[j];
			
			TentEncAction[$ string("ALIGN_{0}_{1}",string_upper(_tool.name),string_upper(_targ.name))] = new TentEncAction(
				string("Align {0} to {1}",_tool.name,_targ.name),
				string("You bring your |{0}| to |their| |{1}|",_tool.name,_targ.name),
				[TentEncPrecond.PLAYER_UNUSED(_tool), TentEncPrecond.PARTNER_HAS(_targ)],
				[TentEncEffect.PLAYER_AIM_AT(_tool, _targ)]
			);
		}
	}
	
	for (var j = 0; j < array_length(_targets); j++) {
		var _targ = _targets[j];
		
		TentEncAction[$ string("SPIT_AT_{0}",string_upper(_targ.name))] = new TentEncAction(
			string("Spit their {0}",_targ.name),
			string("You lubricate their {0} with |saliva|",_targ.name),
			[TentEncPrecond.PLAYER_TARGET_FOR_IS(TentEncTag.MOUTH, _targ)],
			[TentEncEffect.LUBRICATE_WITH(TentEncTag.SALIVA, _targ)]
		);
	}
}
