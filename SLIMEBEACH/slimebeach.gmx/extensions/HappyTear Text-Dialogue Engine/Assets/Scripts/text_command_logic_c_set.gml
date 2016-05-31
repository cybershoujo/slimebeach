/*  SHOULD NOT BE CALLED MANUALLY
**
**  Usage:
**       text_command_logic_*(conv,current_command)
**
**
**  MORE INFORMATION ABOUT LOGIC SCRIPTS 
**  AND TEXT COMMANDS CAN BE FOUND IN THE MANUAL
*/

var conv = argument0;
var current_command = argument1;

if (array_length_1d(current_command) < 3) {
    text_debugger("text_command_logic_c_set",text_debug.ERROR,"Invalid use of the set command. Missing arguments. Skipping commands.");
    text_update_logic_continue(conv);
    exit;
}

var variabl = current_command[1];
var setto = current_command[2];
text_debugger("text_command_logic_c_set",text_debug.DEBUG,"Setting "+string(variabl)+" to "+string(setto));

ds_map_replace(conv,variabl,setto);

text_update_logic_continue(conv);