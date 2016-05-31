///text_get_state(conversation id,[instance id])

/*  
**  Description:
**      Returns the state of a specific conversation
**      More information can be found in the manual.
**  
**  Usage:
**      text_get_state(conversation id,[instance id])
**
**  Arguments:
**      conversation_id real    The id of this unique conversation for the instance
**      instance_id     real    The id of the instance to get the status from
**                              DEFAULTS TO: current instance id [id]
**
**  Returns:
**      real - state of the conversation
**
*/

var inst_id = id;
if (argument_count > 1) inst_id = argument[1];

var returner = 0
var s = string(inst_id)+"-"+string(argument[0]);
if (ds_map_exists(global.textvars,s)) {
    var returner = -1;
    var vars = ds_map_find_value(global.textvars,s);
    if (vars == -1 || !ds_map_exists(vars, "__state")) returner = 0;
    else {
         returner = vars[? "__state"];
    }
}
return real(returner);