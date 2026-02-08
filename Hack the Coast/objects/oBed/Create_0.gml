occupied = false;

// assign these per-child bed type (see next section)
spr_empty = sprite_index;   // fallback
spr_full  = -1;             // fallback

assigned_id = noone;        // instance id of homeless person assigned
wake_dx = 18;               // where they appear in morning (relative to bed)
wake_dy = 10;
