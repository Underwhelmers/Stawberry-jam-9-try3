function scr_apply_traits(entity, event, args) {
    var traits = entity.traits;
    var should_override = false;
    
    for (var i = 0, count = ds_list_size(traits); i < count; i++) {
        var trait = traits[| i];
        if (trait.apply(event, entity, args)) {
            args.behaviour_is_overriten = true; // At least one trait wants to override
        }
    }
    
    return args; // True if default behavior should stop
}