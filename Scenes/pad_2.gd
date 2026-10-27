extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pad_2_body_entered(body: Node2D) -> void:
	if body.name == "HeroCat":
		GameManager.pad2read = true


func _on_pad_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "HeroCat":
		GameManager.pad2read = true
