if (array_length(options) > 0) {
    // --- INPUT ---
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        selected--;
        if (selected < 0) selected = array_length(options) - 1; // Wrap to bottom
    }

    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        selected++;
        if (selected >= array_length(options)) selected = 0; // Wrap to top
    }

    // --- CONFIRM ---
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        confirmed = true;
    }

    // --- EXECUTE ---
    if (confirmed) {
        if (parentid != noone) {
            // Logic for your specific Bed Zone boolean
            if (selected == 0) parentid.accepted = true;
            else parentid.accepted = false;
            
            parentid.choice = true; // Tell parent we are done
        }
        instance_destroy(); // Close the box
    }
}