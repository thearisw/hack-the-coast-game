scr_globals_init();

bed_list = ds_list_create();
admitted = ds_list_create();

hide_x = -10000;
hide_y = -10000;

// how many IN-GAME minutes into NIGHT until people disappear
night_hide_delay_min = 30;   // change this (ex: 10, 30, 60)
night_start_min = 0;
night_hiding_done = false;


spawn_timer = 0;
spawn_rate = 15 * 30; // Spawn someone every 15 seconds)
max_spawn_per_intake = 8; // Limit how many show up each morning
spawn_count = 0;