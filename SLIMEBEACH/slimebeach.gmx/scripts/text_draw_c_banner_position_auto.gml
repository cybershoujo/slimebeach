/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Set the position of the textbox. Can also already used to draw stuff.
**      It get's called when manual positioning is disabled.
**      This script should set the x position and the y position of the textbox
**      [__draw_x and __draw_y in the textbox]
**      width and height is set to be the calculated width and height by default.
**      If you want to you can also change them here.
**
**  Usage:
**      text_draw_c_*_position_auto(textbox)
**
**  Arguments:
**      textbox    ds_map       a ds_map that is placed in the textbox list of a
**                              conversation. It represents a textbox.
**
**  Returns:
**      <nothing>
**
*/

var textbox = argument0;

textbox[? "__draw_x"] = (text_get_surface_w()-textbox[? "__draw_width"])/2;
 
//-------PLACE AT TOP OR BOTTOM
if (textbox[? "position"] == "bottom") {
    textbox[? "__draw_y"] = text_get_surface_h()-24-28-40-textbox[? "__draw_height"];
}
else {
    textbox[? "__draw_y"] = 24;
}
