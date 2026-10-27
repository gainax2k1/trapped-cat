extends Area2D

var DebrisFell : bool = false

func _on_body_entered(body: Node2D) -> void:
	if !DebrisFell:
		%AnimationPlayer.play("DebrisFall2")
		GameManager.ending = true
		DebrisFell = true
		%AudioDebris.play()
