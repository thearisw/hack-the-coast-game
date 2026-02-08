var shown_text = string_copy(text, 1, char_index);

var text_w = string_width(shown_text);
var text_h = string_height(shown_text);

var bw = max(bubble_width, text_w + padding * 2);
var bh = text_h + padding * 2;

var bx = x - bw / 2;
var by = y - bh - 16;

// Bubble
draw_set_color(c_white);
draw_rectangle(bx, by, bx + bw, by + bh, false);

// Text
draw_set_color(c_black);
draw_text(bx + padding, by + padding, shown_text);
