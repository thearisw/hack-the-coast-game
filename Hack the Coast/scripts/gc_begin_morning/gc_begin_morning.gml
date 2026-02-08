function gc_begin_morning() {
    for (var i = 0; i < ds_list_size(admitted); i++) {
        var p = admitted[| i];
        if (!instance_exists(p)) continue;

        var b = p.assigned_bed;
        if (instance_exists(b)) {
            p.x = b.x + b.wake_dx;
            p.y = b.y + b.wake_dy;
        }

        p.hidden = false;
        p.visible = true;
    }
}
