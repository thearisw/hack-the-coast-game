event_inherited();

// shared homeless state
npc_kind = "homeless_elder";

hs = 0;
vs = 0;

accepted = false;
trigger = false;
choice = false;

timer = 0;
entranceDial = false;
entranceChoice = false;

// sprite set: elder
spr_front_idle = ElderFrontIdle;
spr_back_idle  = ElderBackIdle;
spr_left_idle  = ElderLeftIdle;
spr_right_idle = ElderRightElder; // your asset name

spr_front_walk = ElderFrontWalk;
spr_back_walk  = ElderBackWalk;
spr_left_walk  = ElderLeftWalk;
spr_right_walk = ElderRightWalk;

sprite_index = spr_front_idle;
