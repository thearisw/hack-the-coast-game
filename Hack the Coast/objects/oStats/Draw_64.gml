if(!variable_global_exists("phase") ) exit;
// Draw GUI Event
show_debug_message("A");
var margin = 10;
var ui_width = 160;
var ui_height = 80;

// 1. Draw a semi-transparent background box (Darker theme)
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(margin, margin, margin + ui_width, margin + ui_height, false);
draw_set_alpha(1.0);

// 2. Draw an outline (using a lighter grey or a zone-specific color)
draw_set_color(c_dkgray);
draw_rectangle(margin, margin, margin + ui_width, margin + ui_height, true);
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
var money_string = string(global.money);

// 5. Draw the Stats
var draw_x = margin + 8;
var draw_y = margin + 8;
var line_height = 18;

draw_text(room_width/2, room_height/2, "Money: " + money_string);

// Optional: Resource bar for Staff satisfaction
var bar_width = 100;
var bar_height = 8;
var satisfaction = (global.satisfaction / 100);
draw_set_color(c_red);
draw_rectangle(draw_x, draw_y + (line_height * 3.5), draw_x + (bar_width * satisfaction), draw_y + (line_height * 3.5) + bar_height, false);