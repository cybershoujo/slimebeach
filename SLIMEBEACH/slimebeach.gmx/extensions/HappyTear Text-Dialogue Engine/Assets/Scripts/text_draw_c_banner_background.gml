/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**      Draw the background color and/or image. You can usally just call text_draw_c_banner_background
**
**  Usage:
**      text_draw_c_*_background(textbox)
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
if (textbox[? "bgimage"] != noone) {
    //FIXME: Weird alpha issues.
    if (global.text_rounding != 0)
        text_draw_roundrect_texture(Tx,Ty,Tx+Twidth,Ty+Theight,global.text_rounding,textbox[? "bgimage"],9,true);
    else
        text_draw_rectangle_texture(Tx,Ty,Tx+Twidth,Ty+Theight,textbox[? "bgimage"],true);
}
draw_set_alpha(textbox[? "bgalpha"]*sin(textbox[? "__boxanime"]*(pi/2)));
draw_set_color(textbox[? "bgcolor"]);
draw_roundrect_ext(Tx,Ty,Tx+Twidth,Ty+Theight,global.text_rounding,global.text_rounding,false);
draw_set_alpha(1);