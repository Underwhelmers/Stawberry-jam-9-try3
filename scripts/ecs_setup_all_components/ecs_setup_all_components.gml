function ecs_setup_all_components() {
	ecs_setup_components_base();
	ecs_setup_components_body_fluids();
	ecs_setup_components_factions();
	ecs_setup_components_items();
	ecs_setup_components_npc();
}