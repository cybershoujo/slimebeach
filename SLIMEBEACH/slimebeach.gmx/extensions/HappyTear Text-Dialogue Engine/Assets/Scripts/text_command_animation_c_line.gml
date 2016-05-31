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

text_debugger("text_command_animation_c_line",text_debug.DEBUG,"Animating line...");
var textbox_id;
var textboxes = ds_map_find_value(conv,"__texts");
if (array_length_1d(current_command) > 2) {
    textbox_id = ds_list_size(textboxes)-1-current_command[2];
} else {
    textbox_id = ds_list_size(textboxes)-1
}
if (ds_list_find_value(textboxes,textbox_id) = -1) {
     text_debugger("text_command_animation_c_line",text_debug.CRITICAL,"Invalid textbox specified! Not skipping command because in animation!");
     exit;
}
var textbox = ds_list_find_value(textboxes,textbox_id);
if (textbox[? "__wait_for_animation"]) {
    if (textbox[? "__animatedchars"] < textbox[? "__sumchars"]) {
        textbox[? "__animatedchars"]+=0.1*conv[? "speed"];
    }
    else {
        //Done!
        text_debugger("text_command_animation_c_line",text_debug.DEBUG,"Animation done!");
        textbox[? "__animatedchars"] = textbox[? "__sumchars"];
        textbox[? "__wait_for_animation"] = false;
        text_update_logic_continue(conv);
    }
}