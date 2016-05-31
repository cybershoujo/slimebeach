/** 
This demo shows that there can be multiple conversations on one instance
running at the same time.
See obj_text_demo_multi.

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

text_add_command(commands,"set","speed",3);
text_add_command(commands,"set","position","bottom");
text_add_command(commands,"show");
text_add_command(commands,"line","This is text number 2.");
text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
/*This uses conversation slot 1 because 0 is used by demo10*/
text(commands,1);