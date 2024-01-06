extends CanvasLayer

@export_global_file("rpg_chat.json") var d_file	

var dialogue1 = []
var current_dialogue_id1 = 0
var d_active1 = false

func _ready():
	$NinePatchRect.visible = false
	
	
func start():
	if d_active1:
		return
	d_active1 = true
	$NinePatchRect.visible = true
	
	dialogue1 = load_dialogue()
	current_dialogue_id1 = -1
	next_script()
		
	#$NinePatchRect/Name.text = dialogue[0]['name']
	#$NinePatchRect/Chat.text = dialogue[0]['text']
		
func load_dialogue():
		var file1 = FileAccess.open("res://dialogues/json/rpg_chat.json", FileAccess.READ)
		var content1 = JSON.parse_string(file1.get_as_text())
		return content1

func _input(event):
	if not d_active1:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
			
func next_script():
	current_dialogue_id1 += 1
	
	if current_dialogue_id1 >= len(dialogue1):
		$Timer.start()
		$NinePatchRect.visible = false
		return
	
	$NinePatchRect/Name.text = dialogue1[current_dialogue_id1]['name']
	$NinePatchRect/Chat.text = dialogue1[current_dialogue_id1]['text']


func _on_timer_timeout():
	d_active1 = false
