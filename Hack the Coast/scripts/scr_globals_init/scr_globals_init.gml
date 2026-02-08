function scr_globals_init(){
	// --- BED SYSTEM GLOBALS ---
	global.bed_capacity = 12;      // Starts at 12
	global.beds_occupied = 5;      // Example starting number
	global.bed_policy = "Strict";  // Can be "Strict" or "Overcrowd"
}