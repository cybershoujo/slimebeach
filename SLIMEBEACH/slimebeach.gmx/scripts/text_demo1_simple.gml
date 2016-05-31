/** 
Welcome! This is the simple demo on how to use the text engine!
First take a look at obj_text_demo, it get's called there. 
 
To display text we have to create a conversation. Each instance can have
an umlimited amount of conversations
  
We create a command list below. Commands get executed when the old is finished.
A command usally takes one step unless there are animations. In this case the
next command will be executed once the animation is done.
**/
  
/*We create a ds_list. It will store the commands for this conversation*/
var commands = ds_list_create();
/*text_add_command adds a command to the previously created list. It's usage is:
 *text_add_command(COMMAND LIST,COMMAND,ARGUMENT1,ARGUMENT2...);
 */
/*The first command for the most basic text is "show" to create a new textbox*/
text_add_command(commands,"show");
/*All text will now draw to the new opened textbox.*/
/*To add a line of text use the line command as add the text as first argument*/
text_add_command(commands,"line","This is a basic example of the");
text_add_command(commands,"line","HappyTear Text Engine.");
text_add_command(commands,"line","The banner style is used by default.");
text_add_command(commands,"line","With this style a textbox will be placed");
text_add_command(commands,"line","at the top of the screen.");
/*wait_input tells the Text engine to wait for player input.*/
/*The first argument can be used to display a so called textnext sprite*/
/*It will indicate that we wait for input. 1 shows an arrow. */
/*You can control what sprite the arguments represent using the script text_wait_input_textnext*/
text_add_command(commands,"wait_input",1);
/*next_page clears the textbox*/
text_add_command(commands,"next_page");
text_add_command(commands,"line","Banners expand automatically");
text_add_command(commands,"line","if you add more than three lines.");
text_add_command(commands,"line","Warning!");
text_add_command(commands,"line","It will not extend to the right so don't add too much text in a single line.");
text_add_command(commands,"wait_input",1);
text_add_command(commands,"next_page");
text_add_command(commands,"line","That's all. Let's close the box!");
/*wait_input with an argument of 2 will by default show an X as textnext sprite*/
/*This should be used for the last textbox in a conversation
 *If it makes it easier for you, add constants that represent the different textnext's.
 */
text_add_command(commands,"wait_input",2);
/*Close closes the textbox*/
text_add_command(commands,"close");
/*Once the box is closed the conversation will marked as being over because there
 *are no commands left. In obj_text_demo you can see how you can check if a
 *conversation is over.
 */
 
/**Now that the list of commands is created we will start the text with the 
 **text command. The last argument is the conversation number. It can be useful if
 **you have multiple conversations with one instance. In this case we  set it to
 **0 because we only have one. We need to remember this number to check for it's
 **status as shown in obj_text_deno
 **/
text(commands,0);
