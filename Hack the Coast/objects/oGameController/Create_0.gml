scr_globals_init();

bed_list = ds_list_create();
admitted = ds_list_create();

// --- QUEUE SYSTEM ---
queue = [];         

// 1. SERVICE SPOT (The "Sweet Spot")
// X = 208 (To the left of the desk)
// Y = 176 (Vertically centered on the desk)
service_x = 220;      
service_y = 156;    

// 2. SPAWN SPOT (The Door)
spawn_point_x = room_width / 2;     
spawn_point_y = room_height - 24;   

spawn_timer = 0;
spawn_rate = 60; 
max_spawn_per_intake = 8; 
spawn_count = 0;