// 1. Safety Check: Ensure the global variable exists
if (!variable_global_exists("beds_occupied")) exit;

// 2. Count accepted refugees
var _count = 0;

// 'with' automatically includes children like oHomelessChild and oHomelessElder
with (oHomeless) {
    if (accepted) {
        _count += 1;
    }
}

// 3. Update the global variable
global.beds_occupied = _count

if(global.bed_policy=="overcrowded") global.staff_fatigue+=1;