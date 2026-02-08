/// Draw GUI (or Draw) event

draw_set_font(clock_font);
draw_set_color(c_white);

var total = floor(time_s);

var s = total mod 60;
var m = (total div 60) mod 60;
var h = (total div 3600) mod 24;

function two(n) { return (n < 10) ? "0" + string(n) : string(n); }

draw_text(16, 16, two(h) + ":" + two(m) + ":" + two(s));
