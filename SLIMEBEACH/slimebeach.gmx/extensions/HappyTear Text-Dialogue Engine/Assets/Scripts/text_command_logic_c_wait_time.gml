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

text_debugger("text_command_logic_c_wait_time",text_debug.DEBUG,"Waiting for set amount of time...");

if (!conv[? "__wait_for_animation"]) {
    conv[? "__wait_for_animation"] = true;
    //we use wait_for_animation of the conv. to set a flag that means: we have already set time
    conv[? "__wait_time"] = current_time;
}
if (current_time > conv[? "__wait_time"]+current_command[1]*1000) {
    conv[? "__wait_for_animation"] = false;
    text_debugger("text_command_logic_c_wait_time",text_debug.DEBUG,"Time over. Continue.");
    text_update_logic_continue(conv);
}