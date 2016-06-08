///text_setup()

/*  
**  Description:
**      This script set's up the HappyTear Text Engine and has to be called
**      once before calling any other text_ command.
**      Here you can do basic configuration on the engine and find out how
**      too customize it even further.
**  
**  Usage:
**      text_setup()
**
**  Arguments:
**      <none>
**
**  Returns:
**      <nothing>
**
*/

/***** DEBUG LEVELS *****/
/* 
 * This enum contains the debug levels. Just leave it as it is
 */

enum text_debug {NONE=-1,DEBUG=0,INFO=1,WARNING=2,ERROR=3,CRITICAL=4};

/* 
 * Set the level of debug. The debug messages of this level and higher
 * will be shown. NONE disables debug messages.
 */
global.text_debug_level = text_debug.INFO;

text_debugger("text_setup",text_debug.DEBUG,"SETTING UP TEXT ENGINE");

/***** BASIC SETUP *****/
/* 
 * This ds_map will contain all conversations.
 * No change required.
 */
global.textvars = ds_map_create();

/* 
 * Local player instance or object. 
 * Set this to your player instance or player object for single player games
 * This is used for the engine to determine which player controls the conversations
 * in multiplayer games
 * If you don't have players in your game set this to any controling object.
 */
global.text_local_player = obj_player.id;

/*
 * Rounding of the nameplates
 */
global.text_roundingname = 20;

/*
 * Rounding of the textboxes
 */
global.text_rounding = 20;

/*
 * Set this to true do disabled box fading in and out animations
 */
global.text_boxanimation = true;

/*
 *  Disappear distance.
 *  If disappear is set to true, textboxes will disappear when you walk the
 *  specified amount of pixels away from the instance creating them.
 */
global.text_distance = 250;

/***** MULTIPLAYER SUPPORT *****/

/* 
 * List of players - For multiplayer games.
 * No change required.
 */
global.text_players = ds_list_create();

/* 
 * Add local player to the player list.
 * If you are making a single player game or a mutliplayer game where 
 * your player only sees his textboxes and they don't get synced 
 * just leave he line below as it is.
 * Otherwise make sure you add all player instances to this list and 
 * remove them when needed if they disconnect.
 */
ds_list_add(global.text_players,global.text_local_player);

/***** DRAWING SURFACE *****/
 
/*
 * Surface for drawing the text. Will be created later
 * You can also modify the code in text_draw to not draw on a
 * surface. For more information on not drawing on a surface can 
 * be found in the manual
 */
 
global.text_surf = 0;

/*
 * This script setups the surfaces.
 * It also gets called when the window is resized in text_draw.
 * !!! YOU HAVE TO MAKE ADDITIONAL CHANGES IN THIS SCIRPT. !!!
 */
text_resize_surfaces();

/***** TEXT ENGINE VARIABLES *****/

/*List of all variables:
 *All variables for the conversation must be added to the list in 
 * "text_create_conversation" 
 * with a default.
 *These will be copied over to textboxes according to the lists you set below.
 *[If you want to add internal variables to the textboxes, 
 *you can do that in text_update_logic]
*/

/*
 * List of all settings to be copied to textboxes when they are created
 */
global.textsettings[0] = "display";
global.textsettings[1] = "position";
global.textsettings[2] = "manual";
global.textsettings[3] = "manual_x";
global.textsettings[4] = "manual_y";
global.textsettings[5] = "instance";
global.textsettings[6] = "name";
global.textsettings[7] = "bgcolor";
global.textsettings[8] = "bgalpha";
global.textsettings[9] = "bgimage";
global.textsettings[10] = "room";
global.textsettings[11] = "bgcolor_nameplate";
global.textsettings[12] = "color_nameplate";
global.textsettings[13] = "font_nameplate";
global.textsettings[14] = "talksprite";

/*
 * List of all settings to be copied to lines and nolines when they are created
 * Note for modders: These actually get copied from the conversation not the 
 * textbox.
 */
global.textsettings_lines[1] = "bold";
global.textsettings_lines[2] = "italic";
global.textsettings_lines[3] = "color";
global.textsettings_lines[4] = "font";

/***** 

    All other scripts that are used to change the behaviour of the engine 
    can be found in "configuration".
    What they do is described in each file and in the manual.
 
   *****/

/***** 
    More information can be found in the manual
   *****/

   
   
   

//==== END CONFIG

//See text_action_pressed for details on this variable:
global.text_pressed = false;
