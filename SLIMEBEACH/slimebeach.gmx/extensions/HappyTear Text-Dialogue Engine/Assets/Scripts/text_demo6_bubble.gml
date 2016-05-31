/** 
A demo of the true awesome thing: BUBBLES!

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

/*In this demo we want to show you the bubble display style! So let's enable that*/
text_add_command(commands,"set","display","bubble");
/*Like pointing, bubble needs an instance and it can also have a name*/
text_add_command(commands,"set","instance",id);
text_add_command(commands,"set","name","Man number 6");
text_add_command(commands,"show");
text_add_command(commands,"line","Woah! Bubbles!");
text_add_command(commands,"line","Awesome!");
text_add_command(commands,"wait_input",1);
    /*The real fun begins when you have multiple bubbles*/
    /*Let's set this bubble to follow the player*/
    text_add_command(commands,"set","instance",global.text_local_player);
    text_add_command(commands,"set","name","Player");
    text_add_command(commands,"show");
    text_add_command(commands,"line","Yeah! You are right!");
/*Clear the man's bubble*/
text_add_command(commands,"next_page",1);
text_add_command(commands,"line","And the best thing is...",1);
text_add_command(commands,"wait_input",1,1);
text_add_command(commands,"line","They are automatically",1);
text_add_command(commands,"line","E",1);
text_add_command(commands,"line","X",1);
text_add_command(commands,"line","P",1);
text_add_command(commands,"line","A",1);
text_add_command(commands,"line","N",1);
text_add_command(commands,"line","D",1);
text_add_command(commands,"line","I",1);
text_add_command(commands,"line","N",1);
text_add_command(commands,"line","G",1);
text_add_command(commands,"wait_input",1,1);
/*We are closing the bubble of the man here*/
text_add_command(commands,"close",1);
    text_add_command(commands,"next_page");
    text_add_command(commands,"line","In all directions. Even to the left and to the right. There is practically no limit.");
    text_add_command(commands,"wait_input",2);
    text_add_command(commands,"close");

text(commands,0);