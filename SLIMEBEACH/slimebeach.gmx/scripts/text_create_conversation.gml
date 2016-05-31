///text_create_conversation(conversation,commands)

/*  
**  Description:
**      This is called everytime a conversation is created to fill it with the
**      defaults of the variables. Change them here.
**  
**  Usage:
**      text_create_conversation(conversation,commands)
**
**  Arguments:
**      conversation  ds_map    The map that represents the new conversation
**      commands      ds_list   A list with commands
**
**  Returns:
**      <nothing>
**
*/

ds_map_add(argument0, "display", "banner");
ds_map_add(argument0, "position", "top");
ds_map_add(argument0, "manual", false);
ds_map_add(argument0, "manual_x", 0);
ds_map_add(argument0, "manual_y", 0);
ds_map_add(argument0, "instance", global.text_local_player);
ds_map_add(argument0, "name", "false");
ds_map_add(argument0, "disappear", false);
ds_map_add(argument0, "animation", true);
ds_map_add(argument0, "speed", 4);
ds_map_add(argument0, "bold", false);
ds_map_add(argument0, "font", "speach");
ds_map_add(argument0, "italic", false);
ds_map_add(argument0, "color", $000000);
ds_map_add(argument0, "bgcolor", $ffffff);
ds_map_add(argument0, "bgcolor_nameplate", $ffffff);
ds_map_add(argument0, "font_nameplate", "anklada");
ds_map_add(argument0, "color_nameplate", $000000);
ds_map_add(argument0, "bgalpha", 1);
ds_map_add(argument0, "bgimage", noone);
ds_map_add(argument0, "room", room);
//Player is technically an internal variable that keeps track of who
//controls this conversation (for multiplayer)
ds_map_add(argument0, "player", global.text_local_player);

//=== INTERNAL VARIABLES - Don't change if you don't know what you are doing

ds_map_add(argument0, "__state", "-1");
ds_map_add(argument0, "__instance", string(id));
ds_map_add_list(argument0, "__commands", argument1);
ds_map_add(argument0, "__wait_for_animation", false);
ds_map_add(argument0, "__wait_time", 0);
ds_map_add_list(argument0, "__texts", ds_list_create());
