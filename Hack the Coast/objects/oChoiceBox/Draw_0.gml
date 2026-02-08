draw_set_font(Clock_Font);

var box_height = array_length(options) * line_height + padding * 2;

var bx = x - box_width / 2;
var by = y - box_height / 2;

// Box
draw_set_color(c_white);
draw_rectangle(bx, by, bx + box_width, by + box_height, false);

// Options
for (var i = 0; i < array_length(options); i++) {
    var tx = bx + padding;
    var ty = by + padding + i * line_height;

    if (i == selected) {
        draw_set_color(c_gray);
        draw_rectangle(tx - 4, ty - 2, bx + box_width - padding, ty + line_height - 2, false);
    }

    draw_set_color(c_black);
    draw_text(tx, ty, options[i]);
}

if (confirmed) {
    
    // destroy THIS choice box
    instance_destroy();
}

