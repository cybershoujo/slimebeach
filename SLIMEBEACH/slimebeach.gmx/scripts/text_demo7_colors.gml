/** 
A demo showing off colors, formating and background images
This demo also demonstrates how text can simply be triggered by walking by
For this see the object obj_text_demo_walkby, this is the object controling
this!

All formatting here is shown with the bubble display style.
It can be used on all display styles.

NOTE: COMMANDS OF THE PREVIOUS DEMOS ARE NOT EXPLAINED
**/
  
var commands = ds_list_create();

text_add_command(commands,"set","display","bubble");
text_add_command(commands,"set","instance",id);
text_add_command(commands,"set","name","Man number 6");
text_add_command(commands,"show");
text_add_command(commands,"line","Hi. We are just talking...");
    /*Let's create another textbox. The generic man placed in the room will
     *say this text*/
    text_add_command(commands,"set","instance",obj_text_demo_nothing);
    text_add_command(commands,"set","name","A generic man");
    text_add_command(commands,"show");
    text_add_command(commands,"line","...while the player runs by.");
    text_add_command(commands,"wait_time",3);
    text_add_command(commands,"close");
text_add_command(commands,"wait_time",1);
text_add_command(commands,"next_page");
/*Okay enoutgh playing arround. Let's start formating text!*/
text_add_command(commands,"line","Text can also be ");
/*Set the text to be bold by simply calling bold*/
/*This will affect all NEW nonlines and lines FOR ALL TEXTBOXES*/
text_add_command(commands,"bold");
/*We are using a noline without a pause here. This will simply print the
 *bold text without any interuptions*/
text_add_command(commands,"noline","bold");
/*use bold with false to unset it.*/
text_add_command(commands,"bold",false);
text_add_command(commands,"noline",", ");
/*Italic behaves just the same as bold*/
text_add_command(commands,"italic");
text_add_command(commands,"noline","italic");
text_add_command(commands,"italic",false);
text_add_command(commands,"noline",", ");
/*You can also enable both...*/
text_add_command(commands,"bold");
text_add_command(commands,"italic");
text_add_command(commands,"line","and both! ");
/*...and unset all formating with reset_formatting (also color)*/
text_add_command(commands,"reset_formatting");
text_add_command(commands,"line","It can also have");
/*Set the color with color and an argument that is a game maker color
 *behaves like bold and italic*/
text_add_command(commands,"color",make_colour_rgb(0,255,0));
text_add_command(commands,"line","a different color");
text_add_command(commands,"reset_formatting");
text_add_command(commands,"noline",".");
text_add_command(commands,"wait_time",2);
text_add_command(commands,"close");
/*We are opening a new textbox. We just closed the last one
 *THIS ONE WILL BE OPENED WITH THE GENERIC MAN
 *because that is what the last setting it.
 */
/*But before we do that: Background color!*/
/*Background color is set via a variable and applies for newly opened boxes.*/
text_add_command(commands,"set","bgcolor",c_red);
/*You can also change the nameplate color like that*/
text_add_command(commands,"set","bgcolor_nameplate",c_blue);
/*And the nameplate text color: NOTE this as variable not a command like color!*/
text_add_command(commands,"set","color_nameplate",c_red);
text_add_command(commands,"show");
text_add_command(commands,"line","Also set your background colors!");
text_add_command(commands,"wait_time",2);
    text_add_command(commands,"set","instance",id);
    /*We actually have to reset the settings for new textboxes...*/
    /*We are planning to add a function to easily get you the defaults*/
    text_add_command(commands,"set","bgcolor",c_white);
    text_add_command(commands,"set","bgcolor_nameplate",c_white);
    text_add_command(commands,"set","color_nameplate",c_black);
    text_add_command(commands,"set","instance",id);
    text_add_command(commands,"set","name","Man number 6");
    /*Background images! They are placed under the background color!
     *Because of this you have to change the alpha of the background color.
     *You can do that with bggalpha. Setting it to zero means full transparency.
     */
    text_add_command(commands,"set","bgalpha",0);
    /*Okay, the background can be any background resource that has "Used for 3D"
     *enabled and which size is a power of two (eg. 16x16,32x32 etc.)
     *It will get tiled. Currently the do not apply to the nameplate
     */
    text_add_command(commands,"set","bgimage",bkg_sign_new);
    text_add_command(commands,"show");
    text_add_command(commands,"line","And background images!");
    text_add_command(commands,"wait_time",1);
text_add_command(commands,"close",1);
    text_add_command(commands,"line","");
    text_add_command(commands,"line","I'll go now!");
    text_add_command(commands,"wait_time",1);
    text_add_command(commands,"close");

/* Not shown in this demo: You can set a different font via the COMMAND font 
 * (acts like color,bold and italic) or the VARIABLE font_nameplate for 
 * font on the nameplate (for newly opened textboxes
 */

text(commands,0);
