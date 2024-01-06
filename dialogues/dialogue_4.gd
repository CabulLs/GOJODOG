extends CanvasLayer

@export_global_file("rpg_fence.json") var d_file	

var dialogue3 = []
var current_dialogue_id3 = 0
var d_active3 = false

func _ready():
	$NinePatchRect.visible = false
	
	
func start():
	if d_active3:
		return
	d_active3 = true
	$NinePatchRect.visible = true
	
	dialogue3 = load_dialogue()
	current_dialogue_id3 = -1
	next_script()
		
	#$NinePatchRect/Name.text = dialogue[0]['name']
	#$NinePatchRect/Chat.text = dialogue[0]['text']
		
func load_dialogue():
		var file3 = FileAccess.open("res://dialogues/json/rpg_fence.json", FileAccess.READ)
		var content3 = JSON.parse_string(file3.get_as_text())
		return content3

func _input(event):
	if not d_active3:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
			
func next_script():
	current_dialogue_id3 += 1
	
	if current_dialogue_id3 >= len(dialogue3):
		$Timer.start()
		$NinePatchRect.visible = false
		return
	
	$NinePatchRect/Name.text = dialogue3[current_dialogue_id3]['name']
	$NinePatchRect/Chat.text = dialogue3[current_dialogue_id3]['text']


#func _on_timer_timeout():
	#d_active3 = false
