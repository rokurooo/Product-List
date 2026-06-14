extends CanvasLayer
signal deleted

var SHOPNAME
var ITEMNAME
var ITEMPRICE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	pass # Replace with function body.


func _on_cancel_pressed() -> void:
	visible = false
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	emit_signal("deleted")
	pass # Replace with function body.
