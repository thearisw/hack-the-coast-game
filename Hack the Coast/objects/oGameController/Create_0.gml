scr_globals_init();

bed_list = ds_list_create();
admitted = ds_list_create();

hide_x = -10000;
hide_y = -10000;

// how many IN-GAME minutes into NIGHT until people disappear
night_hide_delay_min = 30;   // change this (ex: 10, 30, 60)
night_start_min = 0;
night_hiding_done = false;
