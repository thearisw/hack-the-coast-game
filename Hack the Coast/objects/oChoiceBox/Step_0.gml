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
        
        // --- SITUATION A: INTAKE DECISION (UPDATED FOR QUEUE) ---
        if (menu_context == "intake_decision") {
            
            if (instance_exists(parentid)) {
                
                // 1. REMOVE FROM QUEUE (So everyone steps forward)
                if (instance_exists(oGameController)) {
                    var _q = oGameController.queue;
                    for (var i = 0; i < array_length(_q); i++) {
                        if (_q[i] == parentid) {
                            // Remove 1 item at index i
                            array_delete(oGameController.queue, i, 1);
                            break;
                        }
                    }
                }

                // 2. APPLY THE DECISION
                if (selected == 0) {
                    // ACCEPT
                    var ok = false;
                    if (instance_exists(oGameController)) {
                         with (oGameController) ok = gc_admit_person(other.parentid);
                    }
                    parentid.accepted = ok; 
                    
                    if (ok) {
                        // Move them inside (middle of room) so they don't block the door
                        parentid.home_x = room_width / 2;
                        parentid.home_y = 100; 
                    }
                } else {
                    // REJECT
                    parentid.accepted = false;
                    instance_destroy(parentid); // Remove from game
                }
                
                // Tell parent we are done and what we picked
				//parentid.entrance_choice = true; 
				//parentid.final_decision = selected; // 0 for Accept, 1 for Reject

				instance_destroy(); // Close the menu
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