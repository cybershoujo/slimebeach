/** 
This demo will demonstrate the pointing display style and explain what display
styles are. It also shows how to change the instance it's pointing at and how
to add a nameplate to any display style.

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();
/*display styles control how your textbox will look like
 *There are 3 styles included: banner [you've seen that],pointing and bubble
 *New styles can be added. See manual for info on that.
 */
/*We set the display style to be p"ointing"*/
text_add_command(commands,"set","display","pointing");
/*Pointing requires more setup than banner.Pointing will show a arrow that points
 *to an instance, otherwise it's identical to banner.*/
/*For it to work we need to assign an instance id. We will simply use id for that
 *because the local variable id contains the id of this instance
 *By default the instance is the player.
 */
text_add_command(commands,"set","instance",id);
/*This is all that is required. But we want more*/
/*You can add a name to ALL display styles. Let's do that! It will show beneath the box*/
text_add_command(commands,"set","name","Demo man 3");

text_add_command(commands,"show");
/*All text will now draw to the new opened textbox.*/
/*To add a line of text use the line command as add the text as first argument*/
text_add_command(commands,"line","I am a man.");
text_add_command(commands,"line","Try moving! The arrow will follow me!");
text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
 
text(commands,0);