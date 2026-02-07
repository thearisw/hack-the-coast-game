function scr_time_update(dt) {
    global.game_time += dt;
    global.day_time += dt;

    if (global.day_time >= global.day_length) {
        global.day_time = 0;
        global.day += 1;
        global.phase = 0; // back to morning
    }
}
