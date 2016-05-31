/** 
This shows you that textboxes can also set to close automatically
if walking to far away.

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

text_add_command(commands,"set","display","bubble");
text_add_command(commands,"set","instance",id);
/*If you set disappear to true the conversation will automatically end when:
 * * The instance is destroyed
 * * The instance is global.text_distance away from the player
 *NOTE: The instance is actually NOT the instance set for a textbox.
 *It's the instance that created this conversation!
 *It is also set for the whole conversation NOT for one textbox!
 *The conversation will be ended just the same way as if there were no
 *commands left. The state will be 1 just as normally.
 */
text_add_command(commands,"set","disappear",true);
text_add_command(commands,"show");
text_add_command(commands,"line","This does automatically disappear");
text_add_command(commands,"line","after one minute or if you walk away.");
text_add_command(commands,"wait_time",60);
text_add_command(commands,"close");
text(commands,0);
