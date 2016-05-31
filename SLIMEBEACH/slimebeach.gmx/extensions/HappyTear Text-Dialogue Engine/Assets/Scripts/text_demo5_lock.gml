/** 
This demo shows you, that you can also lock players

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

/*You can use lock_players to lock the player; This can be called at any time*/
/*Please note that other conversations can override the locking of the player*/
text_add_command(commands,"lock_player",true);
text_add_command(commands,"show");
text_add_command(commands,"line","HA! You are trapped now!");
text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
/*IMPORTANT: Make sure you unlock the player again or he will be stuck!*/
text_add_command(commands,"lock_player",false);

text(commands,0);