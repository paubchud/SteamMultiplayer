/// @description Setup lobby_list

lobbyList = []

xScale = 25;
yScale = 16;

image_xscale = xScale;
image_yscale = yScale;

lobbyList[0] = instance_create_depth(x, bbox_top+40,-20,obj_LobbyItem);

steam_lobby_list_add_string_filter("isGameMakerTest", "true", steam_lobby_list_filter_eq);
steam_lobby_list_request();


resetLobbyList = function () {
	for (var _i = 0; _i < array_length(lobbyList); _i++)
	{
		show_debug_message("Deleting: " +string(lobbyList[_i]));
		instance_destroy(lobbyList[_i]);
	}
	lobbyList = [];
}