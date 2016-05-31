///text(command list,conversation id)

/*  
**  Description:
**      Call this script to create a new conversation.
**  
**  Usage:
**      text(command list,conversation id)
**
**  Arguments:
**      command_list    ds_list   A list of commands formatted using text_add_command
**      conversation_id real      A unique number for this conversation of this instance.
**
**  Returns:
**      <nothing>
**
*/
var s = string(id)+"-"+string(argument1);
text_debugger("text",text_debug.INFO,"Created text "+s);

ds_map_add(global.textvars,s,ds_map_create());
var vars = ds_map_find_value(global.textvars,s);
text_create_conversation(vars,argument0);
