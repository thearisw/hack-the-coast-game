// bed system
assigned_bed = noone;
hidden = false;

// movement/anim state
facing = "front"; // "back","left","right"
moving = false;

// sprite set (your homeless set)
spr_front_idle = HomelessFrontIdle;
spr_back_idle  = HomelessBackIdle;
spr_left_idle  = HomelessLeftIdle;
spr_right_idle = HomelessRightIdle;

spr_front_walk = HomelessWalkFront;
spr_back_walk  = HomelessWalkBack;
spr_left_walk  = HomelessWalkLeft;
spr_right_walk = HomelessWalkRight;

// start sprite
sprite_index = spr_front_idle;
image_speed = 0.2;
