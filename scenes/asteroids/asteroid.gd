extends Area2D

# Vars:
@export var speed: float
@export var speed_rotation: float
@export var points: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	rotation_degrees += speed_rotation * delta	

func _on_area_entered(area: Area2D) -> void:
	var is_player = area.is_in_group("Player")
	var is_laser = area.is_in_group("Laser")
	
	if is_laser:
		GameManager.add_score(points)
	if is_player or is_laser:
		destroy()

func destroy():
	queue_free()
