extends Area2D

var DebrisFell : bool = false

func _on_body_entered(body: Node2D) -> void:
	if !DebrisFell:
		%AnimationPlayer.play("DebrisFall")
		DebrisFell = true
		GameManager.ending = false
		%AudioDebris.play()
		GameManager.pad1read = false
		GameManager.pad2read = false
