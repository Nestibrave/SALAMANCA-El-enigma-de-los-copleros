extends Node2D


func _process(delta):
	if $Sonia/SoniaCollisionShape2D.global.position > $Level_1/House1/StaticBody2D/CollisionPolygon2D/Node2D.global.position:
		$Level_1/House1.z_index = 1
	else:
		$Level_1/House1.z_index = 0
		pass
	pass
