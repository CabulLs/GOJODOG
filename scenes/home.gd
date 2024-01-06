extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.game_first_loadin == true:
		$player.position.x = global.player_start_posx
		$player.position.y = global.player_start_posy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scenes()


#func _on_cliffside_exitpoint_body_entered(body):
	#if body.has_method("player"):
		#global.transition_scene = true
	#print("masuk")
#
#func _on_cliffside_exitpoint_body_exited(body):
	#if body.has_method("player"):
		#global.transition_scene = true
		
func _on_cliffside_transition_point_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
	print("masuk")


func _on_cliffside_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = true
		
		
func change_scenes():
	if global.transition_scene == true:
		if global.current_scene == "home":
			get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
			global.game_first_loadin = false
			global.finish_changescenes()
		
		


