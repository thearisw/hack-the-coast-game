dt = 0;
global.game_min = 8 * 60; // Start at 8:00 AM

// --- PHASES ---
global.P_DAY    = 0; // Active Panic Phase
global.P_NIGHT  = 1; // Results Phase

global.day = 1;
global.phase = global.P_DAY;
global.phase_t = 0;

phase_string = "";