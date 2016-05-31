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

if (array_length_1d(current_command) < 2) {
    text_debugger("text_command_logic_c_color",text_debug.ERROR,"Invalid use of the color command. Missing arguments. Skipping commands.");
    text_update_logic_continue(conv);
    exit;
}

text_debugger("text_command_logic_c_color",text_debug.DEBUG,"Changed text color");

conv[? "color"] = current_command[1];
text_update_logic_continue(conv);
