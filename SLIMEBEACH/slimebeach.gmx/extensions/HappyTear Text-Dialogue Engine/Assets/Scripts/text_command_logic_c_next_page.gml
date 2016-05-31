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

text_debugger("text_command_logic_c_next_page",text_debug.DEBUG,"Removing all lines...");

var textbox_id;
var textboxes = ds_map_find_value(conv,"__texts");
if (array_length_1d(current_command) > 1) {
    textbox_id = ds_list_size(textboxes)-1-current_command[1];
} else {
    textbox_id = ds_list_size(textboxes)-1
}
if (ds_list_size(textboxes) == 0 ||ds_list_find_value(textboxes,textbox_id) = -1) {
     text_debugger("text_command_logic_c_next_page",text_debug.ERROR,"Invalid textbox specified! Skipping command...");
     text_update_logic_continue(conv);
     exit;
}
var textbox = ds_list_find_value(textboxes,textbox_id);
textbox[? "__animatedchars"] = 0;
textbox[? "__sumchars"] = 0;
var lines = ds_map_find_value(ds_list_find_value(textboxes,textbox_id),"__lines");
ds_list_clear(lines);

text_debugger("text_command_logic_c_next_page",text_debug.DEBUG,"Textbox cleaned");
text_update_logic_continue(conv);