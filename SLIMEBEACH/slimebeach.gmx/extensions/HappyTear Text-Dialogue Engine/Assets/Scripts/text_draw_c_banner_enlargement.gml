/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Set the position of the textbox. Can also already used to draw stuff.
**      It get's called when manual positioning is enabled.
**      This script should set the x position and the y position of the textbox
**      [__draw_x and __draw_y in the textbox]
**      width and height is set to be the calculated width and height by default.
**      If you want to you can also change them here.
**      __draw_x and __draw_y are usally set to manual_x and manual_y here.
**      Call the banner version of this script in your position_manual 
**      if you simply want to do that.
**
**  Usage:
**      text_draw_c_*_enlargement(textbox)
**
**  Arguments:
**      textbox        ds_map   a ds_map that is placed in the textbox list of a
**                              conversation. It represents a textbox.
**      linecount      real     Number of lines in this box  
**      max_line_width real     The width of the longest line
**
**  Returns:
**      <nothing>
**
*/

var textbox = argument0;
var linecount = argument1;
var max_line_width = argument2;


for (var line=2;line < linecount;line++) {
    if (linecount > line) {
        var newheight = 1260/5+72*(line-1)
        if (textbox[? "__height"] < newheight) {
            textbox[? "__height"]+=10;
            if (textbox[? "__height"] > newheight) {
                textbox[? "__height"] = newheight;
            }
        }
    }
}