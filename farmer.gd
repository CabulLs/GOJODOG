extends CharacterBody2D

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

const speed = 30
var current_state = IDLE
var dir = Vector2.RIGHT

func _process(delta):
	match current_state:
		IDLE:
			pass
		#NEW_DIR:
			#dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			
func _ready():
	$AnimatedSprite2D.play("idle")

