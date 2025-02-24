function ecs_setup_component_banging_state(manager, entity) {
    manager.add_component(entity, "banging_state", {
        is_banging: false,       // True when penetration is active
        position: "outside",     // "inside" or "outside"
        cavity: "none",          // "front", "rear", or "none" when not banging
        intensity: 0             // 0-100, builds with actions like "thrust"
    });
}