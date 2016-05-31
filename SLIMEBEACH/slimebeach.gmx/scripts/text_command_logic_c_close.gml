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

text_debugger("text_command_logic_c_close",text_debug.DEBUG,"Closing a textbox...");

var textbox_id;
var textboxes = ds_map_find_value(conv,"__texts");
if (array_length_1d(current_command) > 1) {
    textbox_id = ds_list_size(textboxes)-1-current_command[1];
} else {
    textbox_id = ds_list_size(textboxes)-1
}
if (ds_list_size(textboxes) == 0 || ds_list_find_value(textboxes,textbox_id) == -1) {
     text_debugger("text_command_logic_c_close",text_debug.ERROR,"Invalid textbox specified! Skipping command...");
     text_update_logic_continue(conv);
     exit;
}
var textbox = ds_list_find_value(textboxes,textbox_id);
//Don't continue if animation is running, textbox will be closed there
if (textbox[? "__wait_for_animation"]) {
   exit;
}
textbox[? "__wait_for_animation"] = true;
//Continue with next command in animation logic
