function gc_begin_night() {
    night_start_min = global.game_min;
    night_hiding_done = false;

    // Make beds look FULL at night (even after people teleport away)
    for (var i = 0; i < ds_list_size(admitted); i++) {
        var p = admitted[| i];
        if (!instance_exists(p)) continue;

        var b = p.assigned_bed;
        if (instance_exists(b)) {
            b.occupied = true;     // <-- this flips bed sprite to Full via oBed Step
            b.assigned_id = p;
        }
    }
}
