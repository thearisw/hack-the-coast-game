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
            b.occupied = false;
            b.assigned_id = noone;
        }

        // show NPC
        p.hidden = false;
        p.visible = true;

        // reset wandering so they don't beeline back to bed
        p.home_x = p.x;
        p.home_y = p.y;
        p.wander_timer = 1;
        p.targetX = p.x;
        p.targetY = p.y;

        p.hs = 0;
        p.vs = 0;
    }
}
