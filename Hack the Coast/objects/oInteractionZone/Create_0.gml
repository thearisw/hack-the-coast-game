/// oZone: Create
zone_type = "beds";   // set per instance: "intake","beds","supplies","staff"
zone_w_tiles = 2;     // tiles
zone_h_tiles = 5;     // tiles
grid = 16;

debug_draw = true;

// Snap center to tile centers (fixes odd tile sizes like 5 tall)
x = floor(x / grid) * grid + ((zone_w_tiles mod 2 == 1) ? grid * 0.5 : 0);
y = floor(y / grid) * grid + grid * 0.5;
