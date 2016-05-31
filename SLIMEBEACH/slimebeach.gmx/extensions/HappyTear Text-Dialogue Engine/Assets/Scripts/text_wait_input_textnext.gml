///text_wait_input_textnext(displaystyle)

/*  SHOULD NOT BE CALLED MANUALLY
**  Description:
**      This function will return a sprite index used with the wait_input<index>
**      You can specify your own sprite heres
**  
**  Usage:
**      text_wait_input_textnext(displaystyle)
**
**  Arguments:
**      index    real  A index
**
**  Returns:
**      sprite index
**
*/

var index = argument0;
text_debugger("text_wait_input_textnext",text_debug.DEBUG,"Return textnext character");

switch (index) {
        case 1:
        default:
            return spr_textnext;
        break;
        case 2:
            return spr_textend;
        break;
    }