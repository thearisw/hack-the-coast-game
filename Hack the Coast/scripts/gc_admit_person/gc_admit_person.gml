function gc_admit_person(p) {
    // build list of free beds
    var free = ds_list_create();

    for (var i = 0; i < ds_list_size(bed_list); i++) {
        var b = bed_list[| i];
        if (instance_exists(b) && !b.occupied) ds_list_add(free, b);
    }

    if (ds_list_size(free) == 0) {
        ds_list_destroy(free);
        return false;
    }

    // choose random free bed
    var b = free[| irandom(ds_list_size(free) - 1)];
    ds_list_destroy(free);

    // assign
    ds_list_add(admitted, p);
    p.assigned_bed = b;

    b.occupied = true;
    b.assigned_id = p;

    return true;
}
