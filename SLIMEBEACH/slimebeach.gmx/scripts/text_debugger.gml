///text_debugger(scriptname,level,message)

/*
**  Description:
**      This script outputs debug messages related to the text engine
**  
**  Usage:
**      text_debugger(scriptname,level,message)
**
**  Arguments:
**      scriptname string      name of the script file that output this debug message
**      level       text_debug  Value of the enum text_debug declared in text_setup
**      message     string      Debug message
**
**  Returns:
**      <nothing>
**
*/

var scriptname = argument0;
var level = argument1;
var message = argument2;

if (global.text_debug_level != text_debug.NONE && level >= global.text_debug_level) {
    levelname = "UNKNOWN";
    switch (level) {
        case text_debug.NONE:
            levelname = "NONE";
            break;
        case text_debug.DEBUG:
            levelname = "DEBUG";
            break;
        case text_debug.INFO:
            levelname = "INFO";
            break;
        case text_debug.WARNING:
            levelname = "WARNING";
            break;
        case text_debug.ERROR:
            levelname = "ERROR";
            break;
        case text_debug.CRITICAL:
            levelname = "CRITICAL";
            break;
    }
    show_debug_message("TEXT ENGINE ["+string(current_time)+"] "+scriptname+" - "+levelname+" - "+message);
}
