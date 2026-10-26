extends Node2D

#music settings
var bg_music_playing : bool = true ## Set in menu
var bg_music_track : String = "res://Audio/gloomy_bg.ogg" ## string "res:// ...ogg"

#scene transition
var scene_current: String = "res://Scenes/game.tscn" ## string "res://Scenes/...tcsn"
var scene_previous : String = "res://Scenes/game.tscn" ## string "res://Scenes/...tcsn"

#player info
@export var player_spawn_position : Vector2 = Vector2(218,31)## vector2 of players last coordinates in overworld
@export var done_shopping : bool = false ## flags for whether you can enter store/friends house
@export var have_empanadas : bool = false  ## flags for done cooking
@export var art_done : bool = false
@export var neener_done : bool = false

#might need reworking depending on how music get's set up...
func bg_music_play(track_name : String) -> void: ## recieves "res://Audio/Music/...ogg"
	if track_name != "":
		bg_music_track = track_name
	if bg_music_playing:
		$AudioStreamPlayer.stream = load(bg_music_track)
		$AudioStreamPlayer.play()

func toggle_bg_music(): ## toggles , loading current "bg_music_track" if playing.
	if bg_music_playing:
		$AudioStreamPlayer.stop()
	else:
		$AudioStreamPlayer.stream = load(bg_music_track)
		$AudioStreamPlayer.play()
		
	bg_music_playing = !bg_music_playing
	
func change_scene(target_scene : String, trans_effect : String = "Fade") -> void: ##handles scene trans, default to "Fade"
	## target_scene = "res://Scenes/...tscn", trans_effect "Fade", etc
	
	scene_previous = scene_current
	scene_current = target_scene
	
	print("Target scene: ", target_scene)
	print("Trans effect: ", trans_effect) #eventually, cool transition?
	print("Take care of preserving player coordinates in player_pos_previous? Not yet!")

	match trans_effect:
		"Fade":
			print("Fade transition")
			$SceneTransitionRect.transition_to(target_scene)
		_:
			print("Wildcard transition, default Fade")
