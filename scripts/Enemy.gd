extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false
var can_take_damage = true

func _physics_process(_delta):
	deal_with_damage()
	if player_chase:
		position += (player.position - position)/speed
		
		$AnimatedSprite2D.play("idle")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("walk")


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true 


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false 

func deal_with_damage():
	if player_inattack_zone and global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 20
			$take_damge_cooldown.start()
			can_take_damage = false
			print("slime health = ", health )
			if health <= 0:
				self.queue_free()


func _on_take_damge_cooldown_timeout():
	can_take_damage = true
