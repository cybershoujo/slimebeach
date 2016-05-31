///text_draw_logic()

/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      This runs the whole drawing logic.
**  
**  Usage:
**      text_draw_logic()
**
**  Arguments:
**      <none>
**
**  Returns:
**      <nothing>
**
*/

var key;
key= ds_map_find_first(global.textvars);
//This will loop through all currently loaded conversations
for(i=0; i<ds_map_size(global.textvars); i+=1) {
    var textboxes = ds_map_find_value(ds_map_find_value(global.textvars,key),"__texts")
    //This will loop through all currently loaded textboxes of this conversation
    for(j=0; j<ds_list_size(textboxes); j+=1) {
        //-------LET'S GO DRAWING!
        var Twidth,Theight,Tx,Ty;
        var textbox = ds_list_find_value(textboxes,j);
        
        //-------ROOMCHECK
        //Don't draw when in different room
        if (textbox[? "room"] != room) exit;
        
        textbox[? "__draw_width"] = textbox[? "__width"];
        textbox[? "__draw_height"] = textbox[? "__height"];
        textbox[? "__draw_x"] = 0;
        textbox[? "__draw_y"] = 0;
        var displaystyle = textbox[? "display"];
        
        //-------MANUAL PLACEMENT
        if (textbox[? "manual"] == true) {
            if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_position_manual"))) {
                script_execute(asset_get_index("text_draw_c_"+displaystyle+"_position_manual"),textbox);
            } else {
                text_debugger("text_draw_logic",text_debug.WARNING,"position_manual for "+displaystyle+" does not exist! Falling back to default.");
            }
        }
        //-------AUTOMATIC PLACEMENT
        else {
            if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_position_auto"))) {
                script_execute(asset_get_index("text_draw_c_"+displaystyle+"_position_auto"),textbox);
            } else {
                text_debugger("text_draw_logic",text_debug.WARNING,"position_auto for "+displaystyle+" does not exist! Falling back to default.");
            }
        }
        //-------ADD NAME IF NEEDED
        if (textbox[? "name"] != "false") {
            if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_name"))) {
                script_execute(asset_get_index("text_draw_c_"+displaystyle+"_name"),textbox);
            } else {
                text_debugger("text_draw_logic",text_debug.INFO,"name for "+displaystyle+" does not exist!");
            }
        }
        //-------DRAW BACKGROUND
        if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_background"))) {
            script_execute(asset_get_index("text_draw_c_"+displaystyle+"_background"),textbox);
        } else {
            text_debugger("text_draw_logic",text_debug.INFO,"background for "+displaystyle+" does not exist!");
        }
        //-------DRAW TEXTNEXT
        if (textbox[? "__textnext"] != noone) {
            if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_textnext"))) {
                script_execute(asset_get_index("text_draw_c_"+displaystyle+"_textnext"),textbox);
            } else {
                text_debugger("text_draw_logic",text_debug.INFO,"textnext for "+displaystyle+" does not exist!");
            }
        }
        //-------DRAW EXTRA [additional stuff]
        if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_extra"))) {
            script_execute(asset_get_index("text_draw_c_"+displaystyle+"_extra"),textbox);
        } else {
            text_debugger("text_draw_logic",text_debug.DEBUG,"extra for "+displaystyle+" does not exist!");
        }
        //-------DRAW TEXT
        text_draw_text(textbox);
    }
    key = ds_map_find_next(global.textvars, key);
}
draw_set_alpha(1)