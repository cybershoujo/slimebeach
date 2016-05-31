//text_draw()

/*
**  Description:
**      This will draw all textboxes
**      This script should be called in some kind of draw event.
**  
**  Usage:
**      text_draw()
**
**  Arguments:
**      <none>
**
**  Returns:
**      <nothing>
**
*/

//Recreate surface if destroyed or if window was resized
if (!surface_exists(global.text_surf) || global.text_old_ratio != view_wport/view_hport) {
    text_resize_surfaces();
}
surface_set_target(global.text_surf);
draw_clear_alpha(c_white,0);
text_draw_logic();
surface_reset_target();

draw_surface_stretched(global.text_surf,view_xview[0],view_yview[0],view_wview[0],view_hview[0]);