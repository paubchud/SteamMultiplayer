/// @description Movement & Actions based off of Input
get_controls(isHost, isLocal);

paddle_movement();


// Logic for shooting a bullet
<<<<<<< HEAD
if (actionKey == 1 && currentCooldown <= 0)
{
	instance_create_depth(x > room_width/2 ? bbox_left-10 : bbox_right+10,y, -100, obj_Bullet);
	currentCooldown = fireCooldown;
=======
if (actionKey == 1 && currentCooldown <= 0){
	instance_create_layer(x > room_width/2 ? bbox_left-10 : bbox_right+10,y, "Instances", obj_Bullet)
	currentCooldown = fireCooldown
>>>>>>> episode4
}

