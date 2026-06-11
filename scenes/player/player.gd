extends CharacterBody2D

@export var speed:float
@export var laser_scene:PackedScene
@export var speed_shoot:float


func _physics_process(_delta: float) -> void:
	
	if GameManager.is_game_over:
		return
	# Ejecuta en un intervalo de 60 por segundo
	# Fisicas 
	# Movimientos de cuerpos fisico (CharacterBody2D, RigidBody2D)
	if Input.is_action_just_pressed("shoot"):
		create_laser()
	proccess_input()
	move_and_slide() 

func proccess_input():
	var y_input = Input.get_axis("up", "down")
	var x_input = Input.get_axis("left","right" )
	# Genera un valor deacuerdo  al input configurado 
	#  0 sin imput							---------> (x) (aumenta derecha)
	# -1 primer parametro  ( Exp: up )	   	|
	# +1 segundo parametro ( Exp: down )	   	V (y) (aumenta abajo)
	velocity = Vector2(x_input, y_input) * speed

func create_laser():
	var laser_instace = laser_scene.instantiate()
	add_sibling(laser_instace)
	laser_instace.speed = speed_shoot
	laser_instace.position = position

func _on_area_2d_area_entered(area: Area2D) -> void:
	var isAsteroid = area.is_in_group("Asteroids")
	if(isAsteroid):
		GameManager.set_is_game_over(true)
		queue_free()
