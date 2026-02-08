if(x > targetX+3) {
	hs = -1;
}
if(x < targetX+3) {
	hs = 1;
}
if(y > targetY+3) {
	hs = -1;
}
if(y < targetY+3) {
	hs = 1;
}

if (place_meeting(x+hs,y,oWall)) {
	while(abs(hs)>0.1) {
		hs*=0.5;
		if(!place_meeting(x+hs,y,oWall)) x+=hs;
	}
	hs=0;
	
}
x+= hs;

if (place_meeting(x,y+vs,oWall)) {
	while(abs(vs)>0.1) {
		vs*=0.5;
		if(!place_meeting(x,y+vs,oWall)) y+=vs;
	}
	vs=0;
}
y+= vs;


if(hs>0) sprite_index = HomelessRightWalk;


if(!trigger) {
	trigger = true;
	var choice = scr_choice_show(
    ["Allow entry", "Turn away"],
    room_width/2,
    room_height-10);
}