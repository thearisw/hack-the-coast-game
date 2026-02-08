dt = min(delta_time / 1000000, 0.05);

// Update timer
global.phase_t += dt;

// --- CONFIGURATION ---
var day_len   = 45; // 45 seconds for Day (8 AM -> 8 PM)
var night_len = 8;  // 8 seconds for Night (8 PM -> 8 AM)

// --- CLOCK SPEED CALCULATION ---
// Day: Cover 12 hours (720 mins) in 45 seconds
var day_rate = 720 / day_len;   

// Night: Cover the OTHER 12 hours (720 mins) in 8 seconds
// This makes the clock spin fast to show the night passing!
var night_rate = 720 / night_len; 

// Apply the correct speed based on phase
var rate = (global.phase == global.P_DAY) ? day_rate : night_rate;

global.game_min += dt * rate;
global.game_min = global.game_min mod 1440; // Wrap around at 24:00 (midnight)

// --- PHASE TRANSITIONS ---

// 1. END OF DAY -> GO TO NIGHT
if (global.phase == global.P_DAY && global.phase_t >= day_len) {
    global.phase = global.P_NIGHT; 
    global.phase_t = 0;
    
    // Send homeless people away
    with (oHomeless) {
        targetX = -50; 
        targetY = room_height / 2;
    }
}

// 2. END OF NIGHT -> START NEW DAY
else if (global.phase == global.P_NIGHT && global.phase_t >= night_len) {
    global.phase = global.P_DAY; 
    global.phase_t = 0;
    
    global.day += 1;          
    global.game_min = 8 * 60; // Ensure we start exactly at 8:00 AM
}