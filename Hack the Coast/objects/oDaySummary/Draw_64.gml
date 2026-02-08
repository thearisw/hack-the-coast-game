// --- SETUP FONTS & ALIGNMENT ---
draw_set_font(Dialogue_Text); // Or whatever font you use
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// --- 1. DRAW BACKGROUND (SEMI-TRANSPARENT) ---
// Alpha 0.8 allows the player to see the game world getting brighter/darker behind the menu
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(x - width/2, y - height/2, x + width/2, y + height/2, false);
draw_set_alpha(1.0);

// --- 2. DRAW HEADER ---
draw_set_color(c_white);
draw_text(x, y - 140, "--- DAY " + string(global.day) + " REPORT ---");

// --- 3. DRAW STATISTICS ---
var _left = x - 120;
var _right = x + 120;
var _start_y = y - 90;
var _sep = 30; // Spacing between lines

draw_set_halign(fa_left); // Labels on Left
draw_set_color(c_ltgray);

draw_text(_left, _start_y, "Refugees Sheltered:");
draw_text(_left, _start_y + _sep, "Food Rations:");
draw_text(_left, _start_y + (_sep*2), "Staff Fatigue:");
draw_text(_left, _start_y + (_sep*3), "Unrest Level:");

draw_set_halign(fa_right); // Numbers on Right

// -- SHELTERED COUNT --
draw_set_color(c_white);
draw_text(_right, _start_y, string(global.beds_occupied) + "/" + string(global.bed_capacity));

// -- FOOD (WITH NET CHANGE) --
// Logic: Green if we gained food, Red if we lost food
var _net_food = global.report_food_gained - global.report_food_lost;
var _food_col = (_net_food >= 0) ? c_lime : c_red;
var _sign = (_net_food >= 0) ? "+" : ""; // Add a plus sign if positive

draw_set_color(_food_col);
// Display: "85 (-15)"
draw_text(_right, _start_y + _sep, string(global.food_rations) + " (" + _sign + string(_net_food) + ")");

// -- FATIGUE --
// Logic: Red if critical (>80%), otherwise White
var _fat_col = (global.staff_fatigue > 80) ? c_red : c_white;
draw_set_color(_fat_col);
draw_text(_right, _start_y + (_sep*2), string(global.staff_fatigue) + "% (+" + string(global.report_fatigue_gained) + ")");

// -- UNREST --
var _unrest_col = (global.unrest > 50) ? c_orange : c_white;
if (global.unrest > 80) _unrest_col = c_red;
draw_set_color(_unrest_col);
draw_text(_right, _start_y + (_sep*3), string(global.unrest) + "%");


// --- 4. DRAW EVENTS LOG (THE STORY) ---
draw_set_halign(fa_center);
draw_set_color(c_yellow);
// Draws the text collected during calculations (e.g. "Staff Quit!", "Aid Arrived")
draw_text_ext(x, y + 60, global.report_events, 20, width - 40);


// --- 5. DRAW TIMER BAR (URGENCY) ---
// This bar visually shows the 8 seconds running out
var _bar_w = width - 40;
var _bar_h = 6;
var _bar_x = x - (_bar_w/2);
var _bar_y = y + 140;

// Calculate Percentage (Assuming 8 second night)
// We access the timer from Global_Time. 
// If your night_len is different, change the '8' below.
var _pct = 1 - (global.phase_t / 8); 
_pct = clamp(_pct, 0, 1);

// Draw Backing
draw_set_color(c_dkgray);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, false);

// Draw Progress
// Bar turns Red when time is low (< 25%)
var _bar_col = (_pct < 0.25) ? c_red : c_white;
draw_set_color(_bar_col);
draw_rectangle(_bar_x, _bar_y, _bar_x + (_bar_w * _pct), _bar_y + _bar_h, false);

// Optional Text below bar
draw_set_color(c_gray);
draw_set_font(-1); // Tiny default font for instructions
draw_text(x, _bar_y + 12, "[SPACE] Close Report");