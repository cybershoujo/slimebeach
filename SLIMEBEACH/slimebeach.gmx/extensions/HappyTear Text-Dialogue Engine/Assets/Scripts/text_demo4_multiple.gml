/** 
Let's get crazy! This demo will show you how to display multiple textboxes
AT THE SAME TIME!!!!!11!

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

text_add_command(commands,"set","name","Textboxman");
text_add_command(commands,"set","display","pointing");
text_add_command(commands,"set","instance",id);
/*Let's start with one box.*/
text_add_command(commands,"show");
text_add_command(commands,"line","I am Textboxman!!!");
text_add_command(commands,"wait_input",1);
/*Okay! Remember how I told you that changing variables only applies for new
 *opened boxes? We will use this behaviour now!
 *To make reading easier I will use an inset, you should do the same.
 */
    /*Let's set the second box to be a banner*/
    text_add_command(commands,"set","display","banner");
    /*And hide the name. Setting it to "false" (STRING!!) will remove the name*/
    text_add_command(commands,"set","name","false");
    /*banner and pointing can be placed by changing position. Possible values are
     *bottom and top. The default is top. Let's display this box at the bottom!
     */
    text_add_command(commands,"set","position","bottom");
    /*Finally! Let's show the new box*/
    text_add_command(commands,"show");
    /*New lines, nolines and other textbox specifc commands are only applied to
     *the last opened textbox*/
    text_add_command(commands,"line","And I am Banner.");
    /*The textnext sprite will only be placed on the last textbox
     */
    text_add_command(commands,"wait_input",1);
/*To add text to a previous textbox use the third argument of line or noline
 *If you set it to zero it will draw on the last opened textbox just as before
 *If you set it to one  it will draw on the textbox opened before that
 *If you set it to two  it will draw on the textbox opened before that
 *...
 *Always make sure the textbox exists!
 */
text_add_command(commands,"line","Hi Banner!",1);
/*The same applies for wait_input. Basically for all textbox commands.
 *It's always the last argument and always optional. 
 *Because of that for next_page it's the first argument.*/
text_add_command(commands,"wait_input",1,1);
    text_add_command(commands,"line","Hi Textboxman!");
    text_add_command(commands,"wait_input",1);
    text_add_command(commands,"close");
/*We just closed the last box. The first box is now that last one again and
 *we don't need the offset.*/
text_add_command(commands,"line","What a nice banner.");
text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
/*Make sure to always have all textboxes closed before you run out of commands*/
 
text(commands,0);