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

text_debugger("text_command_logic_c_reset_formats",text_debug.DEBUG,"Rsetting text formats...");

conv[? "bold"] = false;
conv[? "italic"] = false;
conv[? "color"] = "000000";;
text_update_logic_continue(conv);