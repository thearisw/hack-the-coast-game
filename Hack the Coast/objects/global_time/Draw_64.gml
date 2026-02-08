draw_set_font(Clock_Font);
draw_set_color(c_white);

var gm = floor(global.game_min);
gm = (gm div 30) * 30;

var h = (gm div 60) mod 24;
var m = gm mod 60;

function two(n) { return (n < 10) ? "0" + string(n) : string(n); }
draw_text(16, 16, two(h) + ":" + two(m));