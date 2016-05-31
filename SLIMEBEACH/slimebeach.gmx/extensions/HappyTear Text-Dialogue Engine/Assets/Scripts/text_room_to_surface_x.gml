///text_room_to_surface_x(x)

/*  
**  Description:
**      This translates the room coordinates to the coordinates of the surface.
**      Change this if you are not using a surface.
**  
**  Usage:
**      text_room_to_surface_x(x)
**
**  Arguments:
**      x  real   A x position to translate
**
**  Returns:
**      real - translated x position
**
*/

return (argument0-view_xview)*(text_get_surface_w()/view_wview);