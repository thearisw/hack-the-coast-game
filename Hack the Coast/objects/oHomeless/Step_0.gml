// 1. RUN PARENT LOGIC FIRST (So we can override it later)
event_inherited();

// stop everything if hidden (Night Hiding Override)
if (hidden) { visible = false; exit; }

// -------------------------
// QUEUE LOGIC (Before Acceptance)
// -------------------------
if (!accepted && instance_exists(oGameController)) {
    
    // DEFAULT TO INVISIBLE
    visible = false; 
    
    var my_pos = -1;
    var _q = oGameController.queue;
    
    // Find my index in the controller's queue
    for (var i = 0; i < array_length(_q); i++) {
        if (_q[i] == id) { my_pos = i; break; }
    }

    if (my_pos == 0) {
        // I AM FIRST IN LINE -> REVEAL MYSELF
        visible = true; 
        
        // Walk to the Service Spot (In front of desk)
        targetX = oGameController.service_x;
        targetY = oGameController.service_y;
    } 
    else {
        // I AM WAITING -> FORCE INVISIBLE & PIN TO DOOR
        visible = false; 
        
        x = oGameController.spawn_point_x;
        y = oGameController.spawn_point_y;
        targetX = x;
        targetY = y;
    }
}

// -------------------------
// ACCEPTED LOGIC (After Decision)
// -------------------------
else if (accepted) {
    visible = true;
    
    // NIGHT BEHAVIOR
    if (global.phase == global.P_NIGHT) {
         if (instance_exists(oBed)) {
            var close_bed = instance_nearest(x,y,oBed);
            targetX = close_bed.x;
            targetY = close_bed.y;
            
            if (point_distance(x, y, targetX, targetY) < 4) {
                targetX = x; targetY = y; 
            }
         }
    } 
    // DAY BEHAVIOR
    else {
        // Move fully into the room so we don't block the next guy
        if (!variable_instance_exists(id, "has_moved_in")) {
             home_x = room_width / 2;
             home_y = 100; 
             has_moved_in = true;
        }
        
        if (!variable_instance_exists(id, "wander_timer")) wander_timer = 60;
        
        wander_timer--;
        if (wander_timer <= 0) {
            targetX = home_x + irandom_range(-60, 60);
            targetY = home_y + irandom_range(-60, 60);
            wander_timer = irandom_range(60, 120);
        }
    }
}

// -------------------------
// MOVEMENT PHYSICS
// -------------------------
if (x > targetX + 3) hs = -1;
else if (x < targetX - 3) hs = 1;
else hs = 0;

if (y > targetY + 3) vs = -1;
else if (y < targetY - 3) vs = 1;
else vs = 0;

// Wall Collision X
if (place_meeting(x + hs, y, oWall)) {
    while (abs(hs) > 0.1) {
        hs *= 0.5;
        if (!place_meeting(x + hs, y, oWall)) x += hs;
    }
    hs = 0;
}
x += hs;

// Wall Collision Y
if (place_meeting(x, y + vs, oWall)) {
    while (abs(vs) > 0.1) {
        vs *= 0.5;
        if (!place_meeting(x, y + vs, oWall)) y += vs;
    }
    vs = 0;
}
y += vs;