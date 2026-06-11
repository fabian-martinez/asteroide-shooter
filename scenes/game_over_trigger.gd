extends Area2D

func _on_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	var isAsteroid = area.is_in_group("Asteroids")
	if(isAsteroid):
		GameManager.set_is_game_over(true)
		queue_free()
