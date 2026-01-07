extends CharacterBody2D
@export var hp := 100
@export var speed := 200.0
@export var is_hurting := false
@onready var healthbar = $"../healthbar"


func ready():
	healthbar.value = hp

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down").normalized()
	var  _directionx = direction[0]
	var _directiony = direction[1]
		
	velocity = direction * speed
	
	move_and_slide()
	
	#hurting
	if is_hurting:
		print(hp)
		healthbar.value = hp
		hp -= 1
	if hp <= 0:
		queue_free()
	
	
func _on_area_2d_area_entered(area: Area2D) -> void:
#	print(area.get_parent())
	if area.get_parent().is_in_group("attack"):
		is_hurting = true
#		queue_free()
		print("ouch")


func _on_area_2d_area_exited(area):
	if area.get_parent().is_in_group("attack"):
		is_hurting = false
		print("no more ouch")
