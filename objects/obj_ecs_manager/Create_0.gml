system_manager = new ECS_SystemManager();
entity_manager = new ECS_EntityManager(system_manager);
component_manager = new ECS_ComponentManager(system_manager);


var emtpy_tracker_for_creating_global = new ECS_EntityTracker([]);
ECS_EntityTracker.all_instances = [];