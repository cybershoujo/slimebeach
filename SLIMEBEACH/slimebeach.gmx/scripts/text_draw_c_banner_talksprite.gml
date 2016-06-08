/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Draw the talksprite (only if name is not set to "false"!)
**      Mor information about names can be found in the manual
**
**  Usage:
**      text_draw_c_*_talksprite(textbox)
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
image_speed = 0.2
//Setting local variables...
var Tx = textbox[? "__draw_x"];
var Ty = textbox[? "__draw_y"];
var Twidth = textbox[? "__draw_width"];
var Theight = textbox[? "__draw_height"];

draw_set_alpha(1);
draw_set_color(textbox[? "color_nameplate"]);
draw_sprite(textbox[? "talksprite"], image_index, Tx + Twidth - 170, Ty);
draw_set_alpha(1);
