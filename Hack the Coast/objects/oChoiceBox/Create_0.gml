// --- DATA ---
options = [];        // Array of text strings
selected = 0;        // Which option is highlighted (0 = top, 1 = bottom)
parentid = noone;    // Who asked for this choice?
confirmed = false;   // Has player pressed Enter?

// --- CONTEXT (NEW) ---
menu_context = "";   // Stores "bed_menu", "food_menu", "intake_decision", etc.

// --- VISUALS ---
padding = 8;         // Space around text
line_height = 12;    // Space between lines
m_decision_made_trigger = false;
final_decision = -1;