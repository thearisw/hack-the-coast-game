// 1. CALCULATE TIME (No Pause!)
dt = min(delta_time / 1000000, 0.05);

// 2. RUN THE CLOCK
global.phase_t += dt;

// --- CONFIGURATION ---
var day_len   = 45; 
var night_len = 8;  // <--- The Report will last exactly 8 seconds

// --- CLOCK SPEED ---
var day_rate = 720 / day_len;   
var night_rate = 720 / night_len; 
var rate = (global.phase == global.P_DAY) ? day_rate : night_rate;

global.game_min += dt * rate;
global.game_min = global.game_min mod 1440; 

// --- PHASE TRANSITIONS ---

// A. END OF DAY -> START NIGHT (Open Report)
if (global.phase == global.P_DAY && global.phase_t >= day_len) {
    
    scr_end_day_calculations();
    
    // Create the Report
    if (!instance_exists(oDaySummary)) {
        instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, "Instances", oDaySummary);
    }
    
    // Switch to Night Phase (Clock keeps ticking!)
    global.phase = global.P_NIGHT; 
    global.phase_t = 0;
    
    // Cleanup Day stuff
    if (instance_exists(oGameController)) oGameController.queue = [];
    with (oHomeless) { targetX = -50; targetY = room_height / 2; }
}

// B. END OF NIGHT -> START NEW DAY (Hard Cut)
else if (global.phase == global.P_NIGHT && global.phase_t >= night_len) {
    
    global.phase = global.P_DAY; 
    global.phase_t = 0;
    
    global.day += 1;          
    global.game_min = 8 * 60; 
}