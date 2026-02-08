event_inherited();
targetX=100;
targetY=100;
// shared homeless state

parentid = self;
npc_kind = "homeless";

hs = 0;
vs = 0;

accepted = false;
trigger = false;
choice = false;

timer = 0;
entranceDial = false;
entranceChoice = false;

// sprite set: adult
spr_front_idle = HomelessFrontIdle;
spr_back_idle  = HomelessBackIdle;
spr_left_idle  = HomelessLeftIdle;
spr_right_idle = HomelessRightIdle;

spr_front_walk = HomelessWalkFront;
spr_back_walk  = HomelessWalkBack;
spr_left_walk  = HomelessWalkLeft;
spr_right_walk = HomelessRightWalk;

sprite_index = spr_front_idle;
