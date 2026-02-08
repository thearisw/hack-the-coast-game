function scr_globals_init(){
	// --- BED SYSTEM GLOBALS ---
	global.bed_capacity = 10;      // Starts at 10
	global.beds_occupied = 5;      // Example starting number
	global.bed_policy = "Strict";  // Can be "Strict" or "Overcrowd"
}