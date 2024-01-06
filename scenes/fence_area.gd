extends Area2D



func _input(event):
	if event.is_action_pressed("ui_accept") and len(get_overlapping_bodies()) > 0:
		use_dialogue1()
		
func use_dialogue1():
	var dialogue3 = get_parent().get_node("Dialogue4")
	
	if dialogue3:
		dialogue3.start()
