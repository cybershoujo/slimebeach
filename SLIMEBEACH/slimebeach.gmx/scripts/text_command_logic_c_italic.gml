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

text_debugger("text_command_logic_c_italic",text_debug.DEBUG,"Changed text italic...ness");

conv[? "italic"] = true;
if (array_length_1d(current_command) > 1)
    if (current_command[1] == false) conv[? "italic"] = false
text_update_logic_continue(conv);
