extends Node2D

@export var power_up_scene: PackedScene
@onready var timer = $Timer

var spawn_area: Vector2

func _ready() -> void:
	spawn_area = Vector2(
		get_viewport().size.x / 2 , 
		get_viewport().size.y
		)

func create_power_up():
	if GameManager.is_game_over:
		timer.stop()
		return
	var power_up_instance = power_up_scene.instantiate()
	add_child(power_up_instance)
	var random_position_x = randf_range(0,
		spawn_area.x)
	var random_position_y = randf_range(0,
		spawn_area.y)
	power_up_instance.global_position = Vector2(
		random_position_x,random_position_y)

func _on_timer_timeout() -> void:
	create_power_up()
