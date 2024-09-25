/// @description Setup Player

localSteamID = steam_get_user_steam_id()
isHost = (localSteamID == steam_lobby_get_owner_id())
image_index = lobbyMemberID

moveSpeed = 5
fireCooldown = 50
currentCooldown = 0

init_controls()