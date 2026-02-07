/// obj_clock : Draw GUI

draw_set_font(fnt_digital);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// format time as HH:MM:SS from time_s
var total = floor(time_s);

var s = total mod 60;
var m = (total div 60) mod 60;
var h = (total div 3600) mod 24;

// two-digit helper
var ss = string_format(s, 2, 0);
var mm = string_format(m, 2, 0);
var hh = string_format(h, 2, 0);

draw_text(16, 16, hh + ":" + mm + ":" + ss);
