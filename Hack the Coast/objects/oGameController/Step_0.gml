if (global.phase == global.P_DAY) { 

    if (spawn_count < max_spawn_per_intake) {
        spawn_timer++;
        
        if (spawn_timer >= spawn_rate) {
            
            // 1. GENERATE STATS & TYPE
            var age = irandom_range(10, 80);
            var sex = irandom_range(1,2);
            var has_disability = (random(100) < 15);
            
            // Default to base class
            var person_type = oHomeless;
            
            if (has_disability) person_type = oHomelessWheel;
            else if(age < 28) person_type = oHomelessChild;
            else if(age > 65) person_type = oHomelessElder;
            else if(sex == 2) person_type = oHomelessWomen;
            
            // 2. SPAWN AT THE DOOR COORDINATES
            var _inst = instance_create_layer(spawn_point_x, spawn_point_y, "Instances", person_type);
            
            // 3. FORCE INVISIBLE IMMEDIATELY (The Fix)
            // This stops the "flash" of the person appearing at the door before the logic runs
            _inst.visible = false;
            
            // 4. ADD TO QUEUE
            array_push(queue, _inst);
            
            spawn_count++;
            spawn_timer = 0;
        }
    }
} else {
    // Reset counters when not in DAY/INTAKE phase
    spawn_count = 0;
    spawn_timer = 0;
}