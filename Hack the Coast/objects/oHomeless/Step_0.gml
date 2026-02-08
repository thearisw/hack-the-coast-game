// stop everything if hidden
if (hidden) { visible = false; exit; }
visible = true;

// -------------------------
// PHASE BEHAVIOR: target selection
// -------------------------
if (global.phase == global.P_NIGHT) {
    // go to bed target ONLY at night
    if (assigned_bed != noone && instance_exists(assigned_bed)) {
        targetX = assigned_bed.x + assigned_bed.wake_dx;
        targetY = assigned_bed.y + assigned_bed.wake_dy;
    }
} else {
    // DAY / INTAKE: wander around (loiter)

    // safety if these weren't initialized
    if (!variable_instance_exists(id, "home_x")) home_x = x;
    if (!variable_instance_exists(id, "home_y")) home_y = y;
    if (!variable_instance_exists(id, "wander_radius")) wander_radius = 64;
    if (!variable_instance_exists(id, "wander_timer")) wander_timer = irandom_range(30, 90);

    wander_timer--;

    if (wander_timer <= 0) {
        targetX = home_x + irandom_range(-wander_radius, wander_radius);
        targetY = home_y + irandom_range(-wander_radius, wander_radius);

        wander_timer = irandom_range(30, 90);
    }
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
// REMOVE manual sprite override
// (let oNPCBase Step pick walk/idle sprites based on hs/vs)
// -------------------------

// Your accept/destroy logic stays
if (choice && accepted) accepted = true;
else if (choice && !accepted) instance_destroy();

timer++;

// IMPORTANT: run parent Step so sprite switching works
event_inherited();
