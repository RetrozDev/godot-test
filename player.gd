extends Area2D

@export var speed = 400
var screenSize

func _ready():
	screenSize = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("moveRight"):
		velocity.x += 1
	if Input.is_action_pressed("moveLeft"):
		velocity.x -= 1
	if Input.is_action_pressed("moveUp"):
		velocity.y -= 1
	if Input.is_action_pressed("moveDown"):
		velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screenSize)
