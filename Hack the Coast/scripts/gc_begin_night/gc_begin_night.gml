function gc_begin_night() {
    for (var i = 0; i < ds_list_size(admitted); i++) {
        var p = admitted[| i];
        if (!instance_exists(p)) continue;

        p.hidden = true;
        p.visible = false;

        p.x = hide_x;
        p.y = hide_y;
    }
}
