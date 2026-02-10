function gc_admit_person(p) {
    if (!ds_exists(admitted, ds_type_list)) admitted = ds_list_create();
    if (ds_list_find_index(admitted, p) == -1) ds_list_add(admitted, p);
    return true;
}
