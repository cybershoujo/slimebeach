/** More information for this script can be found in the banner version of this script */

var textbox = argument0;

//Setting local variables...
var Tx = textbox[? "__draw_x"];
var Ty = textbox[? "__draw_y"];
var Twidth = textbox[? "__draw_width"];
var Theight = textbox[? "__draw_height"];
 
//-------FOLLOW INSTANCE / PLACE AT INSTANCE
//-------PLACE CURSOR THAT FOLLOWS INSTANCE
var tbid = textbox[? "instance"];
if (is_real(tbid)) {inst = real(tbid)}
else inst = instance_nearest(global.text_local_player.x,global.text_local_player.y,tbid)
//Switch to manual fallback mode, if instance doesn't exist
if !instance_exists(inst) {
    textbox[? "manual"] = true
    textbox[? "manual_x"] = text_get_surface_w()/2
    textbox[? "manual_y"] = text_get_surface_h()/2
    Tx = real(textbox[? "manual_x"])-Twidth/2;
    Ty = real(textbox[? "manual_y"])-Theight/2;
} else {
    //Search for instance
    var i_posx=inst.x;
    var i_posy=inst.y;
    Tx = text_room_to_surface_x(i_posx)-Twidth/2;
    var point_xpos = text_room_to_surface_x(i_posx)-16;
//    if (text_room_to_surface_y(i_posy) < text_get_surface_h()/2) {
//        Ty = text_room_to_surface_y(i_posy)+100;
//        point_ypos = Ty;
//        point_spr = -1
//    } else {
        Ty = text_room_to_surface_y(i_posy)-Theight-100;
        point_ypos = Ty+Theight;
        point_spr = 1;
//    }
    //Avoid other bubbles
    var in_i, in_j, in_key, in_Tx, in_Ty, in_Twidth, in_Theight;
    var moved_vert = false;
    in_key= ds_map_find_first(global.textvars);
    //This will loop through all currently loaded texts/dialogs
    for(in_i=0; in_i<ds_map_size(global.textvars); in_i+=1) {
        var in_textboxes = ds_map_find_value(ds_map_find_value(global.textvars,in_key),"__texts")
        //This will loop through all currently loaded textboxes of this conversation
        for(in_j=0; in_j<ds_list_size(in_textboxes); in_j+=1) {
            var in_textbox = ds_list_find_value(in_textboxes,in_j);
            if (!in_textbox[? "manual"] && in_textbox[? "display"] == "bubble" && in_textbox != textbox) {
                in_Tx = in_textbox[? "__draw_x"]; if (is_undefined(in_Tx)) in_Tx = 0;
                in_Ty = in_textbox[? "__draw_y"]; if (is_undefined(in_Ty)) in_Ty = 0;
                in_Twidth = in_textbox[? "__width"]; if (is_undefined(in_Twidth)) in_Twidth = 0;
                in_Theight = in_textbox[? "__height"]; if (is_undefined(in_Theight)) in_Theight = 0;
                //Check if there is a collision
                if (rectangle_in_rectangle(in_Tx,in_Ty,in_Tx+in_Twidth,in_Ty+in_Theight,Tx,Ty,Tx+Twidth,Ty+Theight) ||
                  rectangle_in_rectangle(Tx,Ty,Tx+Twidth,Ty+Theight,in_Tx,in_Ty,in_Tx+in_Twidth,in_Ty+in_Theight)) {
                    if (!moved_vert) {
                        //Step 1: Try to move to other position
                        if (point_spr == 1) {
                            Ty = text_room_to_surface_y(i_posy)+100;
                            point_ypos = Ty;
                            point_spr = -1
                        } else {
                            Ty = text_room_to_surface_y(i_posy)-Theight-100;
                            point_ypos = Ty+Theight;
                            point_spr = 1;
                        }
                        moved_vert = true;
                        //restart
                        in_j = 0;
                        in_i = 0;
                        in_key = ds_map_find_first(global.textvars);
                    } else {
                        //Step 2: Still collision :( Move horizontally
                        //checks where the middle is compared to the other textbox
                        //left half intersects
                        if (Tx+Twidth/2 <= in_Tx+in_Twidth/2) {
                            Tx = in_Tx-Twidth-10
                        }
                        //right half intersects
                        if (Tx+Twidth/2 >= in_Tx+in_Twidth/2) {
                            Tx = in_Tx+in_Twidth+10
                        }
                        moved_vert = false;
                    }
                }
            }
        }
        in_key = ds_map_find_next(global.textvars, in_key);
    }
    //-----DRAW POINTING ARROW
    if (point_xpos > Tx && point_xpos+32 < Tx+Twidth) {
        draw_set_alpha(sin(textbox[? "__boxanime"]*(pi/2)));
        draw_set_color(textbox[? "bgcolor"]);
        draw_triangle(point_xpos,point_ypos,point_xpos+32,point_ypos,point_xpos+16,point_ypos+(point_spr*24),false);
        draw_set_alpha(1);
    }
}
//Apply
textbox[? "__draw_x"] = Tx;
textbox[? "__draw_y"] = Ty;
textbox[? "__draw_width"] = Twidth;
textbox[? "__draw_height"] = Theight;
textbox[? "__draw_bubble_point_spr"] = point_spr;
