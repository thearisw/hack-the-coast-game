if (!debug_draw) exit;

var col = c_red;
switch (zone_type) {
    case "intake":   col = c_yellow; break;
    case "beds":     col = c_aqua;   break;
    case "supplies": col = c_lime;   break;
    case "staff":    col = c_fuchsia;break;
    default:         col = c_red;    break;
}

draw_set_alpha(0.30);
draw_set_color(col);

draw_rectangle(
    x - zone_w*0.5, y - zone_h*0.5,
    x + zone_w*0.5, y + zone_h*0.5,
    false
);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text(x - zone_w*0.5 + 4, y - zone_h*0.5 + 4, string_upper(zone_type));
