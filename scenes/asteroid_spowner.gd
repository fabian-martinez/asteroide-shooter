extends Marker2D

@export var asteroids: Array[PackedScene]
@export var big_asteroid_scene: PackedScene
@export var medium_asteroid_scene: PackedScene
@export var small_asteroid_scene: PackedScene

# VARS
@export var MIN_Y: float
@export var MAX_Y: float
@export var MIN_VELOCITY: float
@export var MAX_VELOCITY: float
@export var MIN_ANGULAR_VELOCITY: float
@export var MAX_ANGULAR_VELOCITY: float

func create_asteroid():
	var asteroid_scene = asteroids.pick_random()
	var asteroid_instance = asteroid_scene.instantiate()
	add_child(asteroid_instance)
	var random_y = randf_range(
		MIN_Y,
		MAX_Y
		)
	var random_velocity = randf_range(
		MIN_VELOCITY,
		MAX_VELOCITY
		)
	var random_angular_velocity = randf_range(
		MIN_ANGULAR_VELOCITY, 
		MAX_ANGULAR_VELOCITY
		)
	
	asteroid_instance.global_position.y = random_y
	asteroid_instance.speed_rotation = random_angular_velocity
	asteroid_instance.speed = random_velocity
	
#   SIGNAL
#	 __________                        ____________
#	|          | ))Senal    ))Conecta |            |
#	|  Timer   |                      |  Spawner   |
#	|__________|                      |____________|
#
func _on_timer_timeout() -> void:
	create_asteroid()
