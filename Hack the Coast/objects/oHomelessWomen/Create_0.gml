event_inherited();

// shared homeless state
npc_kind = "homeless_woman";

hs = 0;
vs = 0;

accepted = false;
trigger = false;
choice = false;

timer = 0;
entranceDial = false;
entranceChoice = false;

// sprite set: woman
spr_front_idle = WomenFrontIdle;
spr_back_idle  = WomenBackIdle;
spr_left_idle  = WomenLeftIdle;
spr_right_idle = WomenRightIdle;

spr_front_walk = WomenFrontWalk;
spr_back_walk  = WomenBackWalk;
spr_left_walk  = WomenLeftWalk;
spr_right_walk = WomenRightWalk;

sprite_index = spr_front_idle;
