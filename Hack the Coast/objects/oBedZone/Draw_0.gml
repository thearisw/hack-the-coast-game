// oZone: Draw (debug)
if (!debug_draw) exit;

// Color by zone type
var col = c_red;
switch (zone_type) {
    case "intake":   col = c_yellow;  break;
    case "beds":     col = c_aqua;    break;
    case "supplies": col = c_lime;    break;
    case "staff":    col = c_fuchsia; break;
    default:         col = c_red;     break;
}

// Tile-based size -> pixels
var g  = grid;
var w  = zone_w_tiles * g;  // 2 * 16 = 32
var h  = zone_h_tiles * g;  // 5 * 16 = 80

// Centered bounds
var l = x - w * 0.5;
var r = x + w * 0.5;
var t = y - h * 0.5;
var b = y + h * 0.5;

// Draw zone box
draw_set_alpha(0.30);
draw_set_color(col);
draw_rectangle(l, t, r, b, false);
draw_set_alpha(1);