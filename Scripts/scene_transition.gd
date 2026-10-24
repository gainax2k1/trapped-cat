extends ColorRect

# Path to the next scene to transition to
@export var next_scene_path : String 

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	print("scene trans reeady")

func transition_to(target_path : String) -> void:
	$AnimationPlayer.play("Fade")
	print("next scen path: ", next_scene_path)
	next_scene_path = target_path
	print("target scene path: ", target_path)
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(next_scene_path)
	$AnimationPlayer.play_backwards("Fade")
