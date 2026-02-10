// 1. SETUP
draw_set_font(Dialogue_Text); // Use your pixel font
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

// 2. POSITIONING
var _x = display_get_gui_width() / 2;
var _y = display_get_gui_height() - 40; // 40px from bottom (above dialogue)

// 3. MEASURE BOX SIZE
var _count = array_length(options);
var _box_h = (_count * line_height) + (padding * 2);

// Find the widest option so the box fits
var _box_w = 0;
for (var i = 0; i < _count; i++) {
    var _w = string_width(options[i]);
    if (_w > _box_w) _box_w = _w;
}
_box_w += (padding * 4); // Add extra width for the ">" arrow

// 4. DRAW BACKGROUND (Semi-transparent Black)
draw_set_color(c_black);
draw_set_alpha(0.4);

draw_rectangle(
    _x - _box_w/2, 
    _y - _box_h, 
    _x + _box_w/2, 
    _y, 
    false
);

draw_set_alpha(1.0); // Reset alpha

// 5. DRAW OPTIONS
draw_set_valign(fa_top); // Switch to top alignment for the list loop

// Where does the first line start? (Top of the black box + padding)
var _start_y = (_y - _box_h) + padding;

for (var i = 0; i < _count; i++) {
    var _print_text = options[i];
    
    // Highlight the selected option
    if (i == selected) {
        draw_set_color(c_yellow); // Selected color
        _print_text = "> " + _print_text + " <"; // Add arrows
    } else {
        draw_set_color(c_white);  // Unselected color
    }
    
    // Draw the text
    draw_text(_x, _start_y + (i * line_height), _print_text);
}

// Cleanup
draw_set_halign(fa_left);
draw_set_color(c_white);