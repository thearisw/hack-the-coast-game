function scr_globals_init() {
    // --- BED VARIABLES ---
    global.beds_occupied = 0;      
    global.bed_capacity = 10;       
    global.bed_policy = "Strict";
    
    // --- FOOD VARIABLES ---
    global.food_rations = 50;
    global.food_daily_cost = 10;
    global.food_policy = "Normal";

    // --- STAFF VARIABLES ---
    global.staff_count = 3;
    global.staff_fatigue = 0;     // 0% to 100%
    global.staff_policy = "Balanced";
    
    // --- INTAKE VARIABLES (NEW) ---
    // Since we choose manually, we just need to know the crowd size
    global.refugees_waiting = 12;  // People waiting for YOUR decision
    global.projected_risk = 15;    // Estimated infection risk of the crowd (%)
}