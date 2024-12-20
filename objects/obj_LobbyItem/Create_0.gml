/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = 5
image_yscale = .5

selectAction = function()
{
	global.server = instance_create_depth(0,0,0,obj_Server);
	steam_lobby_join_id(lobby_id);
	room_goto_next();
}