extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var cena = get_tree().current_scene
	print(cena.name)
	if cena.name == "fase_01" and body.name == "player":
		get_tree().change_scene_to_file("res://fase_02.tscn")
	elif cena.name == "fase_02" and body.name == "player":
		get_tree().change_scene_to_file("res://fase_01.tscn")
