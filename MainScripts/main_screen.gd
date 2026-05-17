extends Control


@onready var CurrentDateLabel = $VBoxContainer/CurrentDate
@onready var StoreName : TextEdit = $VBoxContainer/HBoxContainer/Shop
@onready var ItemName : TextEdit = $VBoxContainer/HBoxContainer/Item
@onready var ItemPrice : TextEdit = $VBoxContainer/HBoxContainer/Price


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrentDateLabel.text = GlobalScript.get_current_date()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_submit_pressed() -> void:
	var current_date = GlobalScript.get_current_date()
	
	var data = {
		"Store_Name": StoreName,
		"Item_Name": ItemName,
		"Item_Price" : ItemPrice,
		"date": current_date
	}
	GlobalScript.save_file(data)
	
