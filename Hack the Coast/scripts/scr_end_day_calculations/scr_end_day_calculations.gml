function scr_end_day_calculations(){
	global.report_events = ""; 
    
    // ===========================
    // 0. DAILY SUPPLY DROP (The Curve)
    // ===========================
    var _aid_amount = 0;
    
    // THE SCHEDULE
    if (global.day <= 3) {
        _aid_amount = 50; // Abundance
        global.report_events += "Aid Truck Arrived: Full shipment received.\n";
    }
    else if (global.day <= 7) {
        _aid_amount = 25; // Scarcity begins
        global.report_events += "Aid Truck Arrived: Partial shipment only.\n";
    }
    else {
        _aid_amount = 0; // Crisis
        global.report_events += "NOTICE: No aid trucks arrived today.\n";
    }
    
    // Add to our total
    global.food_rations += _aid_amount;
    
    // Store for the Report Screen (so we can show "+50")
    global.report_food_gained = _aid_amount;
    
    // SAFETY: Prevent division by zero if everyone quit
    if (global.staff_count <= 0) global.staff_count = 1; 

    // --- 1. FOOD CALCULATIONS (Unchanged) ---
    var _people_count = global.beds_occupied; 
    var _cost_per_person = (global.food_policy == "Half") ? 5 : 10;
    
    global.report_food_used = _people_count * _cost_per_person;
    global.food_rations -= global.report_food_used;
    
    if (global.food_rations < 0) {
        var _shortage = abs(global.food_rations);
        global.food_rations = 0;
        var _penalty = clamp(_shortage, 5, 25); 
        global.unrest += _penalty;
        global.report_events += "CRITICAL: Food Shortage! (Unrest +" + string(_penalty) + ")\n";
    }

    // ===========================
    // 2. STAFF WORKLOAD (The New Logic)
    // ===========================
    
    var _base_work = 10; // Keeping the lights on takes effort
    var _work_per_person = 5; 
    
    // --- POLICY: OVERWORK ---
    var _scavenge_bonus = 0;
    
    if (global.staff_policy == "Overwork") {
        _work_per_person = 8; // Harder work
        
        // BENEFIT: More staff = More scavenged food
        // Each staff member finds 3-6 cans of food
        var _found_per_staff = irandom_range(3, 6);
        _scavenge_bonus = _found_per_staff * global.staff_count;
        
        global.food_rations += _scavenge_bonus;
        global.report_events += "Staff scavenged +" + string(_scavenge_bonus) + " Food.\n";
    } 
    
    // --- CALCULATE TOTAL LOAD ---
    var _total_shelter_load = _base_work + (_people_count * _work_per_person);
    
    // --- DISTRIBUTE THE LOAD ---
    // The more staff you have, the less tired each one gets!
    var _fatigue_per_staff = _total_shelter_load / global.staff_count;
    
    // Apply the change
    global.report_fatigue_change = round(_fatigue_per_staff); // Round to whole number
    global.staff_fatigue += global.report_fatigue_change;
    
    // --- CONSEQUENCES ---
    if (global.staff_fatigue >= 100) {
        global.staff_count -= 1;   
        global.staff_fatigue = 50; 
        global.unrest += 20;       
        global.report_events += "DISASTER: Staff member quit due to exhaustion!\n";
        
        // Add a visual warning about the "Death Spiral"
        if (global.staff_count > 0) {
             global.report_events += "WARNING: Remaining staff must work harder.\n";
        }
    }

    // --- 3. RECOVERY & UNREST ---
    // Staff recover 20% fatigue each night (Sleep)
    global.staff_fatigue -= 20;
    if (global.staff_fatigue < 0) global.staff_fatigue = 0;

    // Unrest decays if you are doing well
    if (global.food_rations > 0 && global.staff_fatigue < 80) {
        global.unrest -= 5;
        if (global.unrest < 0) global.unrest = 0;
    }
}