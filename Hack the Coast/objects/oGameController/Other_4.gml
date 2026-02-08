// safety: make sure the list exists
if (!ds_exists(bed_list, ds_type_list)) bed_list = ds_list_create();

ds_list_clear(bed_list);

// collect all bed instances in the room
with (oBed) {
    ds_list_add(other.bed_list, id);
}

show_debug_message("Beds found: " + string(ds_list_size(bed_list)));
