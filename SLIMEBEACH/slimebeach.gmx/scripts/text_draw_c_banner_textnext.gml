/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Draw the textnext sprite if there is one.
**      More information can be found in the manual.
**
**  Usage:
**      text_draw_c_*_textnext(textbox)
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
var Tx = textbox[? "__draw_x"];
var Ty = textbox[? "__draw_y"];
var Twidth = textbox[? "__draw_width"];
var Theight = textbox[? "__draw_height"];
draw_sprite_stretched(textbox[? "__textnext"],0,Tx+Twidth-100,Ty+Theight-80,48,48);
