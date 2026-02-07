if (place_meeting(x+hs,y,oWall)) {
	while(abs(hs)>0.1) {
		hs*=0.5;
		if(!place_meeting(x+hs,y,oWall)) x+=hs;
	}
	hs=0;
	
}
x+=hs;
if(hs!=0) facing=sign(hs);
//image_xscale=facing;
isFloored =(place_meeting(x,y+2,oWall))
if(isFloored) {
	canDash=true;
	
}
if (place_meeting(x,y+vs,oWall)) {
	while(abs(vs)>0.1) {
		vs*=0.5;
		if(!place_meeting(x,y+vs,oWall)) y+=vs;
	}
	vs=0;
}