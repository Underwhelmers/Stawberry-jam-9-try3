function TentEncSimulation(_player, _partner) constructor {
    player  = _player;
    partner = _partner;
    
    // Original tag containers
    used_tags_for_player  = new TentEncTagValues();
    used_tags_for_partner = new TentEncTagValues();
    player_target_for     = new TentEncTagValues();
    
    // Extended attributes for the simulation.
    // These containers are used to store tag values that represent the current state of each aspect.
    
    // Environment – where the encounter is taking place.
    environment = new TentEncTagValues();
    
    // Emotions – current emotional states of the participants.
    player_emotion  = new TentEncTagValues();
    partner_emotion = new TentEncTagValues();
    
    // Roles – e.g., active/passive, dominant/submissive.
    player_role  = new TentEncTagValues();
    partner_role = new TentEncTagValues();
    
    // Body state – which body parts are engaged or available.
    player_body  = new TentEncTagValues();
    partner_body = new TentEncTagValues();
    
    // Interaction – tags representing the type of interaction or action.
    interaction = new TentEncTagValues();
    
    // Fluids – for tracking lubricants or other fluids present.
    fluid = new TentEncTagValues();
    
    // Toys – for any sex toy or device tags that might be in use.
    toys = new TentEncTagValues();
    
    // Clothing – tags that describe what clothing or costumes are involved.
    clothing = new TentEncTagValues();
}