// 1. SETUP FONT & COLOR
draw_set_font(Clock_Font);
draw_set_color(c_white);

// --- TIME CALCULATION ---
var gm = floor(global.game_min);
gm = (gm div 30) * 30;
var h = (gm div 60) mod 24;
var m = gm mod 60;
function two(n) { return (n < 10) ? "0" + string(n) : string(n); }

var _txt = "Day " +string(global.day)+" - "+two(h) + ":" + two(m);

// --- POSITIONING & MEASURING ---
var _gui_w = display_get_gui_width();
var _center_x = _gui_w / 2;
var _top_y = 10; // Distance from top of screen
var _padding = 4; // Extra black space around the numbers

// Calculate how big the text is
var _w = string_width(_txt);
var _h = string_height(_txt);

// --- DRAW BACKGROUND ---
draw_set_color(c_black);
draw_set_alpha(0.7); // 70% opacity

// Draw rectangle centered on the text
draw_rectangle(
    _center_x - (_w / 2) - _padding-70, // Left
    _top_y - _padding,               // Top
    _center_x + (_w / 2) + _padding+70, // Right
    _top_y + _h + _padding,          // Bottom
    false // "false" means fill the rectangle (not outline)
);

// --- RESET & DRAW TEXT ---
draw_set_alpha(1.0); // Reset alpha so text isn't see-through
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(_center_x, _top_y, _txt + " - "+ get_phase_name());

// --- CLEANUP ---
draw_set_halign(fa_left); // Always reset alignment to be safe!