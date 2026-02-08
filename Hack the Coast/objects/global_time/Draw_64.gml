draw_set_font(Clock_Font);
draw_set_color(c_white);

var gm = floor(global.game_min);
gm = (gm div 30) * 30;

var h = (gm div 60) mod 24;
var m = gm mod 60;

function two(n) { return (n < 10) ? "0" + string(n) : string(n); }

var txt = two(h) + ":" + two(m);

// Top-right HUD anchor
var pad = 16;
var gui_w = display_get_gui_width();
draw_text(gui_w - pad - string_width(txt), pad, txt);
