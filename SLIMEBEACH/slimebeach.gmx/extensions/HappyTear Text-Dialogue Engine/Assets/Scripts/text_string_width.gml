///text_ds_list_queue_dequeue(line,textbox)

/*  
**  Description:
**      Returns the string_width of the line[? "text"] of the 
**      line with the font defined in the line and textbox
**  
**  Usage:
**      text_ds_list_queue_dequeue(line,textbox)
**
**  Arguments:
**      line    ds_map  The current line to check for
**      textbox ds_map  The texbox this line is in
**
**  Returns:
**      <nothing>
**
*/


var line = argument0;
var textbox = argument1;

if (is_undefined(line[? "__txt_width"])) return 0;

return line[? "__txt_width"];