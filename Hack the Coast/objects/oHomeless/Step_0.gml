// stop everything if hidden
if (hidden) { visible = false; exit; }
visible = true;

// -------------------------
// helpers: ensure wander vars exist
// -------------------------
if (!variable_instance_exists(id, "home_x")) home_x = room_width/2;
if (!variable_instance_exists(id, "home_y")) home_y = room_height/2;
if (!variable_instance_exists(id, "wander_radius")) wander_radius = 60;
if (!variable_instance_exists(id, "wander_timer")) wander_timer = irandom_range(30, 90);

// function-like block: choose a new wander target
var do_wander = function() {

    if (wander_timer <= 0) {
        targetX = home_x + irandom_range(-wander_radius, wander_radius);
        targetY = home_y + irandom_range(-wander_radius, wander_radius);
        wander_timer = irandom_range(30, 90);
    }
};
wander_timer--;
// -------------------------
// PHASE BEHAVIOR: target selection
// -------------------------
if (global.phase == global.P_NIGHT) {

    // go to bed ONLY at night
    if ( instance_exists(oBed)) {
		var close_bed = instance_nearest(x,y,oBed)
        var bx = close_bed.x;
        var by = close_bed.y;

            targetX = close_bed.x;
            targetY = close_bed.y;

    } else {
        // No bed assigned? Don't freeze—wander instead
        do_wander();
    }

}
if ( global.phase == global.P_DAY){
    // DAY / INTAKE: wander around (loiter)
    do_wander();
}

// -------------------------
// MOVE TOWARD targetX/targetY
// -------------------------
if (x > targetX + 3) hs = -1;
else if (x < targetX - 3) hs = 1;
else hs = 0;

if (y > targetY + 3) vs = -1;
else if (y < targetY - 3) vs = 1;
else vs = 0;

// -------------------------
// WALL COLLISION (your logic)
// -------------------------
if (place_meeting(x + hs, y, oWall)) {
    while (abs(hs) > 0.1) {
        hs *= 0.5;
        if (!place_meeting(x + hs, y, oWall)) x += hs;
    }
    hs = 0;
}
x += hs;

if (place_meeting(x, y + vs, oWall)) {
    while (abs(vs) > 0.1) {
        vs *= 0.5;
        if (!place_meeting(x, y + vs, oWall)) y += vs;
    }
    vs = 0;
}
y += vs;

// -------------------------
// accept/destroy logic
// -------------------------
if (choice && accepted) accepted = true;
else if (choice && !accepted) instance_destroy();

timer++;

// IMPORTANT: run parent Step so sprite switching works
event_inherited();
