/** 
This demo will show you how to control animations and how to "pause" text
or even how to wait for player input in the middle of a line.

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();
/*Before we create a textbox, let's change some settings*/
/*Before we do that please note that once you created a textbox, changing
 *settings will not affect the already opened textbox! Only textboxes created
 *after the settings are changed will be affected
 */
/*The set command can be used to change text-engine-variables. A full list can
 *be found in the manual. Default settings can be found and changed in text_create_conversation
 *The first agrument is the name of the variable.
 *The second argument is what you want to set the variable to.
 */
/*Let's make the text speed slower by setting speed*/
text_add_command(commands,"set","speed",2);
/*You can also disable character animations by setting animations to false! 
 *Try that!
 */
text_add_command(commands,"show");
/*All text will now draw to the new opened textbox.*/
/*To add a line of text use the line command as add the text as first argument*/
text_add_command(commands,"line","This text is slow.");
/*wait_time can be used to wait a specific amount of seconds before
 *the next command will be executed and is a cool alternative to wait_input*/
text_add_command(commands,"wait_time",2);
text_add_command(commands,"next_page");
text_add_command(commands,"line","Let's make it even slower by adding");
/*You can also use wait_time without adding a new page afterwards*/
text_add_command(commands,"wait_time",2);
text_add_command(commands,"line","annoying pauses.");
text_add_command(commands,"line","Oh! ");
/*The same goes for wait_input*/
text_add_command(commands,"wait_input",1);
/*Using so called "noline"s you can add text in the current line.
 *That means we just waited for the player to press a button and now we add
 *text in the same line as "Oh! "
 *It works just like "line".
 */
text_add_command(commands,"noline","Whatever.");
text_add_command(commands,"line","Let's just close this box.");
text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
 
text(commands,0);