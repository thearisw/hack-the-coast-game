// Only do this during NIGHT

if (global.phase == global.P_DAY) {
    
    if (spawn_count < max_spawn_per_intake) {
        spawn_timer++;
        
        if (spawn_timer >= spawn_rate) {
            // Spawn at bottom-center, slightly off-screen (room_height + 32)
            var spawn_x = room_width / 2;
            var spawn_y = room_height + 32; 
            
            var _inst = instance_create_layer(spawn_x, spawn_y, "Instances", oHomeless);
            
            // Set their initial target inside the room (20 pixels from bottom)
            // We add a little random X offset so they don't all stand in a perfect line
            _inst.targetX = (room_width / 2);
            _inst.targetY = room_height - 80; // Walk up into the room
            
            spawn_count++;
            spawn_timer = 0;
        }
    }
} else {
    // 3. Reset the count when intake is over so they can spawn tomorrow
    spawn_count = 0;
    spawn_timer = 0;
}