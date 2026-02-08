if (array_length(options) > 0) {

    // --- INPUT ---
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        selected--;
        if (selected < 0) selected = array_length(options) - 1;
    }

    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        selected++;
        if (selected >= array_length(options)) selected = 0;
    }

    // --- CONFIRM ---
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        confirmed = true;
    }

   // --- EXECUTE ---
    if (confirmed) {
        
        // --- SITUATION A: INTAKE DECISION (Your existing code) ---
        // We assume "intake_decision" is the default if context is empty, or specifically set
        if (menu_context == "" || menu_context == "intake_decision") {
            if (parentid != noone) {
                if (selected == 0) {
                    // Try to admit + assign a random free bed
                    var ok = false;
                    if (instance_exists(oGameController)) {
                        with (oGameController) ok = gc_admit_person(other.parentid);
                    }
                    parentid.accepted = ok; 
                } else {
                    parentid.accepted = false;
                }
                parentid.choice = true; // Tell parent we are done
            }
        }
        
        // --- SITUATION B: BED ZONE ---
        else if (menu_context == "bed_menu") {
            if (selected == 0) { global.bed_policy = "Strict"; global.bed_capacity = 8; }
            if (selected == 1) { global.bed_policy = "Overcrowd"; global.bed_capacity = 999; }
        }
        
        // --- SITUATION C: FOOD ZONE ---
        else if (menu_context == "food_menu") {
            if (selected == 0) { global.food_policy = "Normal"; global.food_daily_cost = 10; }
            if (selected == 1) { global.food_policy = "Half"; global.food_daily_cost = 5; }
        }
        
        // --- SITUATION D: STAFF ZONE ---
        else if (menu_context == "staff_menu") {
            if (selected == 0) { global.staff_policy = "Balanced"; }
            if (selected == 1) { global.staff_policy = "Overwork"; }
        }

        instance_destroy(); // Close the box
    }
}

