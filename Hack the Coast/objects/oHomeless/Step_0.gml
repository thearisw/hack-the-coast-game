// stop everything if hidden
if (hidden) { visible = false; exit; }
visible = true;

// -------------------------
// helpers: ensure wander vars exist
// -------------------------
if (!variable_instance_exists(id, "home_x")) home_x = x;
if (!variable_instance_exists(id, "home_y")) home_y = y;
if (!variable_instance_exists(id, "wander_radius")) wander_radius = 64;
if (!variable_instance_exists(id, "wander_timer")) wander_timer = irandom_range(30, 90);

// function-like block: choose a new wander target
var do_wander = function() {
    wander_timer--;

    if (wander_timer <= 0) {
        targetX = home_x + irandom_range(-wander_radius, wander_radius);
        targetY = home_y + irandom_range(-wander_radius, wander_radius);
        wander_timer = irandom_range(30, 90);
    }
};

// -------------------------
// PHASE BEHAVIOR: target selection
// -------------------------
if (global.phase == global.P_NIGHT) {

    // go to bed ONLY at night
    if (assigned_bed != noone && instance_exists(assigned_bed)) {

        var bx = assigned_bed.x;
        var by = assigned_bed.y;

        // Try several approach points around the bed until one isn't blocked by a wall
        // (Prevents "freeze" when your target point is inside a wall/bed area.)
        var tx, ty;
        var found = false;

        // 1) below bed
        tx = bx; ty = by + 16;
        if (!place_meeting(tx, ty, oWall)) { found = true; }

        // 2) right of bed
        if (!found) {
            tx = bx + 16; ty = by;
            if (!place_meeting(tx, ty, oWall)) { found = true; }
        }

        // 3) left of bed
        if (!found) {
            tx = bx - 16; ty = by;
            if (!place_meeting(tx, ty, oWall)) { found = true; }
        }

        // 4) above bed
        if (!found) {
            tx = bx; ty = by - 16;
            if (!place_meeting(tx, ty, oWall)) { found = true; }
        }

        if (found) {
            targetX = tx;
            targetY = ty;
        } else {
            // If no approach point is walkable, don't freeze—wander instead
            do_wander();
        }

    } else {
        // No bed assigned? Don't freeze—wander instead
        do_wander();
    }

} else {
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
