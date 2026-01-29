extends AnimatableBody2D

@export var velocity = 0.7  # Max speed in pixels per second
@export var acceleration = 0 # How quickly the object reaches max_speed
@export var friction = 0.9   # How quickly the object slows down
@export var flipin := true
@onready var path_follow: PathFollow2D = get_parent()
@onready var pat
var current_speed = 0.0
var target_speed = 0.0


func _process(_delta):
	if flipin:
		acceleration += velocity
	
	
func momentum():
	
	acceleration += velocity
	
	
func _on_timer_2_timeout() -> void:
	flipin = not flipin
	if flipin:
		velocity *= -1
	
