// 1. SET FONT FIRST (So we calculate size correctly)
draw_set_font(Dialogue_Text); // Use your new small font
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);  // Draw growing UPWARDS from the bottom

// 2. POSITIONING (Bottom Middle of Screen)
var _x = display_get_gui_width() / 2;
var _y = display_get_gui_height() - 10; // 20px padding from the very bottom

// 3. CALCULATE BOX SIZE
var _padding = 8; // Tighter padding
var _w = string_width(text) + (_padding * 2);
var _h = string_height(text) + (_padding * 2);

// 4. DRAW BACKGROUND
draw_set_color(c_black);
draw_set_alpha(0.7);

// We draw the rectangle based on the text size, positioned above the _y point
draw_rectangle(
    _x - _w/2,       // Left
    _y - _h,         // Top
    _x + _w/2,       // Right
    _y,              // Bottom
    false
);

draw_set_alpha(1.0); // Reset alpha

// 5. DRAW TEXT
draw_set_color(c_white);
// Draw text at _x, and shift _y up by padding so it sits inside the box
draw_text(_x, _y - _padding, text);