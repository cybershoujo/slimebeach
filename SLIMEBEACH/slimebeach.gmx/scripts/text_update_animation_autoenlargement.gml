///text_update_animation_autoenlargement(conversation)

/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Enlarges textbox when text get's to big.
**      Depends on displaystyle. Add the logic for your custom displaystyles
**      in the switch below.
**  
**  Usage:
**      text_update_animation_autoenlargement(conversation)
**
**  Arguments:
**      conversation    ds_map  a ds_map that is placed in global.textvars 
**                              and represents a single conversation.
**
**  Returns:
**      <nothing>
**
*/

var conv = argument0;

//Textbox enlargment depending on line count
//This will loop through all currently loaded textboxes of this conversation
var textboxes = conv[? "__texts"];
for(j=0; j<ds_list_size(textboxes); j+=1) {
    var textbox = ds_list_find_value(textboxes,j);
    var linecount = -1;
    var max_line_width = 0;
    var current_line_width = 0;
        
    var lines = ds_map_find_value(ds_list_find_value(textboxes,j),"__lines");  
        
    for(k=0; k<ds_list_size(lines); k+=1) {
        line = ds_list_find_value(lines,k);
        if (line[? "text"] != "{NL}") {
            current_line_width+=text_string_width(line,textbox);
            if (current_line_width > max_line_width) max_line_width = current_line_width;
        } else {
            linecount++;
            current_line_width=0;
        }
    }
    var displaystyle = textbox[? "display"]
    if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_enlargement"))) {
        script_execute(asset_get_index("text_draw_c_"+displaystyle+"_enlargement"),textbox,linecount,max_line_width);
    } else {
        text_debugger("text_update_animation_autoenlargement",text_debug.DEBUG,"enlargement for "+displaystyle+" does not exist!");
    }
}
