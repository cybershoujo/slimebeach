/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Draw the nameplate (only if name is not set to "false"!)
**      Mor information about names can be found in the manual
**
**  Usage:
**      text_draw_c_*_name(textbox)
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

draw_set_alpha(sin(textbox[? "__boxanime"]*(pi/2)));
draw_set_color(textbox[? "bgcolor_nameplate"]);
draw_set_font(asset_get_index(textbox[? "font_nameplate"]));
draw_roundrect_ext(Tx+30,Ty+Theight-10,Tx+30+string_width(textbox[? "name"])+28,+Ty+Theight+102,global.text_roundingname,global.text_roundingname,false);
draw_set_color(textbox[? "color_nameplate"]);
draw_text(Tx+48,Ty+Theight+10,textbox[? "name"]);
draw_set_alpha(1);
