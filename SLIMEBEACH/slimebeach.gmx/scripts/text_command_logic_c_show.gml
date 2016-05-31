/*  SHOULD NOT BE CALLED MANUALLY
**
**  Usage:
**       text_command_logic_*(conv,current_command)
**
**  MORE INFORMATION ABOUT LOGIC SCRIPTS 
**  AND TEXT COMMANDS CAN BE FOUND IN THE MANUAL
*/

var conv = argument0;
var current_command = argument1;

//Network break. Only run this command for own textboxes, otherwise wait for update from network
if (conv[? "player"] != global.text_local_player) exit;
//Don't continue if we are actually just waiting for animation [FIXME: Remove? Can that even occurr during show?]
if (conv[? "__wait_for_animation"]) {
    exit;
}
text_debugger("text_command_logic_c_show",text_debug.DEBUG,"Create a new textbox...");
var textboxes = ds_map_find_value(conv,"__texts");
ds_list_add(textboxes,ds_map_create());
ds_list_mark_as_map(textboxes,ds_list_size(textboxes)-1);
var newbox = ds_list_find_value(textboxes, ds_list_size(textboxes)-1);
newbox[? "__close"] = false;
//Add an empty list that will contain the lines and nolines.
ds_map_add_list(newbox,"__lines",ds_list_create());
//Settings defaults for internal textbox variables.
//ADD YOUR OWN INTERNAL TEXTBOX VARIABLES HERE
newbox[? "__animatedchars"] = 0;
newbox[? "__sumchars"] = 0;
newbox[? "__boxanime"] = 0;
newbox[? "__tmp_x"] = -100;
newbox[? "__tmp_y"] = -100;
newbox[? "__textnext"] = noone;
newbox[? "__wait_for_animation"] = false;
//All other default variables will be taken from the conversation
for (var q = 0;q<array_length_1d(global.textsettings);q++) {
    ds_map_add(newbox,global.textsettings[q],ds_map_find_value(conv,global.textsettings[q]));
}
//Set initial width/height
var displaystyle = newbox[? "display"];
if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_metadata"))) {
    var ret = script_execute(asset_get_index("text_draw_c_"+displaystyle+"_metadata"),newbox);
    newbox[? "__width"] = ret[4];
    newbox[? "__height"] = ret[5];
} else {
    text_debugger("text_command_logic_c_show",text_debug.WARNING,"metadata for "+displaystyle+" does not exist! Falling back to default.");
    newbox[? "__width"] = 0;
    newbox[? "__height"] = 0;
}
//Textbox created!
text_debugger("text_command_logic_c_show",text_debug.DEBUG,"Textbox created!");
conv[? "__wait_for_animation"] = true;
//Continue with next command in animation logic
