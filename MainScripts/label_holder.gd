extends VBoxContainer

var options_toggled: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _on_delete_pressed() -> void:
	queue_free()
	pass # Replace with function body.

func _on_labels_pressed() -> void:
	if !options_toggled:
		$TogglePlayer.play("Open")
		options_toggled = true
	else:
		$TogglePlayer.play_backwards("Open")
		options_toggled = false
	pass # Replace with function body.
