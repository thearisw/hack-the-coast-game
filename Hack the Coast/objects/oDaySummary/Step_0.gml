// --- 1. AUTO-CLOSE (TIME IS UP) ---
// The Global_Time object controls the clock. 
// When it switches back to DAY, this report must vanish instantly.
if (global.phase == global.P_DAY) {
    instance_destroy();
}

// --- 2. MANUAL CLOSE (OPTIONAL) ---
// If the player reads fast, they can close it.
// Note: This does NOT start the day. They just stare at the dark room 
// until the 8 seconds are naturally over.
if (keyboard_check_pressed(vk_space)) {
    instance_destroy();
}