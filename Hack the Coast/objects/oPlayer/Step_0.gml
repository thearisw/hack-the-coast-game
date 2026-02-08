key_left = keyboard_check(vk_left) ||  keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) ||  keyboard_check(ord("D"));

key_up = keyboard_check(vk_up) ||  keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) ||  keyboard_check(ord("S"));

hs = key_right - key_left;
vs = key_down - key_up;

if(vs>0) sprite_index = PlayerFrontWalk;



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

// 1. Detect if we are standing on a zone
active_zone = instance_place(x, y, oInteractionZone);

// 2. Input to Open Menu
if (active_zone != noone) {
    if (keyboard_check_pressed(vk_space)) {
        // We will build this menu script in the next step!
        create_menu(active_zone.menu_context);
    }
}