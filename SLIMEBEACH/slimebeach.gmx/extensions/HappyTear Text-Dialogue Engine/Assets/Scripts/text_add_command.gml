///text_add_command(command list,command,argument1,argument2,...)

/*  
**  Description:
**      Add a command to a conversation command list
**  
**  Usage:
**      text_add_command(command list,command,argument1,argument2,...,argument13)
**
**  Arguments:
**      command_list    ds_list   A ds_list used to store this command
**      command         string    The name of the text command
**      argument1-13    <varies>  arguments for the text command
**
**  Returns:
**      <nothing>
**
*/

//adds a command to a ds queue made for text commands
//text_add_command(<queue>,<command>,<arg1>,<arg2>,...)) | maximum number of arguments: 16
var lst = ds_list_create();
for (var i = 0;i < argument_count-1;i++) {
    ds_list_add(lst,argument[i+1]);
}
ds_list_add(argument[0],lst);
if (os_browser == browser_not_a_browser)
   ds_list_mark_as_list(argument[0],ds_list_size(argument[0])-1);