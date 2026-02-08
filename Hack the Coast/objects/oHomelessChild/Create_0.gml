event_inherited();

// shared homeless state
npc_kind = "homeless_child";

hs = 0;
vs = 0;

accepted = false;
trigger = false;
choice = false;

timer = 0;
entranceDial = false;
entranceChoice = false;

// sprite set: child
spr_front_idle = ChildFrontIdle;
spr_back_idle  = ChildBackIdle;
spr_left_idle  = ChildLeftIdle;
spr_right_idle = ChildRightIdle;

spr_front_walk = ChildFrontWalk;
spr_back_walk  = ChildBackWalk;
spr_left_walk  = ChildLeftWalk;
spr_right_walk = ChildRightWalk;

sprite_index = spr_front_idle;
