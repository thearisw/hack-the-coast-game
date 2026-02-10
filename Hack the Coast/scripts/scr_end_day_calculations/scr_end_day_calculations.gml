function scr_end_day_calculations(){
    global.report_events = ""; 
    
    // ===========================
    // 0. DAILY SUPPLY DROP
    // ===========================
    var _aid_amount = 0;
    
    if (global.day <= 3) {
        _aid_amount = 50;
        global.report_events += "Aid Truck Arrived: Full shipment received.\n";
    }
    else if (global.day <= 7) {
        _aid_amount = 25;
        global.report_events += "Aid Truck Arrived: Partial shipment only.\n";
    }
    else {
        _aid_amount = 0;
        global.report_events += "NOTICE: No aid trucks arrived today.\n";
    }
    
    global.food_rations += _aid_amount;
    global.report_food_gained = _aid_amount;
    
    if (global.staff_count <= 0) global.staff_count = 1; 

    // ===========================
    // 1. FOOD CALCULATIONS
    // ===========================
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
    // 2. STAFF WORKLOAD & SCAVENGING
    // ===========================
    var _base_work = 10;
    var _work_per_person = 5; 
    
    // Policy Check
    if (global.staff_policy == "Overwork") {
        _work_per_person = 8;
        var _found = irandom_range(3, 6) * global.staff_count;
        global.food_rations += _found;
        global.report_events += "Staff scavenged +" + string(_found) + " Food.\n";
    } 
    
    // Calculate and apply Fatigue
    var _total_load = _base_work + (_people_count * _work_per_person);
    var _fatigue_gain = round(_total_load / global.staff_count);
    
    global.staff_fatigue += _fatigue_gain;

    // Quitting Check
    if (global.staff_fatigue >= 100) {
        global.staff_count -= 1;   
        global.staff_fatigue = 50; 
        global.unrest += 20;       
        global.report_events += "DISASTER: Staff member quit from exhaustion!\n";
    }

    // ===========================
    // 3. RECOVERY & DEPARTURES
    // ===========================
    
    // Nightly Recovery
    global.staff_fatigue -= 20;
    if (global.staff_fatigue < 0) global.staff_fatigue = 0;

    // Unrest Decay
    if (global.food_rations > 0 && global.staff_fatigue < 80) {
        global.unrest -= 5;
        if (global.unrest < 0) global.unrest = 0;
    }

    // Morning Departures (The Wellness Check)
    var _base_departure = ceil(global.beds_occupied * 0.10);
    var _wellness_mod = 0;

    if (global.unrest > 70) {
        _wellness_mod = ceil(global.beds_occupied * 0.20);
        global.report_events += "Low Wellness: Residents fled the shelter.\n";
    } 
    else if (global.unrest < 15) {
        _wellness_mod = -ceil(_base_departure * 0.5);
        global.report_events += "High Wellness: Residents feel safe and stayed.\n";
    }

    var _total_leaving = clamp(_base_departure + _wellness_mod, 0, global.beds_occupied);
    global.beds_occupied -= _total_leaving;

    if (_total_leaving > 0) {
        global.report_events += string(_total_leaving) + " people left this morning.\n";
    }
}