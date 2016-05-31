///text_draw_text(textbox)

/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      This draws the actual text on your textbox
**  
**  Usage:
**      text_draw_text(textbox)
**
**  Arguments:
**      textbox    ds_map       a ds_map that is placed in the textbox list of a
**                              conversation. It represents a textbox.
**
**  Returns:
**      <nothing>
**
*/

//When making changes here, please make sure to change text_string_width as well!

var textbox = argument0;
var Tx = textbox[? "__draw_x"];
var Ty = textbox[? "__draw_y"];

var displaystyle = textbox[? "display"];

text_debugger("text_draw_text",text_debug.DEBUG,"Draw text...");

//Load displaystyle metadata
if (script_exists(asset_get_index("text_draw_c_"+displaystyle+"_metadata"))) {
    var ret = script_execute(asset_get_index("text_draw_c_"+displaystyle+"_metadata"),textbox);
    var fntname_add = ret[0];
    var Tspace_top = ret[1];
    var Tspace_left = ret[2];
    var Tspace_lineheight = ret[3];
} else {
    text_debugger("text_draw_text",text_debug.WARNING,"metadata for "+displaystyle+" does not exist! Falling back to default.");
    var fntname_add = "";
    var Tspace_top = 16;
    var Tspace_left = 64;
    var Tspace_lineheight = 72;
}



var linenum = 0;
var bold;
var italic;
var color;
var line;
var line_count = -1;
//An offset [not an actual buffer] that is the length of all previous text in that line. 
//This is used to draw text in the same line at the right x-pos
var buffer = 0;
         
var lines = ds_map_find_value(textbox,"__lines");
var sumchars = 0; //All already checked characters        
        
for(k=0; k<ds_list_size(lines); k+=1) {
    line = ds_list_find_value(lines,k);
    //ignore all lines that contain no animated characters, so the currently drawn line is always
    //the bottom one
    if (sumchars < textbox[? "__animatedchars"] and line[? "text"] != "{NL}") {
        var bold = line[? "bold"];
        var italic = line[? "italic"];
        var color = line[? "color"];
        var fntname = line[? "font"];
        //Set fonts
        draw_set_colour(color);
        if (bold & italic) {
            draw_set_font(asset_get_index(fntname+fntname_add+"_bold_italic"));
        } else if (bold) {
            draw_set_font(asset_get_index(fntname+fntname_add+"_bold"));
        } else if (italic) {
            draw_set_font(asset_get_index(fntname+fntname_add+"_italic"));
        } else {
            draw_set_font(asset_get_index(fntname+fntname_add));
        }
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
        draw_set_color(color);
        draw_set_alpha(sin(textbox[? "__boxanime"]*(pi/2)));
        //the whole line is still visible
        if (sumchars+string_length(line[? "text"]) < textbox[? "__animatedchars"]) {
            draw_text_transformed(Tx+Tspace_left+buffer,Ty+Tspace_top+(Tspace_lineheight*line_count),line[? "text"],1,line[? "__height"],0);
            var tw = string_width(line[? "text"]);
            buffer+=tw;
        } else {
            //or maybe not?
            var remaining = real(textbox[? "__animatedchars"])-sumchars;
            draw_text_transformed(Tx+Tspace_left+buffer,Ty+Tspace_top+(Tspace_lineheight*line_count),string_copy(line[? "text"], 1, remaining),1,line[? "__height"],0);
            var tw = string_width(string_copy(line[? "text"], 1, remaining));
            buffer+=tw;
        }
        line[? "__txt_width"] = tw+Tspace_left;
        sumchars += string_length(line[? "text"]);
        } else if (line[? "text"] == "{NL}") {
            //New Line!
            buffer = 0;
            line_count++;
    }
}