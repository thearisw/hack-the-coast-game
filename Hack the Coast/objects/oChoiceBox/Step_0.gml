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
        if (parentid != noone) {

            if (selected == 0) {
                // Try to admit + assign a random free bed
                var ok = false;

                if (instance_exists(oGameController)) {
                    with (oGameController) ok = gc_admit_person(parentid);
                }

                parentid.accepted = ok; // only accept if a bed was assigned
            } else {
                parentid.accepted = false;
            }

            parentid.choice = true; // Tell parent we are done
        }

        instance_destroy(); // Close the box
    }
}

