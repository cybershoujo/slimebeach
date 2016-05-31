/*  SHOULD NOT BE CALLED MANUALLY
**
**  Usage:
**       text_command_logic_*(conv,current_command)
**
**  MORE INFORMATION ABOUT LOGIC SCRIPTS 
**  AND TEXT COMMANDS CAN BE FOUND IN THE MANUAL
*/

var conv = argument0;
var current_command = argument1;

//Add a line or noline to the requested textbox
text_debugger("text_command_logic_c_line",text_debug.DEBUG,"Adding line or noline");
var textbox_id;
var textboxes = ds_map_find_value(conv,"__texts");
if (array_length_1d(current_command) > 2) {
    textbox_id = ds_list_size(textboxes)-1-current_command[2];
} else {
    textbox_id = ds_list_size(textboxes)-1
}
if (ds_list_size(textboxes) == 0 || ds_list_find_value(textboxes,textbox_id) = -1) {
     text_debugger("text_command_logic_c_line",text_debug.ERROR,"Invalid textbox specified! Skipping command...");
     text_update_logic_continue(conv);
     exit;
}
var textbox = ds_list_find_value(textboxes,textbox_id);
//Don't continue if line was already added and we are only animating
if (textbox[? "__wait_for_animation"]) {
    exit;
}
var lines = textbox[? "__lines"];
var line = ds_map_create();
line[? "text"] = current_command[1];
            
//If no animation: Add to sumchars to contain all characters of this line, so it doesn't get animated
if (!conv[? "animation"]) {
    ds_map_replace(ds_list_find_value(textboxes,textbox_id),"__animatedchars",ds_map_find_value(ds_list_find_value(textboxes,textbox_id),"__animatedchars")+string_length(current_command[1]));
}
//But add to sumchars anyway!
ds_map_replace(ds_list_find_value(textboxes,textbox_id),"__sumchars",ds_map_find_value(ds_list_find_value(textboxes,textbox_id),"__sumchars")+string_length(current_command[1]));
//Add all variables
for (var q = 0;q<array_length_1d(global.textsettings_lines);q++) {
    ds_map_add(line,global.textsettings_lines[q],ds_map_find_value(conv,global.textsettings_lines[q]));
}
line[? "__height"] = 1;

//NEW LINE
if (current_command[0] == "line") {
    text_debugger("text_command_logic_c_line",text_debug.DEBUG,"Added new line");
    var nline = ds_map_create();
    nline[? "text"] = "{NL}";
    ds_list_add(lines, nline);
    ds_list_mark_as_map(lines, ds_list_size(lines)-1);
}
text_debugger("text_command_logic_c_line",text_debug.DEBUG,"Added line");
ds_list_add(lines, line);
ds_list_mark_as_map(lines, ds_list_size(lines)-1);
//Do first animation now
textbox[? "__wait_for_animation"] = true;
//Continue with next command in animation logic
