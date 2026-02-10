var dt = delta_time / 1000000;

// 1. TYPEWRITER (Keep this)
if (char_index < string_length(text)) {
    timer += dt;
    if (timer >= type_speed) {
        timer = 0;
        char_index++;
    }
} 

// 2. UPDATED PERSISTENCE LOGIC
// Instead of checking distance to 'x,y' (the top of the screen), 
// we check if the player has walked away from the Intake Zone.
if (instance_exists(oPlayer)) {
    // Look for the Intake Zone specifically
    var _zone = instance_nearest(oPlayer.x, oPlayer.y, oIntakeZone);
    
    if (_zone != noone) {
        var _dist = point_distance(oPlayer.x, oPlayer.y, _zone.x, _zone.y);
        
        // If the player walks more than 100 pixels away from the gate, close the box
        if (_dist > 100) {
            instance_destroy();
        }
    }
}