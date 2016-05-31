/** More information for this script can be found in the banner version of this script */
var textbox = argument0;
var linecount = argument1;
var max_line_width = argument2;

var newheight = 32+36*(linecount+2);
var newwidth = 32+max_line_width;
if (textbox[? "__height"] < newheight) {
    textbox[? "__height"]+=10;
    if (textbox[? "__height"] > newheight) {
        textbox[? "__height"] = newheight;
    }
}
if (textbox[? "__width"] < newwidth) {
    textbox[? "__width"]+=10;
    if (textbox[? "__width"] > newwidth) {
        textbox[? "__width"] = newwidth;
    }
}
