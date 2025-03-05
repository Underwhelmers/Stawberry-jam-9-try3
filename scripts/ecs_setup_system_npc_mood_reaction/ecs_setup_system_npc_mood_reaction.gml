function ecs_setup_system_npc_mood_reaction() {
    var executer = new ECS_SystemInstance(["is_npc", "mood"], {});
    executer.execute_logic = method(executer, function(entity, args) {
        var mood = entity.mood.state;
        var intensity = entity.mood.intensity;
        
        if (mood == "angry" && intensity > 0.7) {
            scr_chat((entity.name), "That’s it! I’m done with you!");
            // Potentially trigger a "fight" action or flee
        } else if (mood == "scared" && intensity > 0.6) {
            scr_chat((entity.name), "Please, leave me alone!");
            // Potentially update position to "flee"
        }
    });
    obj_ecs_manager.system_manager.register_system(executer);
}