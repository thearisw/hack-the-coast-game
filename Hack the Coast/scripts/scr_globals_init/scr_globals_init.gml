function scr_globals_init() {
    // --- TIME & PROGRESS ---
    global.day = 1;

    // --- RESOURCES ---
    global.food_rations = 50;     
    global.food_daily_cost = 10;   // <--- ADD THIS LINE (Fixes the crash!)
    global.unrest = 0;            
    
    // --- STAFF ---
    global.staff_count = 3;       
    global.staff_fatigue = 0;     
    
    // --- SHELTER STATUS ---
    global.beds_occupied = 0;
    global.bed_capacity = 10;     
    global.bed_policy = "Strict"; 
    
    // --- POLICIES ---
    global.staff_policy = "Balanced"; 
    global.food_policy = "Normal";    
    
    // --- REPORTING VARIABLES (The "Database" for oDaySummary) ---
    global.report_events = "";
    global.report_workload_level = "Normal";
    global.report_food_gained = 0;
    global.report_food_lost = 0;
    global.report_fatigue_gained = 0;
}