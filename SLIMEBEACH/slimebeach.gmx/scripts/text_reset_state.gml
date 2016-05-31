///text_reset_state(conversation id)

/*  
**  Description:
**      Deletes a conversation from memory.
**      Should only be used to reset the state after the conversation is over.
**  
**  Usage:
**      text_reset_state(conversation id)
**
**  Arguments:
**      conversation_id real    The id of this unique conversation for this instance
**
**  Returns:
**      <nothing>
**
*/
text_debugger("text_reset_state",text_debug.INFO,"Destroyed text "+string(id)+"-"+string(argument0));
ds_map_delete(global.textvars, string(id)+"-"+string(argument0));
