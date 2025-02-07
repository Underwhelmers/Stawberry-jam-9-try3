function pos_separated_squares(area_width, area_height, iterations, array_of_rectangles) {
    var n = array_length(array_of_rectangles);
    
    // 1. Initially, position each rectangle at a random location within the area.
    for (var i = 0; i < n; i++) {
        var rect = array_of_rectangles[i];
		
        // Ensure the entire rectangle fits inside the area.
        var rand_x = random_range(0, area_width - rect.width);
        var rand_y = random_range(0, area_height - rect.height);
        
		// Calculate displacement needed.
        var dx = rand_x - rect.xleft;
        var dy = rand_y - rect.ytop;
        rect.move_pos(dx, dy);
    }
    
    // 2. Iteratively adjust positions so that rectangles are separated,
    //    taking into account their dimensions.
    var margin = 5; // Additional margin (in cm)
    for (var it = 0; it < iterations; it++) {
        var moved = false;
        
		// Border repulsion: push any rectangle that gets too close to the area's borders.
        for (var i = 0; i < n; i++) {
            var rect = array_of_rectangles[i];
            var forceX = 0;
            var forceY = 0;
            
            if (rect.xleft < margin) {
                forceX += (margin - rect.xleft);
            }
            if (rect.xright > area_width - margin) {
                forceX -= (rect.xright - (area_width - margin));
            }
            if (rect.ytop < margin) {
                forceY += (margin - rect.ytop);
            }
            if (rect.ybot > area_height - margin) {
                forceY -= (rect.ybot - (area_height - margin));
            }
            
            if (forceX != 0 || forceY != 0) {
                rect.move_pos(forceX, forceY);
                moved = true;
            }
        }
		
        // Check all pairs of rectangles for overlap.
        for (var i = 0; i < n; i++) {
            var A = array_of_rectangles[i];
            for (var j = i + 1; j < n; j++) {
                var B = array_of_rectangles[j];
                
				if (!A.check_collision(B))
					continue;
					
				moved = true;
				
                // Compute half sizes.
                var A_halfW = A.half_width;
                var A_halfH = A.half_height;
                var B_halfW = B.half_width;
                var B_halfH = B.half_height;
                
                // Compute centers.
                var A_cx = A.xcenter;
                var A_cy = A.ycenter;
                var B_cx = B.xcenter;
                var B_cy = B.ycenter;
                
                // Desired separation: sum of half-widths plus margin.
                var desiredX = A_halfW + B_halfW + margin;
                var desiredY = A_halfH + B_halfH + margin;
                
                // Current distance between centers.
                var deltaX = A_cx - B_cx;
                var deltaY = A_cy - B_cy;
                var absDeltaX = abs(deltaX);
                var absDeltaY = abs(deltaY);
                
                // Overlap amounts along each axis.
                var overlapX = desiredX - absDeltaX;
                var overlapY = desiredY - absDeltaY;
                
                // If both overlaps are positive, the rectangles are too close.
                if (overlapX > 0 && overlapY > 0) {
				
                    // Separate along the axis with the smaller overlap.
                    if (overlapX < overlapY) {
                        // Move A and B along the X axis.
                        var shift = overlapX * 0.5;
                        if (deltaX < 0) {
                            // A is to the left of B, so push A left and B right.
                            A.move_pos(-shift, 0);
                            B.move_pos(shift, 0);
                        } else {
                            A.move_pos(shift, 0);
                            B.move_pos(-shift, 0);
                        }
                    } else {
                        // Move along the Y axis.
                        var shift = overlapY * 0.5;
                        if (deltaY < 0) {
                            // A is above B, so push A up and B down.
                            A.move_pos(0, -shift);
                            B.move_pos(0, shift);
                        } else {
                            A.move_pos(0, shift);
                            B.move_pos(0, -shift);
                        }
                    }
                }
            }
        }
        
        if (!moved) break;  // Stop if no rectangles moved this iteration.
    }
    
    return array_of_rectangles;
}
