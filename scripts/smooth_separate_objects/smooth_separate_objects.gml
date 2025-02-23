function smooth_separate_objects(obj1, obj2, separation_speed) {
    if (!instance_exists(obj1) || !instance_exists(obj2)) return;
    
    // Calculate overlap
    var dx = obj2.x - obj1.x;
    var dy = obj2.y - obj1.y;
    var dist = point_distance(obj1.x, obj1.y, obj2.x, obj2.y);
    
    if (dist == 0) dist = 0.01; // Prevent division by zero
    
    var combined_radius = (obj1.sprite_width + obj2.sprite_width) * 0.5; // Assuming circular shape approximation

    var overlap = combined_radius*2 - dist;
    
    if (overlap > 0) {
        // Normalize direction vector
        var nx = dx / dist;
        var ny = dy / dist;
        
        // Apply smooth separation
        var move_amount = min(overlap, separation_speed); // Don't over-separate
        
        obj1.x -= nx * move_amount * 0.5;
        obj1.y -= ny * move_amount * 0.5;
        obj2.x += nx * move_amount * 0.5;
        obj2.y += ny * move_amount * 0.5;
    }
}