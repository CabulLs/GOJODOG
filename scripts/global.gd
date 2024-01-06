extends Node

var player_current_attack = false 

var current_scene = "house"
var transition_scene = false

var player_exit_cliffside_posx = 9
var player_exit_cliffside_posy = 66
var player_start_posx = 171
var player_start_posy = 133

var game_first_loadin = true

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "world_2"
		if current_scene == "cliff_side":
			current_scene = "world"
		if current_scene == "house":
			current_scene = "home"
		if current_scene == "home":
			current_scene = "cliff_side"

			
		
		


