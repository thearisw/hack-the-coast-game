event_inherited();

// shared homeless state
npc_kind = "homeless_wheel";

hs = 0;
vs = 0;

accepted = false;
trigger = false;
choice = false;

timer = 0;
entranceDial = false;
entranceChoice = false;

// sprite set: wheelchair
spr_front_idle = WheelFrontIdle;
spr_back_idle  = WheelBackIdle;
spr_left_idle  = WheelLeftIdle;
spr_right_idle = WheelRightIdle;

spr_front_walk = WheelFrontWalk;
spr_back_walk  = WheelBackWalk;
spr_left_walk  = WheelLeftWalk;
spr_right_walk = WheelRightWalk;

sprite_index = spr_front_idle;
