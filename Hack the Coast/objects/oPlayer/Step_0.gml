key_left = keyboard_check(vk_left) ||  keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) ||  keyboard_check(ord("D"));

key_up = keyboard_check(vk_up) ||  keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) ||  keyboard_check(ord("S"));

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

if(keyboard_check_pressed(ord("E"))) {
	scr_dialogue_show(
    "I’ve been waiting since last night."
)
}

// --- ZONE DETECTION ---
active_zone = instance_place(x, y, oInteractionZone);

if (active_zone != noone) {
    
    // 1. FORMAT THE TEXT
    // We use "\n" to create line breaks
    var _full_text = active_zone.zone_name + "\n";
    
    // Add dynamic stats based on zone type
    if (active_zone.menu_context == "bed_menu") {
        _full_text += "Occupied: " + string(global.beds_occupied) + "/" + string(global.bed_capacity) + "\n";
        _full_text += "Policy: " + string(global.bed_policy) + "\n";
    }
    
    _full_text += "[SPACE] Manage";

    // 2. MANAGE THE BOX
    if (!instance_exists(my_textbox)) {
        // If box doesn't exist, Create it!
        my_textbox = scr_dialogue_show(_full_text);
    } else {
        // If box exists, Update the text (so numbers change in real-time)
        my_textbox.text = _full_text;
    }
    
    // 3. INPUT (Your existing logic)
    if (keyboard_check_pressed(vk_space)) {
        create_menu(active_zone.menu_context);
    }

} else {
    // --- WE ARE NOT IN A ZONE ---
    
    // If we still have a textbox open, destroy it!
    if (instance_exists(my_textbox)) {
        instance_destroy(my_textbox);
        my_textbox = noone;
    }
}