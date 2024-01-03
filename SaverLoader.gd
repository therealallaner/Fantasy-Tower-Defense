extends Node
class_name SaverLoader




func save_game():
	var saved_game: SavedGame = SavedGame.new()
	
	var saved_data:Array[SavedData] = []
	get_tree().call_group("game_events", "on_save_game", saved_data)
	saved_game.saved_data = saved_data
	
	ResourceSaver.save(saved_game, "user://savegame.tres")


func load_game():
	var saved_game:SavedGame = load("user://savegame.tres") as SavedGame
	
	get_tree().call_group("game_events", "on_before_load_game")
	
	for item in saved_game.saved_data:
		var nodes = get_tree().get_nodes_in_group("game_events")
		for node in nodes:
			if node.has_method("on_load_game"):
				node.on_load_game(item)
