if(!variable_global_exists("phase") ) exit;

// Draw GUI Event
show_debug_message("A");
var margin = 10;
var ui_width = 160;
var ui_height = 40;

// 1. Draw a semi-transparent background box (Darker theme)
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(margin, room_height-40, margin + ui_width, room_height - 40 + ui_height, false);
draw_set_alpha(1.0);

// 2. Draw an outline (using a lighter grey or a zone-specific color)
draw_set_color(c_dkgray);
draw_rectangle(margin, room_height-40, margin + ui_width, room_height - 40 + ui_height, true);
if(!variable_global_exists("phase")) exit;
// 3. Set text properties
draw_set_font(Clock_Font); // Ensure you have a pixel font created
draw_set_halign(fa_left);
draw_set_color(c_white);

// 4. Calculate Display Time (HH:MM format)
var total_hours = (global.game_min div 60);
var display_hours = total_hours mod 24;
var display_mins = floor(global.game_min mod 60);

// Simple padding for minutes (adds a '0' if less than 10)
var min_pad = (display_mins < 10) ? "0" : "";
var staff_string = string(global.staff_count);

// 5. Draw the Stats
draw_set_font(Clock_Font); // Ensure you have a pixel font created
var draw_x = margin + 8;
var draw_y = room_height - 30;
var line_height = 10;

draw_text(draw_x, draw_y, "Staff: " + staff_string);

// Optional: Resource bar for Food
var bar_width = 100;
var bar_height = 8;
var food_pct = (global.food_rations / 100);
draw_set_font(Clock_Font); // Ensure you have a pixel font created
draw_text(draw_x, draw_y+line_height, "Food:");
draw_set_color(c_red);

draw_rectangle(draw_x+70, draw_y + (line_height), draw_x + 70 +(bar_width * food_pct), draw_y + (line_height) + bar_height, false);