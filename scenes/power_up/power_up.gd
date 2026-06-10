extends Node2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		destroy_all_asteroids()
		queue_free()

func destroy_all_asteroids():
	var asteroids = get_tree().get_nodes_in_group("Asteroids")
	for asteroid in asteroids:
		asteroid.destroy()
