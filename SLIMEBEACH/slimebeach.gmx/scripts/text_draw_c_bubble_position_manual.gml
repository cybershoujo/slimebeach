/** More information for this script can be found in text_draw_c_banner_metadata */

var textbox = argument0;

//Setting local variables...
var Twidth = textbox[? "__draw_width"];
var Theight = textbox[? "__draw_height"];

textbox[? "__draw_x"] = real(textbox[? "manual_x"])-Twidth/2;
textbox[? "__draw_y"] = real(textbox[? "manual_y"])-Theight/2;

textbox[? "__draw_bubble_point_spr"] = 1;
