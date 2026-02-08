if(x > targetX+3) {
	hs = -1;
}
else if(x < targetX-3) {
	hs = 1;
}
else hs=0;
if(y > targetY+3) {
	vs = -1;
}
else if(y < targetY-3) {
	vs = 1;
}
else vs=0;

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



	choice = scr_choice_show(
    ["Allow entry", "Turn away"],
    room_width/2,
    room_height-10);
if(choice && accepted) accepted =true;
else if(!choice && !accepted) instance_destroy();