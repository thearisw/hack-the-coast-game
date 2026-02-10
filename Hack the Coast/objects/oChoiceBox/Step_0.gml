if (array_length(options) > 0) {

    // --- 1. INPUT ---
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        selected--;
        if (selected < 0) selected = array_length(options) - 1;
    }

    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        selected++;
        if (selected >= array_length(options)) selected = 0;
    }

    // --- 2. CONFIRM ---
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        confirmed = true;
    }

    // --- 3. EXECUTE ---
    if (confirmed) {
        
        // --- CLEANUP TEXT BOXES ---
        // This ensures the dialogue and specs disappear the moment you pick an option
        if (instance_exists(oDialogue)) instance_destroy(oDialogue);
        if (instance_exists(oDialogueSpec)) instance_destroy(oDialogueSpec);

        // --- SITUATION A: INTAKE DECISION ---
        if (menu_context == "intake_decision") {
            
				if(global.beds_occupied== global.bed_capacity && global.bed_policy!="overflow") {
					scr_dialogue_show_spec("Too many! Reject or change beds to overflow",0,0)
				}
            if (instance_exists(parentid)) {
                
                // 1. REMOVE FROM QUEUE
                if (instance_exists(oGameController)) {
                    var _q = oGameController.queue;
                    for (var i = 0; i < array_length(_q); i++) {
                        if (_q[i] == parentid) {
                            array_delete(oGameController.queue, i, 1);
                            break;
                        }
                    }
                }

                // 2. APPLY THE DECISION
				if(selected ==1){
                    // REJECT
                    parentid.accepted = false;
                    instance_destroy(parentid); 
                }
                else if (selected == 0) {
                    // ACCEPT
                    var ok = false;
                    if (instance_exists(oGameController)) {
                         with (oGameController) ok = gc_admit_person(other.parentid);
                    }
                    parentid.accepted = ok; 
                    
                    if (ok) {
                        parentid.home_x = room_width / 2;
                        parentid.home_y = 100; 
                    }
                } else 

                instance_destroy(); // Close Choice Box
            }
        }
        
        // --- SITUATION B: BED ZONE ---
        else if (menu_context == "bed_menu") {
            if (selected == 0) { global.bed_policy = "Strict"; global.bed_capacity = 10; }
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

        instance_destroy(); // Final safety destroy
    }
}