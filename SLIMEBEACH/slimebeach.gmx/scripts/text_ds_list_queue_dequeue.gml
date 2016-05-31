///text_ds_list_queue_dequeue(ds_list)

/*  
**  Description:
**      Is the implementation of a quque command for a list.
**      Lists are used because they can be convered to json.
**  
**  Usage:
**      text_ds_list_queue_dequeue(ds_list)
**
**  Arguments:
**      ds_list
**
**  Returns:
**      <nothing>
**
*/

var ret = text_ds_list_queue_head(argument0);
ds_list_delete(argument0,0);
