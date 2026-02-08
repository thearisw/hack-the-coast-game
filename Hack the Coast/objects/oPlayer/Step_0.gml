// --- YOUR EXISTING MOVEMENT CODE (UNCHANGED) ---
key_left =  keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up =    keyboard_check(ord("W"));
key_down =  keyboard_check(ord("S"));

hs = key_right - key_left;
vs = key_down - key_up;

if(vs>0) sprite_index = PlayerFrontWalk;
else if(vs<0) sprite_index = PlayerBackWalk;
else if(hs>0) sprite_index = PlayerRightWalk;
else if(hs<0) sprite_index = PlayerLeftWalk;
else if(vs==0) sprite_index = PlayerFrontIdle;
else sprite_index = PlayerRightIdle;

if (place_meeting(x+hs,y,oWall)) {
    while(abs(hs)>0.1) {
        hs*=0.5;
        if(!place_meeting(x+hs,y,oWall)) x+=hs;
    }
    hs=0;
}
x+= hs;

if (place_meeting(x,y+vs,oWall)) {
    while(abs(vs)>0.1) {
        vs*=0.5;
        if(!place_meeting(x,y+vs,oWall)) y+=vs;
    }
    vs=0;
}
y+= vs;

// --- ZONE DETECTION (UPDATED) ---
active_zone = instance_place(x, y, oInteractionZone);
// Note: Ensure your Intake object is a child of oInteractionZone 
// OR check specifically for oIntakeZone as well:
if (active_zone == noone) active_zone = instance_place(x, y, oIntakeZone);

if (active_zone != noone) {
    
    // 1. START THE TEXT STRING
    var _full_text = active_zone.zone_name + "\n";
    
    // 2. CHECK WHICH ZONE WE ARE IN & ADD STATS
    
    // --- A. BEDS ---
    if (active_zone.menu_context == "bed_menu") {
        _full_text += "Occupied: " + string(global.beds_occupied) + "/" + string(global.bed_capacity) + "\n";
        _full_text += "Policy: " + string(global.bed_policy) + "\n";
        _full_text += "[SPACE] Manage"; 
    }
    
    // --- B. FOOD ---
    else if (active_zone.menu_context == "food_menu") {
        _full_text += "Rations: " + string(global.food_rations) + "\n";
        _full_text += "Daily Use: " + string(global.food_daily_cost) + "\n";
        _full_text += "Policy: " + string(global.food_policy) + "\n";
        _full_text += "[SPACE] Manage"; 
    }
    
    // --- C. STAFF ---
    else if (active_zone.menu_context == "staff_menu") {
        _full_text += "Staff: " + string(global.staff_count) + "\n";
        _full_text += "Fatigue: " + string(global.staff_fatigue) + "%\n";
        _full_text += "Focus: " + string(global.staff_policy) + "\n";
        _full_text += "[SPACE] Manage"; 
    }

    // --- D. INTAKE (NEW QUEUE LOGIC) ---
    else if (active_zone.menu_context == "intake_menu") {
        var q_len = 0;
        // Check oGameController for queue length
        if (instance_exists(oGameController)) {
            q_len = array_length(oGameController.queue);
        }

        _full_text += "Waiting: " + string(q_len) + " People\n";
        
        if (q_len > 0) _full_text += "[SPACE] Process Next";
        else _full_text += "Queue Empty";
    }
    
    // --- 3. CREATE OR UPDATE THE TEXTBOX ---
    // Check if the Menu (ChoiceBox) is open
    if (instance_exists(oChoiceBox)) {
        
        // IF MENU IS OPEN: Hide the info text so it's not messy
        if (instance_exists(my_textbox)) {
            instance_destroy(my_textbox);
            my_textbox = noone;
        }
        
    } else {
        
        // IF MENU IS CLOSED: Show/Update the info text
        if (!instance_exists(my_textbox)) {
            my_textbox = scr_dialogue_show(_full_text);
        } else {
            my_textbox.text = _full_text;
        }
    }
    
    // 4. INPUT 
    if (keyboard_check_pressed(vk_space)) {
        
        // SPECIAL CASE: INTAKE QUEUE
        if (active_zone.menu_context == "intake_menu") {
            if (instance_exists(oGameController)) {
                // Are there people in line?
                if (array_length(oGameController.queue) > 0) {
                    // Get the person at the front (Index 0)
                    var _first_person = oGameController.queue[0];
                    
                    // Trigger the choice box specifically for THEM
                    scr_choice_show(["Accept", "Reject"], _first_person, "intake_decision");
                }
            }
        } 
        // NORMAL CASE: OTHER MENUS
        else {
            create_menu(active_zone.menu_context);
        }
    }
    
} else {
    // --- WE LEFT THE ZONE ---
    if (instance_exists(my_textbox)) {
        instance_destroy(my_textbox);
        my_textbox = noone;
    }
}