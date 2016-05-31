///text_update_logic_continue(conversation)

/*  SHOULD ONLY BE CALLED IN TEXT-LOGIC/TEXT-ANIMATION SCRIPTS
**
**  Description:
**      Sets current command to be done, remove it from the queque, continue
**      with next command.
**  
**  Usage:
**      text_update_logic_continue(conversation)
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

text_ds_list_queue_dequeue(conv[? "__commands"]);
text_update_logic(conv);    