/** 
This demo shows that there can be multiple conversations on one instance
running at the same time.
See obj_text_demo_multi.

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

text_add_command(commands,"set","speed",1);
text_add_command(commands,"show");
text_add_command(commands,"line","This is text number 1.");
text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
text(commands,0);