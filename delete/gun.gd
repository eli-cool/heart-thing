extends Node2D

@onready var pler = get_parent()
@onready var plergun = $"../Download"
@onready var spr = $Sprite2D
#const BULLET = preload("res://bullet.tscn")
const BULLET = preload("res://bullet.tscn")


func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	if rotation_degrees <270 and rotation_degrees>90:
		spr.flip_v = true
		plergun.flip_h = true
	else:
		spr.flip_v = false
		plergun.flip_h = false

	if Input.is_action_just_pressed("fire"):
		
		var bullet_instance = BULLET.instantiate()
		print("got")
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = $Sprite2D.global_position
		bullet_instance.rotation = rotation
