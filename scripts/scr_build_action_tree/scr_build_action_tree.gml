function scr_build_action_tree(actions) {
    var tree = new PhraseBuilderByStepsNode(function(_text, _args) {
        var action_attr = string_replace_all(_text, " ", "_");
        var action = _args.action;
        obj_ecs_manager.component_manager.add_component(action.entity, "player_used_" + action.action_attr, true);
    });
    
    for (var i = 0; i < array_length(actions); i++) {
        tree.add_leaf(
			string("-{0}-",actions[i].text), 
			{ action: actions[i] }
		);
    }
    
    return tree;
}