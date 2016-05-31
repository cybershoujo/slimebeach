///draw_roundrect_texture(x, y, x2, y2, rounding, background, circle precision, repeat)

//Can also be found on the marketplace [HappyTearParakoopa] :)

//Draws a textured rounded rectangle
//Does not work on HTML5

var ax = argument0;
var ay = argument1;
var ax2 = argument2;
var ay2 = argument3;
var rounding = argument4/2;
var bkg = argument5;
var prec = argument6;
var arepeat = argument7;

var axscale = 1; var ayscale = 1;
if (arepeat) {
    var axscale = (ax2-ax)/background_get_width(bkg);
    var ayscale = (ay2-ay)/background_get_height(bkg);
}

var tex = background_get_texture(bkg);

draw_set_color(c_white);
texture_set_repeat(true);
draw_primitive_begin_texture(pr_trianglefan, tex);
for(var i = 360; i >= 270; i -= 90/prec) {
    draw_vertex_texture(
       ax+rounding-lengthdir_x(rounding, i), 
       ay+rounding-lengthdir_y(rounding, i), 
       (ax+rounding-lengthdir_x(rounding, i))/(ax2-ax)*axscale, 
       (ay+rounding-lengthdir_y(rounding, i))/(ay2-ay)*ayscale
    );
}
for(var i = 90; i >= 0; i -= 90/prec) {
    draw_vertex_texture(
       ax2-rounding+lengthdir_x(rounding, i), 
       ay+rounding+lengthdir_y(rounding, i), 
       (ax2-rounding+lengthdir_x(rounding, i))/(ax2-ax)*axscale, 
       (ay+rounding+lengthdir_y(rounding, i))/(ay2-ay)*ayscale
    );
}
for(var i = 180; i >= 90; i -= 90/prec) {
    draw_vertex_texture(
       ax2-rounding-lengthdir_x(rounding, i), 
       ay2-rounding-lengthdir_y(rounding, i), 
       (ax2-rounding-lengthdir_x(rounding, i))/(ax2-ax)*axscale, 
       (ay2-rounding-lengthdir_y(rounding, i))/(ay2-ay)*ayscale
    );
}
for(var i = 270; i >= 180; i -= 90/prec) {
    draw_vertex_texture(
       ax+rounding+lengthdir_x(rounding, i), 
       ay2-rounding+lengthdir_y(rounding, i), 
       (ax+rounding+lengthdir_x(rounding, i))/(ax2-ax)*axscale, 
       (ay2-rounding+lengthdir_y(rounding, i))/(ay2-ay)*ayscale
    );
}
draw_primitive_end();