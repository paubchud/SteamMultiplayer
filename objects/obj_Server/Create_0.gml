/// @description Initiate server info

playerList = [];

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

character = undefined;

playerList[0] = {
	steamID		: steamID,
	steamName	: steamName,
	lobbyMemberID : 0,
	character	: undefined,
	startPos	: grab_spawn_point(0)
}
