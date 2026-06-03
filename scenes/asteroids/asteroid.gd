extends Area2D

# Vars:
@export var speed:float
@export var speed_rotation:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	rotation_degrees += speed_rotation * delta	

func _on_area_entered(area: Area2D) -> void:
	var isPlayer = area.is_in_group("Player")
	var isLaser = area.is_in_group("Laser")
	if(isPlayer or isLaser):
		queue_free()
