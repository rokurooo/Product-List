extends CanvasLayer
signal edited

var SHOPNAME: String
var ITEMNAME: String
var ITEMPRICE: String

@onready var shoplabel = $BG/Panel3/VBoxContainer/Itemsname/Shop
@onready var itemname = $BG/Panel3/VBoxContainer/Itemsname/Item
@onready var priceinput = $BG/Panel3/VBoxContainer/Price

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoplabel.text = SHOPNAME
	itemname.text = ITEMNAME
	priceinput.text = ITEMPRICE
	pass # Replace with function body.

func _on_cancel_pressed() -> void:
	visible = false
	pass # Replace with function body.


func _on_confirm_pressed() -> void:
	emit_signal("edited")
	pass # Replace with function body.
