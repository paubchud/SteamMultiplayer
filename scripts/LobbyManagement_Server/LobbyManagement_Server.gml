function send_player_sync(_steam_id) {
	var _b = buffer_create(1, buffer_grow, 1);
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SYNC_PLAYERS);
	buffer_write(_b, buffer_string, playerList);
	steam_net_packet_sent(_steam_id, _b);
	buffer_delete(_b);
}

function send_player_spawn(_steam_id, _slot) {
	var _pos = grab_spawn_point(_slot);
	var _b = buffer_create(5, fixed_buffer, 1); // 1+2+2
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_SELF);
	buffer_write(_b, buffer_u16, _pos.x);
	buffer_write(_b, buffer_u16, _pos.y);
	steam_net_packet_sent(_steam_id, _b);
	buffer_delete(_b);
	
	server_player_spawn_at_pos(_steam_id, _pos);
	send_other_player_spawn(_steam_id, _pos);
}

function send_other_player_spawn(_steam_ID, _pos) {
	var _b = buffer_create(13, fixed_buffer, 1);// 1+2+2+8
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_OTHER);
	buffer_write(_b, buffer_u16, _pos.x);
	buffer_write(_b, buffer_u16, _pos.y);
	buffer_write(_b, buffer_u64, _steam_id);
	
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
			if (playerList[_i].steamID != _steam_ID)
			{
				steam_net_packet_send(playerList[_i].steamID, _b);	
			}
	}
	
	buffer_delete(_b);
		
}

function server_player_spawn_pos(_steam_id, _pos) {
	var _layer = layer_get_id("Instances");
	
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if (playerList[_i].steamID == _steam_ID)
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