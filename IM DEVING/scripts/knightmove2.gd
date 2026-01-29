extends StaticBody2D

@onready var path : Path2D = get_parent()
var dir := 1
@export var speed :float = 9.0


func _physics_process(delta: float) -> void:
	if position.y < path.curve.get_point_position(0).y or position.y > path.curve.get_point_position(1).y:
		dir = -dir
		
	var path_direction = path.curve.get_point_position(0) - path.curve.get_point_position(1)
	position += dir * path_direction.normalized() * delta * speed
	
