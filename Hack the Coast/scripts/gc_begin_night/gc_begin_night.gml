function gc_begin_night() {
	show_debug_message("NIGHT: admitted=" + string(ds_list_size(admitted)));
show_debug_message("NIGHT: beds=" + string(ds_list_size(bed_list)));

	
    night_start_min = global.game_min;
    night_hiding_done = false;

    // Clear bed occupancy first
    with (oBed) {
        occupied = false;
        assigned_id = noone;
    }

    // Build a list of free beds
    var free = ds_list_create();
    for (var i = 0; i < ds_list_size(bed_list); i++) {
        var b = bed_list[| i];
        if (instance_exists(b)) ds_list_add(free, b);
    }

    // Assign a random bed to each admitted NPC
    for (var i = 0; i < ds_list_size(admitted); i++) {
        var p = admitted[| i];
        if (!instance_exists(p)) continue;

        if (ds_list_size(free) == 0) {
            p.assigned_bed = noone;
            continue;
        }

        var idx = irandom(ds_list_size(free) - 1);
        var bed = free[| idx];
        ds_list_delete(free, idx);

        p.assigned_bed = bed;

        // Make the bed look FULL at night
        bed.occupied = true;
        bed.assigned_id = p;
    }

    ds_list_destroy(free);
}
