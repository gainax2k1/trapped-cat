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
	

	
func put_text(txt: String) -> void:
	%RTLabel.text = txt
	%TxtRect.visible = true


func put_button_1(txt: String) -> void:
	%Button1.text = txt
	%Button1.visible = true

func put_button_2(txt: String) -> void:
	%Button2.text = txt
	%Button2.visible = true

func _on_interact_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name:
		var txt = "body entered: " + area.name
		print(txt)
		var thing = TextManager.get_thing(area.name)
		if thing != null:
			txt = thing.TXT
			put_text(txt)
			if thing.Button1 != "NA":
				put_button_1(thing.Button1)
			if thing.Button2 != "NA":
				put_button_2(thing.Button2)

func _on_interact_area_2d_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	%TxtRect.visible = false
	%Button1.visible = false
	%Button2.visible = false
