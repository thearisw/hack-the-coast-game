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

	show_debug_message(confirmed);
	show_debug_message(selected);
    if(selected==0) other.accepted = true;
	else other.accepted = false;
	other.choice = true;
    // destroy THIS choice box
    instance_destroy();
}