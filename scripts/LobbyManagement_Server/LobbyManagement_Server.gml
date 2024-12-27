function send_player_sync(_steam_id) {
	var _b = buffer_create(1, buffer_grow, 1);
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SYNC_PLAYERS);
	show_debug_message(json_stringify(playerList));
	buffer_write(_b, buffer_string, json_stringify(playerList)); // Turn into Json string before sent
	steam_net_packet_send(_steam_id, _b);
	buffer_delete(_b);
}

function send_player_spawn(_steam_id, _slot) {
	var _pos = grab_spawn_point(_slot);
	var _b = buffer_create(5, buffer_fixed, 1); // 1+2+2
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_SELF);
	buffer_write(_b, buffer_u16, _pos.x);
	buffer_write(_b, buffer_u16, _pos.y);
	steam_net_packet_send(_steam_id, _b);
	buffer_delete(_b);
	
	server_player_spawn_at_pos(_steam_id, _pos);
	send_other_player_spawn(_steam_id, _pos);
}

function send_other_player_spawn(_steam_ID, _pos) {
	var _b = buffer_create(13, buffer_fixed, 1);// 1+2+2+8
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_OTHER);
	buffer_write(_b, buffer_u16, _pos.x);
	buffer_write(_b, buffer_u16, _pos.y);
	buffer_write(_b, buffer_u64, _steam_ID);
	
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
			if (playerList[_i].steamID != _steam_ID)
			{
				steam_net_packet_send(playerList[_i].steamID, _b);	
			}
	}
	
	buffer_delete(_b);
		
}

function server_player_spawn_at_pos(_steam_id, _pos) {
	var _layer = layer_get_id("Instances");
	
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if (playerList[_i].steamID == _steam_id)
		{
			var _inst = instance_create_layer(_pos.x, _pos.y, _layer, obj_Player, {
				steamID: _steam_id,
				steamName: playerList[_i].steamName,
				lobbyMemberID: _i
			});
			playerList[_i].character = _inst;
		}
	}
}

//@self obj_server
function send_player_input_to_client(_player_input)
{
	if _player_input == undefined return;
	
	var _b = buffer_create(13, buffer_fixed, 1); //1+8+1+1+1+1
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.CLIENT_PLAYER_INPUT); //1
	buffer_write(_b, buffer_u64, _player_input.steamID); //8
	buffer_write(_b, buffer_s8, _player_input.xInput); //1
	buffer_write(_b, buffer_s8, _player_input.yInput); //1
	buffer_write(_b, buffer_u8, _player_input.runKey); //1
	buffer_write(_b, buffer_u8, _player_input.actionKey); //1
	
	for (var _i = 0; _i < array_length(obj_Server.playerList); _i++)
	{
		if (obj_Server.playerList[_i].steamID != obj_Server.steamID)
		{
			steam_net_packet_send(obj_Server.playerList[_i].steamID, _b);	
		}
	}
	buffer_delete(_b);
}

///@description Constantly update other clients on every player's position
//@self obj_Server
function send_player_position()
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		var _player = playerList[_i];
		if _player.character == undefined then continue
		if _player.steamID == undefined then continue
		
		var _b = buffer_create(13, buffer_fixed, 1); //1+8+2+2
		buffer_write(_b, buffer_u8, NETWORK_PACKETS.PLAYER_POSITION); //1
		buffer_write(_b, buffer_u64, _player.steamID); //8
		buffer_write(_b, buffer_u16, _player.character.x); //2
		buffer_write(_b, buffer_u16, _player.character.y); //2
		for (var _k = 0; _k < array_length(playerList); _k++)
		{
			if (playerList[_k].steamID != obj_Server.steamID)
			{
				steam_net_packet_send(playerList[_k].steamID, _b)	
			}
		}
		buffer_delete(_b);
	}
}

//@self obj_Client
function update_player_position(_b)
{
	var _steam_ID = buffer_read(_b, buffer_u64);
	var _x = buffer_read(_b, buffer_u8);
	var _y = buffer_read(_b, buffer_u8);
	
	for (var _i = 0; _i < array_length(playerList); _i++)
		{
			if (_steam_ID == playerList[_i].steamID)
			{
				if playerList[_i].character = undefined then continue
				
				playerList[_i].character.x = _x;
				playerList[_i].character.y = _y;
			}
		}
	
}