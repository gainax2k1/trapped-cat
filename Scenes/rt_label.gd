extends RichTextLabel

var current_line = 0

#below was temp fix for layer issue with control. solved by moving rectangle layer
#func _physics_process(delta: float) -> void:
	
	#if Input.is_action_pressed("ui_up"):
	#	current_line = max(current_line - 1, 0)
	#	scroll_to_line(current_line)
	#elif Input.is_action_pressed("ui_down"):
	#	current_line = min(current_line + 1, get_line_count() - 1)
	#	scroll_to_line(current_line)
