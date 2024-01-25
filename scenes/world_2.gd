extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#if global.game_first_loadin == true:
		#$player.position.x = global.player_start_posx
		#$player.position.y = global.player_start_posy
	#else:
		#$player.position.x = global.player_exit_cliffside_posx
		#$player.position.y = global.player_exit_cliffside_posy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()


#func _on_cliffside_transition_point_body_entered(body):
	#if body.has_method("player"):
		#global.transition_scene = true
#
#
#func _on_cliffside_transition_point_body_exited(body):
	#if body.has_method("player"):
		#global.transition_scene = true
		
func _on_ranch_transition_point_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true

func _on_ranch_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = true

func change_scene():
	if global.transition_scene == true:
		#if global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/ranch.tscn")
			global.game_first_loadin = false
			global.finish_changescenes()


