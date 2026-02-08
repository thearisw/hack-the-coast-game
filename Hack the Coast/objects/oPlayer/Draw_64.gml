if (active_zone != noone) {
    // Check if we are specifically in the Bed Zone
    if (active_zone.menu_context == "bed_menu") {
        
        // --- STYLE ---
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        
        // --- DATA ---
        var _occ = global.beds_occupied;
        var _cap = global.bed_capacity;
        var _pol = global.bed_policy;
        
        // --- DRAWING ---
        // Left side of screen, 50px down
        draw_text(20, 50, "ZONE: " + active_zone.zone_name); 
        draw_text(20, 70, "BEDS: " + string(_occ) + "/" + string(_cap));
        draw_text(20, 90, "POLICY: " + _pol);
        draw_text(20, 120, "[SPACE] EDIT POLICY");
    }
}