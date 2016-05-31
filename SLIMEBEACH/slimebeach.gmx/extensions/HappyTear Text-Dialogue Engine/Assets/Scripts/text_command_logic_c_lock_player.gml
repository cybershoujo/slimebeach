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

text_debugger("text_command_logic_c_lock_player",text_debug.DEBUG,"player locking was toggled!");
var player_instance = conv[? "player"];  
//You can change the variable here
player_instance.lock = current_command[1];
text_update_logic_continue(conv);