/** More information for this script can be found in the banner version of this script */

var textbox = argument0;
//Setting local variables...
var Tx = textbox[? "__draw_x"];
var Ty = textbox[? "__draw_y"];
var Twidth = textbox[? "__draw_width"];
var Theight = textbox[? "__draw_height"];

//-------POINTING: ARROW THAT FOLLOWS INSTANCE
var i_posx = noone;
var inst, point_ypos, point_xpos, point_alph, point_spr;
var tbid = textbox[? "instance"];
if (is_real(tbid)) {inst = real(tbid)}
else {
    var player_instance = i[? "player"];  
    inst = instance_nearest(player_instance.x,player_instance.y,tbid);
}
//Don't continue if instance doesn't exist
if !instance_exists(inst) {
    exit;
}
inst_x = inst.x;
point_xpos = text_room_to_surface_x(inst_x)-32;
if (Ty > text_get_surface_h()/2) {
    point_ypos = Ty
    point_spr = -1
} else {
    point_ypos = Ty+Theight;
    point_spr = 1
}
                    
var addition = 0;
//add size of nameplate if nessc.
if (textbox[? "name"] != "false") {
    addition = 30+(string_width(textbox[? "name"])+28);
}
                    
//Fade cursor out at edges of textbox
if (point_xpos-(Twidth/5)-addition < Tx) {
    point_alph = (point_xpos-Tx-addition)/(Twidth/5);
} else if (point_xpos+Twidth-(Twidth/5) > Tx) {
    point_alph = ((Tx+Twidth)-point_xpos)/(Twidth/5);
} else {
    point_alph = 1;
}
//DRAW!
draw_set_color(textbox[? "bgcolor"]);
draw_set_alpha(point_alph*sin(textbox[? "__boxanime"]*(pi/2)));
draw_triangle(point_xpos,point_ypos,point_xpos+(64),point_ypos,point_xpos+(32),point_ypos+(point_spr*(48*sin(textbox[? "__boxanime"]*(pi/2)))),false);
draw_set_alpha(1);
