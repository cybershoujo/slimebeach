///text_update_logic_disappear(conversation)

/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Handles conversation destroying when player instance is destroyed or
**      "disappear" is set and conditions for "disappear" are present.
**  
**  Usage:
**      text_update_logic_disappear(conversation)
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

var player_instance = conv[? "player"];  
if (conv[? "disappear"]) {
    if (!instance_exists(conv[? "__instance"])) {
        //Assigned instance was removed.
        text_update_logic_disappear_sub(conv);
    } else if (instance_exists(player_instance)) {
        var dist = -1;
        with (conv[? "__instance"]){dist = distance_to_object(player_instance);}
        if (dist == -1 || dist > global.text_distance) {
           //Player is too far away from assigned instance.
            text_update_logic_disappear_sub(conv);
        }
    }
}
if (!instance_exists(player_instance)) {
    //Player is gone. Remove textbox (mainly for multiplayer)
    text_update_logic_disappear_sub(conv);
}
