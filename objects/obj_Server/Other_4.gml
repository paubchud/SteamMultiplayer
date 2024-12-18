/// @description Spawn Players

var _playerLayer = layer_get_id("Instances");

for (var _player = 0; _player < array_length(playerList); _player++)
{
	var _pos = grab_spawn_point(_player);
	var _inst = instance_create_layer(_pos.x, _pos.y, _playerLayer, obj_Player, {
					steamID		: playerList[_player].steamID,
					steamName	: playerList[_player].steamName,
					lobbyMemberID : _player
				});
	playerList[_player].character = _inst;
	playerList[_player].startPos = _pos;
	
	if (playerList[_player].steamID == steamID)
	{
		character = _inst;	
	}
	
}

alarm[0] = 5;