extends CharacterBody2D
class_name enemy

@onready var player := $"../player"

@export var speed := 50

@onready var spr = $"Alien-cat"

func _ready():
	add_to_group("enemies") # Add the bullet to a group for easier identification
	if is_in_group("enemies"):
		print("whyyyy")
 
func _physics_process(_delta):
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees <270 and rotation_degrees>90:
		spr.flip_v = true
	else:
		spr.flip_v = false
	
	#enemy move to player if player.
	if not player:
		return

	look_at(player.global_position)
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
