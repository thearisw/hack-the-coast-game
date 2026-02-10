// Hide logic (night storage)
if (hidden) {
    visible = false;
    exit;
}
visible = true;

// Requires hs/vs to exist in children
moving = (hs != 0) || (vs != 0);

// Update facing based on motion
if (abs(hs) > abs(vs)) {
    facing = (hs > 0) ? "right" : "left";
} else if (vs != 0) {
    facing = (vs > 0) ? "front" : "back";
}

// Pick sprite
var s = sprite_index;

if (moving) {
    if (facing == "front" && spr_front_walk != noone) s = spr_front_walk;
    if (facing == "back"  && spr_back_walk  != noone) s = spr_back_walk;
    if (facing == "left"  && spr_left_walk  != noone) s = spr_left_walk;
    if (facing == "right" && spr_right_walk != noone) s = spr_right_walk;
} else {
    if (facing == "front" && spr_front_idle != noone) s = spr_front_idle;
    if (facing == "back"  && spr_back_idle  != noone) s = spr_back_idle;
    if (facing == "left"  && spr_left_idle  != noone) s = spr_left_idle;
    if (facing == "right" && spr_right_idle != noone) s = spr_right_idle;
}

if (sprite_index != s) sprite_index = s;
