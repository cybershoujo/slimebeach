///text_update()

/*
**  Description:
**      This will run the logic of the text engine.
**      This script should be called in a step event.
**  
**  Usage:
**      text_update()
**
**  Arguments:
**      <none>
**
**  Returns:
**      <nothing>
**
*/

text_debugger("text_update",text_debug.DEBUG,"START TEXT UPDATE");

//See text_action_pressed for details on this variable:
global.text_pressed = false;

var key, i;
key= ds_map_find_first(global.textvars);
//This will loop through all currently loaded conversation
for(i=0; i<ds_map_size(global.textvars); i+=1) {
    //Run the logic for this conversation
    text_debugger("text_update",text_debug.DEBUG,"Run logic for conversation "+key);
    ret = text_update_logic(ds_map_find_value(global.textvars,key));
    tmpkey = ds_map_find_next(global.textvars, key);
    //If the returned value of the logic function is "kill", remove this conversation.
    if (ret == "kill") {
        text_debugger("text_update",text_debug.DEBUG,"Destroy conversation");
        ds_map_delete(global.textvars, key);
    }
    key = tmpkey; 
}

text_debugger("text_update",text_debug.DEBUG,"END TEXT UPDATE");
