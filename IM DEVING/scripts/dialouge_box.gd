extends Node2D


@onready var plr = $"."
@export var can_speak := false
signal dialodge(num_dia:int)
signal hide

func _process(delta: float) -> void:
	if can_speak:
		if Input.is_action_just_pressed("+action"):
			$"Dog-haircut".visible = not $"Dog-haircut".visible
			dialodge.emit(1)
	else:
		$"Dog-haircut".visible = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("RAAHHHHH")
	can_speak = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	can_speak = false
	pass
