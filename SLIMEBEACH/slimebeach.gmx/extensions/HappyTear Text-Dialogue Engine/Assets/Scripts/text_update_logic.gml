///text_update_logic(conversation)

/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      This script runs the logic for one conversation.
**  
**  Usage:
**      text_update_logic(conversation)
**
**  Arguments:
**      conversation    ds_map  a ds_map that is placed in global.textvars 
**                              and represents a single conversation.
**
**  Returns:
**      string - last executed command
**
*/

var conv = argument0;


text_debugger("text_update_logic",text_debug.DEBUG,"START TEXT UPDATE LOGIC");

if (!ds_list_empty(conv[? "__commands"])) {
   //Get the current command as a list and convert it to an array
   var current_command_list = text_ds_list_queue_head(conv[? "__commands"]);
   var current_command;
   for (var j=0;j<ds_list_size(current_command_list);j++) {
       current_command[j] = ds_list_find_value(current_command_list,j);
   }
} else {
  //No more commands are left
  //Set state to 1 - finished.
  conv[? "__state"] = 1;
  var current_command;
  //Change command to none. Nothing will happen until new commands have been added.
  //Conversation should now be cleared with text_reset_state.
  current_command[0] = "none";
}

////
////   UPDATE LOGIC / PROCESS COMMANDS
////

//FIXME: asset_exists doesn't work on HTML5. We skip the check on that platform...
text_debugger("text_update_logic",text_debug.DEBUG,"Execute logic of command "+current_command[0]);
if (os_browser != browser_not_a_browser || script_exists(asset_get_index("text_command_logic_c_"+current_command[0])))
    script_execute(asset_get_index("text_command_logic_c_"+current_command[0]),conv,current_command);
else {
    text_debugger("text_update_logic",text_debug.ERROR,"Script for "+current_command[0]+" command does not exist! Skipping...");
    text_update_logic_continue(conv);
}


////
////   UPDATE ANIMATIONS
////

//TODO: The whole point of splitting animation and logic up is that animation
//should only be ran once a frame. Even if text_update_logic_continue() is called.
//This is currently not the case. I'm working on that.

text_debugger("text_update_logic",text_debug.DEBUG,"Execute animation logic of command "+current_command[0]);
if (script_exists(asset_get_index("text_command_animation_c_"+current_command[0])))
    script_execute(asset_get_index("text_command_animation_c_"+current_command[0]),conv,current_command);
else {
    text_debugger("text_update_logic",text_debug.INFO,"Animation script for command "+current_command[0]+" does not exist.");
}


////
////   MORE STEP LOGIC
////

text_update_logic_disappear(conv);
text_update_animation_autoenlargement(conv);   

////
////   RETURN
//// 

if (!ds_list_empty(conv[? "__commands"])) {
    return ds_list_find_value(text_ds_list_queue_head(conv[? "__commands"]),0);
} else return "none";