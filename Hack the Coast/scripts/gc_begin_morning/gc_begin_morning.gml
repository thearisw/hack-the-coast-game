function gc_begin_morning() {
    night_hiding_done = false;

    for (var i = 0; i < ds_list_size(admitted); i++) {
        var p = admitted[| i];
        if (!instance_exists(p)) continue;

        var b = p.assigned_bed;

        if (instance_exists(b)) {
            // place next to bed
            p.x = b.x + b.wake_dx;
            p.y = b.y + b.wake_dy;

            // bed looks empty during the day
            b.occupied = false;     // <-- flips bed sprite back to empty
            b.assigned_id = noone;
        }

        p.hidden = false;
        p.visible = true;
    }
}
