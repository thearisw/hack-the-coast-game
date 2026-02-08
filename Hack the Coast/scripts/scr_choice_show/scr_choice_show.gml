function scr_choice_show(_options, _objid, _context) {
    // We create it at (0,0) because the GUI event handles centering
    var _inst = instance_create_layer(0, 0, "UI", oChoiceBox);
    
    // Pass the data
    with(_inst) {
        options = _options;
        parentid = _objid;
        menu_context = _context; // Pass the context!
    }
    
    return _inst;
}