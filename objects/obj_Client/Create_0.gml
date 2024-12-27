<<<<<<< HEAD
/// @description Init client variables

playerList = [];

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();
lobbyMemberID = undefined;

character = undefined;
=======
/// @description Init Client Variables

playerList = []

steamID = steam_get_user_steam_id()
steamName = steam_get_persona_name()
lobbyMemberID = undefined

character = undefined
>>>>>>> episode4

inbuf = buffer_create(16, buffer_grow, 1);

playerList[0] = {
	steamID		: steamID,
	steamName	: steamName,
<<<<<<< HEAD
	lobbyMemberID : undefined,
	character	: undefined,
	startPos	: grab_spawn_point(0)
}
=======
	character	: undefined,
	startPos	: grab_spawn_point(0),
	lobbyMemberID : undefined
	}
>>>>>>> episode4
