// Only do this during NIGHT
if (global.phase == global.P_NIGHT && !night_hiding_done) {

    // minutes since night started (handles wrap-around)
    var elapsed = (global.game_min - night_start_min + 1440) mod 1440;

    if (elapsed >= night_hide_delay_min) {
        // Now hide admitted NPCs (teleport off-screen)
        for (var i = 0; i < ds_list_size(admitted); i++) {
            var p = admitted[| i];
            if (!instance_exists(p)) continue;

            p.hidden = true;
            p.visible = false;
            p.x = hide_x;
            p.y = hide_y;
        }

        night_hiding_done = true;
    }
}
