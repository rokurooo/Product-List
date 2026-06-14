extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_cancel_pressed() -> void:
	visible = false
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	print("submitted")
	pass # Replace with function body.
