/** More information for this script can be found in the banner version of this script */

var textbox = argument0;
//Setting local variables...
var Tx = textbox[? "__draw_x"];
var Ty = textbox[? "__draw_y"];
var Twidth = textbox[? "__draw_width"];
var Theight = textbox[? "__draw_height"];
var point_spr = textbox[? "__draw_bubble_point_spr"];

var add_name,add_name2;
if (textbox[? "manual"]) {
    var add_name = Theight+40;
    var add_name2 = Theight+60;
} else {
    if (point_spr == -1) {
        var add_name = Theight+40;
        var add_name2 = Theight+60;
    } else {
        var add_name = 0;
        var add_name2 = 0;
    }
}
draw_set_color(textbox[? "bgcolor_nameplate"]);
draw_set_alpha(sin(textbox[? "__boxanime"]*(pi/2)));
draw_set_font(asset_get_index(textbox[? "font_nameplate"]+"_small"))
draw_roundrect_ext(Tx+5,Ty-60+add_name,Tx+10+string_width(textbox[? "name"])+5,Ty-60+add_name+80,global.text_roundingname,global.text_roundingname,false);
draw_set_color(textbox[? "color_nameplate"])
draw_text(Tx+10,Ty-50+add_name2,textbox[? "name"]);
draw_set_alpha(1);