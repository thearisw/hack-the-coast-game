function scr_phase_update() {
    if (global.phase == 0 && global.day_time > 60) {
        global.phase = 1; // day
    }
    else if (global.phase == 1 && global.day_time > 240) {
        global.phase = 2; // night
    }
}
