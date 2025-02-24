function ecs_setup_component_banging_state() {
	var inst = new StateComponents("banging_state");
	inst.add_to = function(entity) {
		obj_ecs_manager.component_manager.add_component(entity, "banging_state", {
	        position: "outside",// "inside" or "outside"
	        cavity: "none",     // "front", "rear", or "none" when not banging
	        intensity: 0        // 0-100, builds with actions like "thrust"
	    });
	}
    return inst;
}