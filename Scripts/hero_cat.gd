extends CharacterBody2D
class_name Player

const SPEED = 100.0


func _ready() -> void:
	position = GameManager.player_spawn_position

func _process(delta: float) -> void: ## prolly save to remove
	if Input.is_action_just_pressed("ui_select"):
		print("ui_select pressed in herocat")  
		
			

func _physics_process(delta: float) -> void:
	move_hero()
	
func move_hero(): ## recieves inputs and moves hero-cat
	var move_vector: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = move_vector * SPEED
	
	if velocity.x > 0:
		$HeroCatBig.play("Facing-Right")
	elif velocity.x < 0:
		$HeroCatBig.play("Facing-Left")
	elif velocity.y > 0:
		$HeroCatBig.play("Facing-Down")
	elif velocity.y < 0:
		$HeroCatBig.play("Facing-Up")
	if velocity == Vector2(0,0):
		$HeroCatBig.stop()
	
	move_and_slide()
	

func play_click() -> void:
	%Click.play()
	
