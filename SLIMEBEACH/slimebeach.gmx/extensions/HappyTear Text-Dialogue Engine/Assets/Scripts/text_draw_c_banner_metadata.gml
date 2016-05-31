/*  SHOULD NOT BE CALLED MANUALLY
**
**  Description:
**    Return the following metadata as an array:
**      0:fntnameadd [string]
**      If you want to use this display style to use a different version of a font
**      use this to append a custom string to the fontname when drawing the text
**      You can for example make smaller versions for smaller displaystyles with that.
**      1:topspacing [real]
**      How much the text is placed down in the textbox.
**      2:leftspacing [real]
**      How much the text is placed left in the textbox.
**      3:lineheight [real]
**      Specify how high a single line is with your display style
*+      4:initial width[real]
*+      4:initial height[real]
**  
**  Usage:
**      text_draw_c_*_metadata()
**
**  Arguments:
**      <none>
**
**  Returns:
**      array<see above>
**
*/
var ret;
ret[0] = ""; //fntnameadd
ret[1] = 16; //topsapcing
ret[2] = 32; //leftsapcing
ret[3] = 72; //lineheight
ret[4] = 1260;//w
ret[5] = 1260/5;//h
return ret;