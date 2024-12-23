/// @description Listen for lobby creation

switch(async_load[?"event_type"])
{
	case "lobby_created":
		show_debug_message("Lobby created: " + string(steam_lobby_get_lobby_id()));
		
		// This is used to join the created lobby
		steam_lobby_join_id(steam_lobby_get_lobby_id());
		break
		
	// Listen for the lobby join
	case "lobby_joined":
	
		
		if (steam_lobby_is_owner())
		{
			steam_lobby_set_data(GAMEFILTER, COMPARESTRING);
			steam_lobby_set_data("Creator", steam_get_persona_name());
		}
		
		room_goto(rm_GameRoom);
		break
}