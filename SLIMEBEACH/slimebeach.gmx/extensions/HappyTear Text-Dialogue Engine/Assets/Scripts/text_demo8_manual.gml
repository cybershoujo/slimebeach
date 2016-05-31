/** 
You can also place all textboxes completly manually.
Manual placement is an experimental feature.

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

text_add_command(commands,"set","display","bubble");
/*Enable manual placement 
 *NOTE: Manual placement is not in the room but on the drawing surface for text.
 *That means 0,0 is the upper left corner and text_get_surface_w,text_get_surface_h
 *the bottom right
 */
text_add_command(commands,"set","manual",true);
/*Set x position...*/
text_add_command(commands,"set","manual_x",text_get_surface_w()/2);
/*...and y position. T bubble that's placed there at the middle of the box.
 *at the specified position. Please note that the bubble won't have a pointer
 *anymore. Because of that you don't have to set an instance.
 *Manually placed bubbles don't check for collision with other bubbles
 */
text_add_command(commands,"set","manual_y",text_get_surface_h()/2);
text_add_command(commands,"set","name","Manual bubble");
text_add_command(commands,"show");
text_add_command(commands,"line","Hey!");
text_add_command(commands,"line","I'm kinda placed in the middle of the screen.");
text_add_command(commands,"bold");
text_add_command(commands,"italic");
text_add_command(commands,"line","Cool!");
text_add_command(commands,"reset_formatting");
text_add_command(commands,"wait_input",1);
text_add_command(commands,"close");
/*You can also use this with pointing or banner. Pointing will still have the
 *pointer. Please note that you CAN change the x position but all values other than
 *0 will not work as expected.
 */
text_add_command(commands,"set","display","pointing");
/*Manual mode is still on.*/
text_add_command(commands,"set","manual_x",0);
text_add_command(commands,"set","manual_y",text_get_surface_h()/2);
text_add_command(commands,"set","name","Manual pointing");
text_add_command(commands,"set","instance",id);
text_add_command(commands,"show");
text_add_command(commands,"line","Me too!");
text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
/*This uses conversation slot 1 because 0 is used by demo10*/
text(commands,0);