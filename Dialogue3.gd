extends CanvasLayer

@export_global_file("rpg_sign2.json") var d_file	

var dialogue2 = []
var current_dialogue_id2 = 0
var d_active2 = false

func _ready():
	$NinePatchRect.visible = false
	
	
func start():
	if d_active2:
		return
	d_active2 = true
	$NinePatchRect.visible = true
	
	dialogue2 = load_dialogue()
	current_dialogue_id2 = -1
	next_script()
		
	#$NinePatchRect/Name.text = dialogue[0]['name']
	#$NinePatchRect/Chat.text = dialogue[0]['text']
		
func load_dialogue():
		var file2 = FileAccess.open("res://dialogues/json/rpg_sign2.json", FileAccess.READ)
		var content2 = JSON.parse_string(file2.get_as_text())
		return content2

func _input(event):
	if not d_active2:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
			
func next_script():
	current_dialogue_id2 += 1
	
	if current_dialogue_id2 >= len(dialogue2):
		$Timer.start()
		$NinePatchRect.visible = false
		return
	
	$NinePatchRect/Name.text = dialogue2[current_dialogue_id2]['name']
	$NinePatchRect/Chat.text = dialogue2[current_dialogue_id2]['text']


func _on_timer_timeout():
	d_active2 = false
