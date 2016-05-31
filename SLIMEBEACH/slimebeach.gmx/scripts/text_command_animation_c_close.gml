/*  SHOULD NOT BE CALLED MANUALLY
**
**  Usage:
**       text_command_animation_c_*(conv,current_command)
**
**  MORE INFORMATION ABOUT ANIMATION LOGIC SCRIPTS 
**  AND TEXT COMMANDS CAN BE FOUND IN THE MANUAL
*/

var conv = argument0;
var current_command = argument1;

text_debugger("text_command_animation_c_close",text_debug.DEBUG,"Clsoing textbox...");
var textbox_id;
var textboxes = ds_map_find_value(conv,"__texts");
if (array_length_1d(current_command) > 1) {
    textbox_id = ds_list_size(textboxes)-1-current_command[1];
} else {
    textbox_id = ds_list_size(textboxes)-1
}
var textbox = ds_list_find_value(textboxes,textbox_id);

if (global.text_boxanimation)
    textbox[? "__boxanime"] -=0.03*conv[? "speed"];
else textbox[? "__boxanime"] = 0;
if (textbox[? "__boxanime"] <= 0) {
    textbox[? "__boxanime"]=0;
    ds_list_delete(textboxes,textbox_id);
    text_debugger("text_command_animation_c_close",text_debug.DEBUG,"Textbox closed!");
    text_update_logic_continue(conv);
}
