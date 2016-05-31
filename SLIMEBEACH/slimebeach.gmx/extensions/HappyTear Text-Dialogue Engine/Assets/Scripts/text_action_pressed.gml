///text_action_pressed([conversation])

/*  
**  Description:
**      This should return true or false whether or not the button to proceed
**      text has been pressed. By default this is the spacebar.
**      Change this to fill your needs.
**
**      This default method is only suitable for singleplayer.
**      This takes conversation as an OPTIONAL argument. [it's given by wait_input]
**      So for multiplayer where you sync text you can use this to check 
**      if the local player has pressed the button or now.
**  
**  Usage:
**      text_action_pressed([conversation])
**
**  Arguments:
**      conversation  ds_map    OPTIONAL Conversation map that this call belongs to
**
**  Returns:
**      true [button was pressed] or false [button was not pressed]
**
*/

if (argument_count > 0) var conv = argument0;
else var conv = noone;

//We have to make sure this only get's called once a frame.
//Otherwise it will skip through all text when animation is false. And we
//don't want that! global.text_pressed get's set to false at the beginning of text_update

//DON'T USE THIS SCRIPT OUTSIDE OF THE TEXT ENGINE
//While testing I used this function outside of the text engine with the demo men
//With the addition of global.text_pressed this doesn't work! Because this would
//block everything but the keyboard check of the first man!

if (!global.text_pressed && keyboard_check_pressed(vk_space)) {
    global.text_pressed = true;
    return true;
}
else return false;