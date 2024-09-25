function get_controls(_is_host)
{
	if _is_host {
	//Directions inputs
	rightKey = keyboard_check(vk_right) ||keyboard_check(ord("D")) || gamepad_button_check( 0, gp_padr );
	rightKey = clamp( rightKey, 0, 1 );
	leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check( 0, gp_padl );
	leftKey  = clamp( leftKey, 0, 1 );
	downKey  = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check( 0, gp_padd );
	downKey  = clamp( downKey, 0, 1 );
	upKey  = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check( 0, gp_padu );
	upKey  = clamp( upKey, 0, 1 );
	allDir = rightKey+leftKey+downKey+upKey
	//Action inputs
	runKey = keyboard_check(vk_shift) || gamepad_button_check( 0, gp_face3 );
	actionKey = keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_check( 0, gp_face2 );
	
	if (allDir + runKey + actionKey == 0) then return
	var _xInput = (rightKey - leftKey)
	var _yInput = (downKey - upKey)
	var _input = {steamID: obj_Server.steamID, xInput:_xInput, yInput:_yInput, runKey:runKey, actionKey:actionKey}
	send_player_input_to_clients(_input)
	}
	else {
	//Directions inputs
	var _rightKey = keyboard_check(vk_right) ||keyboard_check(ord("D")) || gamepad_button_check( 0, gp_padr );
	_rightKey = clamp( rightKey, 0, 1 );
	var _leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check( 0, gp_padl );
	_leftKey  = clamp( leftKey, 0, 1 );
	var _downKey  = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check( 0, gp_padd );
	_downKey  = clamp( downKey, 0, 1 );
	var _upKey  = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check( 0, gp_padu );
	_upKey  = clamp( upKey, 0, 1 );
	//Action inputs
	var _runKey = keyboard_check(vk_shift) || gamepad_button_check( 0, gp_face3 );
	var _actionKey = keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_check( 0, gp_face2 );
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
	
	//Action inputs
	runKey		= 0
	actionKey	= 0
		
}
