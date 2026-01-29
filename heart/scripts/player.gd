extends CharacterBody2D
@export var hp := 100
@export var hp_potential := 100
@export var speed := 200.0
@export var is_hurting := false
@onready var healthbar = $"../healthbar"
@onready var healthbar_2: ProgressBar = $"../healthbar2"
@onready var kr_time: Timer = $"../kr_time"
@export var is_kr = false
@export var kr_dif = 0

	
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
	
	kr_dif = hp - hp_potential
	
	
	if kr_dif >= 20:
		kr_time.wait_time = 0.1
	elif kr_dif >= 15:
		kr_time.wait_time = 0.3
	elif kr_dif >= 10:
		kr_time.wait_time = 0.5
	else:
		kr_time.wait_time = 1
	
	#hurting
	if is_hurting:
		healthbar.value = hp_potential
		healthbar_2.value = hp
		hp_potential -= 1
		
		if kr_dif > 10:
			hp -= 1
		elif hp_potential <= 1:
			hp -= 1
		
		hp_potential = clamp(hp_potential, 1, 100)
		
#kr
	if hp > hp_potential:
		is_kr = true
	else:
		is_kr = false
		
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


func _on_kr_time_timeout() -> void:
	if is_kr:
		healthbar_2.value = hp
		hp -= 1
		
	
