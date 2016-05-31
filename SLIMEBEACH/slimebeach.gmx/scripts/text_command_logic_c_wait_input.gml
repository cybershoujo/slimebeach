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

text_debugger("text_command_logic_c_wait_input",text_debug.DEBUG,"Waiting for player input...");

var textbox_id;
var textboxes = ds_map_find_value(conv,"__texts");
if (array_length_1d(current_command) > 2) {
    textbox_id = ds_list_size(textboxes)-1-current_command[2];
} else {
    textbox_id = ds_list_size(textboxes)-1
}
if (ds_list_size(textboxes) == 0 ||ds_list_find_value(textboxes,textbox_id) = -1) {
     text_debugger("text_command_logic_c_wait_input",text_debug.ERROR,"Invalid textbox specified! Skipping command...");
     text_update_logic_continue(conv);
     exit;
}
var textbox = ds_list_find_value(textboxes,textbox_id);
if (array_length_1d(current_command) > 1) {
    //Add a nice little icon to show the player we await input
    textbox[? "__textnext"] = text_wait_input_textnext(current_command[1]);
}
var player_instance = conv[? "player"];  
if (text_action_pressed(conv)) {
    textbox[? "__textnext"] = noone;   
    text_debugger("text_command_logic_c_wait_input",text_debug.DEBUG,"Got player input!");
    text_update_logic_continue(conv);
}
