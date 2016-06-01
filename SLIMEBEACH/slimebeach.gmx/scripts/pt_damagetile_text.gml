var commands = ds_list_create();

text_add_command(commands,"set","display","bubble")
text_add_command(commands,"show");
text_add_command(commands,"line","owie!");

obj_player.hp -= 25;

text_add_command(commands,"wait_input",2);
text_add_command(commands,"close");
text(commands,0);
