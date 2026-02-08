// 1. SETUP
draw_set_font(Dialogue_Text);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

// --- NEW SETTING: LINE SPACING ---
// This is the distance in pixels between lines. 
// If your font size is 8, try 12 or 14. Larger number = more space.
var _sep = 12; 
// ---------------------------------

// 2. POSITIONING
var _x = x
var _y = y

// 3. CALCULATE BOX SIZE
var _padding = 8;
var _w = string_width(text) + (_padding * 2);

// CHANGE 1: Use string_height_ext to calculate height with the new spacing
var _h = string_height_ext(text, _sep, -1) + (_padding * 2);

// 4. DRAW BACKGROUND
draw_set_color(c_black);
draw_set_alpha(0.3);

draw_rectangle(
    _x - _w/2, 
    _y - _h, 
    _x + _w/2, 
    _y, 
    false
);

draw_set_alpha(1.0);

// 5. DRAW TEXT
draw_set_color(c_white);

// CHANGE 2: Use draw_text_ext to apply the spacing
// The "-1" means "don't wrap width" (since we use \n manually)
draw_text_ext(_x, _y - _padding, text, _sep, -1);