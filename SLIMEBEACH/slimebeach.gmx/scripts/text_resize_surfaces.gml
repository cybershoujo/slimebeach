///text_resize_surfaces()

/*  
**  Description:
**      Resizes/Recreate the surface when windows is resized and 
**      on setup of the engine.
**      Change the base width and height when using surfaces!
**      Replace with your own code when not :D
**  
**  Usage:
**      text_resize_surfaces()
**
**  Arguments:
**      <none>
**
**  Returns:
**      <nothing>
**
*/

/*
 * Base with and height of the surface. This MUST be in 16:9 even if your game 
 * is not in 16:9
 * Use the highest value (width or height) of your game as a base and adjust 
 * the other value so it matches the 16:9 ratio
 */
var base_width = 1920;
var base_height= 1080;

text_debugger("text_rsize_surfaces",text_debug.DEBUG,"Resizing surface");

/* This stuff makes sure the textboxes don't get stretched and 
   keep their relative size (much like thr gui) */
var text_gui_ratio = 16/9;
var screen_ratio = view_wport/view_hport;
if (screen_ratio < text_gui_ratio) {
        view_wport_new = base_width*(screen_ratio/text_gui_ratio);
        view_hport_new = view_wport_new/screen_ratio;
    } else {
        view_hport_new = base_height*(screen_ratio/text_gui_ratio);
        view_wport_new = view_hport_new*screen_ratio;
    }
/*****************/ 

if (surface_exists(global.text_surf)) 
    surface_resize(global.text_surf,round(view_wport_new),round(view_hport_new));
else 
    global.text_surf = surface_create(round(view_wport_new),round(view_hport_new));
global.text_old_ratio = view_wport/view_hport;
