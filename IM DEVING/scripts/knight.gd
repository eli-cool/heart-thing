extends Node2D

@onready var knight = $Path2D/StaticBody2D/knight
@onready var knight2 = preload("res://scenes/knightafimage.tscn")

func _on_timer_timeout():
	var knight_after = knight2.instantiate()
	get_tree().root.add_child(knight_after)
	
	knight_after.global_position = knight.global_position
	knight_after.global_scale = knight.global_scale
