system_manager = new ECS_SystemManager();
entity_manager = new ECS_EntityManager(system_manager);
component_manager = new ECS_ComponentManager(system_manager);

var tracker = new ECS_EntityTracker(["ass"]);