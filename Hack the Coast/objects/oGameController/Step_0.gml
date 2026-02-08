// Only do this during NIGHT
if (global.phase == global.P_NIGHT && !night_hiding_done) {

    // minutes since night started (handles wrap-around)
    var elapsed = (global.game_min - night_start_min + 1440) mod 1440;

    if (elapsed >= night_hide_delay_min) {
        // Now hide admitted NPCs (teleport off-screen)
        for (var i = 0; i < ds_list_size(admitted); i++) {
            var p = admitted[| i];
            if (!instance_exists(p)) continue;

            p.hidden = true;
            p.visible = false;
            p.x = hide_x;
            p.y = hide_y;
        }

        night_hiding_done = true;
    }
}
if (global.phase == global.P_INTAKE) {
    
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