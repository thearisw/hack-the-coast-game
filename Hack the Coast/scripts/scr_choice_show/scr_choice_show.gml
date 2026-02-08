/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2C21B7F8
/// @DnDArgument : "code" "function scr_choice_show(_options, _objid, _context) {$(13_10)    // We create it at (0,0) because the GUI event handles centering$(13_10)    var _inst = instance_create_layer(0, 0, "UI", oChoiceBox);$(13_10)    $(13_10)    // Pass the data$(13_10)    with(_inst) {$(13_10)        options = _options;$(13_10)        parentid = _objid;$(13_10)        menu_context = _context; // Pass the context!$(13_10)    }$(13_10)    $(13_10)    return _inst;$(13_10)}"
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