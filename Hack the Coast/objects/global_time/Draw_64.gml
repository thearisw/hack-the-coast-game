// 1. SETUP FONT & COLOR
draw_set_font(Clock_Font);
draw_set_color(c_white);

// --- TIME CALCULATION (SNAPPED TO 30 MINS) ---
// 1. Get current minutes
var _raw_min = floor(global.game_min);

// 2. Snap it to the nearest 30
var _snapped_min = floor(_raw_min / 30) * 30;

// 3. Convert to Hours and Minutes
var h = (_snapped_min div 60);
var m = _snapped_min mod 60;

// Helper to make "0" look like "00"
function two(n) { return (n < 10) ? "0" + string(n) : string(n); }

// --- PHASE TEXT ---
var _phase_label = "";
if (global.phase == global.P_DAY)   _phase_label = "(DAY)";
if (global.phase == global.P_NIGHT) _phase_label = "(NIGHT)";

// Combine it all: "Day 1 - 08:30 (DAY)"
var _txt = "Day " + string(global.day) + " - " + two(h) + ":" + two(m) + " " + _phase_label;

// --- POSITIONING ---
var _gui_w = display_get_gui_width();
var _center_x = _gui_w / 2;
var _top_y = 10; 
var _padding = 6; 

// Calculate text size
var _w = string_width(_txt);
var _h = string_height(_txt);

// --- DRAW BACKGROUND ---
draw_set_color(c_black);
draw_set_alpha(0.7); 

draw_rectangle(
    _center_x - (_w / 2) - _padding - 20, 
    _top_y - _padding,                
    _center_x + (_w / 2) + _padding + 20, 
    _top_y + _h + _padding,           
    false 
);

// --- DRAW TEXT ---
draw_set_alpha(1.0); 
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(_center_x, _top_y, _txt);

// --- CLEANUP ---
draw_set_halign(fa_left);