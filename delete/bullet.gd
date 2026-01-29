extends Node2D
 
const SPEED: int = 300
@export var rotation_speed = 40

func _ready():
	add_to_group("bullets") # Add the bullet to a group for easier identification
	
 
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
#	rotation_degrees += rotation_speed * delta
	
 
 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.get_parent())
	if area.get_parent().is_in_group("enemies"):
		print("hit")
		queue_free()
		area.get_parent().queue_free()
	else:
		print("nooooo") 
