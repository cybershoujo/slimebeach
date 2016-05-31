///text_update_logic_disappear_sub(conversation)

/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Handles the actual conversation destruction. 
**      See text_update_logic_disappear fore more info.
**  
**  Usage:
**      text_update_logic_disappear_sub(conversation)
**
**  Arguments:
**      conversation    ds_map  a ds_map that is placed in global.textvars 
**                              and represents a single conversation.
**
**  Returns:
**      <nothing>
**
*/

var conv = argument0;

conv[? "disappear"] = false; //Set false so this code doesn't get repeated endlessly
ds_list_clear(conv[? "__commands"]);
//This will loop through all currently loaded textboxes of this conversation
var textboxes = conv[? "__texts"];
for(j=0; j<ds_list_size(textboxes); j+=1) {
    text_add_command(conv[? "__commands"],"close");
}
text_add_command(conv[? "__commands"],"kill");