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
**      text_draw_c_*_position_manual(textbox)
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


//Setting local variables...
var Twidth = textbox[? "__draw_width"];
var Theight = textbox[? "__draw_height"];

textbox[? "__draw_x"] = (text_get_surface_w()-textbox[? "__draw_width"])/2+real(textbox[? "manual_x"]);
textbox[? "__draw_y"] = real(textbox[? "manual_y"])-Theight/2;
