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

text_debugger("text_command_animation_c_show",text_debug.DEBUG,"Showing textbox...");
var textboxes = ds_map_find_value(conv,"__texts");
textbox = ds_list_find_value(textboxes,ds_list_size(textboxes)-1);

if (global.text_boxanimation)
    textbox[? "__boxanime"] +=0.03*conv[? "speed"];
else textbox[? "__boxanime"] = 1;
if (textbox[? "__boxanime"] >= 1) {
    textbox[? "__boxanime"]=1;
    conv[? "__wait_for_animation"] = false;
    text_debugger("text_command_animation_c_show",text_debug.DEBUG,"Textbox shown!");
    text_update_logic_continue(conv);
}