function get_controls(_is_host, _is_local)
{
	if _is_host {
	//Directions inputs
	rightKey = keyboard_check(vk_right) ||keyboard_check(ord("D")) || gamepad_button_check( 0, gp_padr );
	leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check( 0, gp_padl );
	downKey  = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check( 0, gp_padd );
	upKey  = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check( 0, gp_padu );
	allDir = rightKey+leftKey+downKey+upKey
	xInput = (rightKey - leftKey)
	yInput = (downKey - upKey)
	
	//Action inputs
	runKey = keyboard_check(vk_shift) || gamepad_button_check( 0, gp_face3 );
	actionKey = keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_check( 0, gp_face2 );
	
	
	if (allDir + runKey + actionKey == 0) then return
	
	//Send Host Input to Clients
	var _input = {steamID: obj_Server.steamID, xInput:xInput, yInput:yInput, runKey:runKey, actionKey:actionKey}
	send_player_input_to_clients(_input)
	
	}
	else if (_is_local) {
		
	//Directions inputs
	var _rightKey = keyboard_check(vk_right) ||keyboard_check(ord("D")) || gamepad_button_check( 0, gp_padr );
	var _leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check( 0, gp_padl );
	var _downKey  = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check( 0, gp_padd );
	var _upKey  = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check( 0, gp_padu );
	
	//Action inputs
	var _runKey = keyboard_check(vk_shift) || gamepad_button_check( 0, gp_face3 );
	var _actionKey = keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_check( 0, gp_face2 );
	
	//Send input to Server
	var _input = {rightKey:_rightKey, leftKey:_leftKey, downKey:_downKey, upKey:_upKey, runKey:_runKey, actionKey:_actionKey}
	send_player_input(_input);
	}

}

function init_controls(){
	//Directions inputs
	rightKey	= 0
	leftKey		= 0
	downKey		= 0
	upKey		= 0
	
	xInput = 0
	yInput = 0
	
	//Action inputs
	runKey		= 0
	actionKey	= 0
		
}
