function gc_find_free_bed() {
    for (var i = 0; i < ds_list_size(bed_list); i++) {
        var b = bed_list[| i];
        if (instance_exists(b) && !b.occupied) return b;
    }
    return noone;
}
