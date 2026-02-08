if (keyboard_check_pressed(vk_up)) {
    selected = max(0, selected - 1);
}

if (keyboard_check_pressed(vk_down)) {
    selected = min(array_length(options) - 1, selected + 1);
}

if (keyboard_check_pressed(vk_enter)) {
    
	confirmed = true;
}


if (confirmed) {
	
    if(selected==0) parentid.accepted = true;
	else parentid.accepted = false;
	parentid.choice = true;
	//show_debug_message(other.accepted)
	instance_destroy();
    // destroy THIS choice box
}
