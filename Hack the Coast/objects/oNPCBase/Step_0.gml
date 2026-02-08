if (hidden) {
    visible = false;
    exit;
} else {
    visible = true;
}

var s;

if (moving) {
    if (facing == "front") s = spr_front_walk;
    if (facing == "back")  s = spr_back_walk;
    if (facing == "left")  s = spr_left_walk;
    if (facing == "right") s = spr_right_walk;
} else {
    if (facing == "front") s = spr_front_idle;
    if (facing == "back")  s = spr_back_idle;
    if (facing == "left")  s = spr_left_idle;
    if (facing == "right") s = spr_right_idle;
}

if (sprite_index != s) sprite_index = s;

// bed system
assigned_bed = noone;
hidden = false;

// direction + animation state
facing = "front";
moving = false;

// IMPORTANT: map these to your exact sprite asset names
spr_front_idle = HomelessFrontIdle;
spr_back_idle  = HomelessBackIdle;
spr_left_idle  = HomelessLeftIdle;
spr_right_idle = HomelessRightIdle;

spr_front_walk = HomelessWalkFront;
spr_back_walk  = HomelessWalkBack;
spr_left_walk  = HomelessWalkLeft;
spr_right_walk = HomelessWalkRight;

sprite_index = spr_front_idle;
image_speed = 0.2;


// hide for night
if (hidden) {
    visible = false;
    exit;
} else {
    visible = true;
}

// If you already set hs/vs somewhere, use that:
moving = (hs != 0) || (vs != 0);

// Decide facing based on motion
if (abs(hs) > abs(vs)) {
    facing = (hs > 0) ? "right" : "left";
} else if (vs != 0) {
    facing = (vs > 0) ? "front" : "back";
}

// Choose sprite
var s;

if (moving) {
    if (facing == "front") s = spr_front_walk;
    if (facing == "back")  s = spr_back_walk;
    if (facing == "left")  s = spr_left_walk;
    if (facing == "right") s = spr_right_walk;
} else {
    if (facing == "front") s = spr_front_idle;
    if (facing == "back")  s = spr_back_idle;
    if (facing == "left")  s = spr_left_idle;
    if (facing == "right") s = spr_right_idle;
}

if (sprite_index != s) sprite_index = s;

