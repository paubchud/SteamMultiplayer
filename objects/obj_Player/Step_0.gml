/// @description Movement & Actions based off of Input
if lobbyHost == 0 then lobbyHost = steam_lobby_get_owner_id()
get_controls(isHost,isLocal)

paddle_movement()


// Logic for shooting a bullet
if (actionKey == 1 && currentCooldown <= 0){
	instance_create_layer(x > room_width/2 ? bbox_left-10 : bbox_right+10,y, "Instances", obj_Bullet)
	currentCooldown = fireCooldown
}

