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
	if StoreName.text and ItemName.text and ItemPrice.text == null:
		return
	print (StoreName.text)
	
	var current_date = GlobalScript.get_current_date()
	
	# Load existing data
	var existing_data = GlobalScript.load_file()
	if existing_data == null:
		existing_data = {}
	
	# Initialize store array if it doesn't exist
	if StoreName.text not in existing_data:
		existing_data[StoreName.text] = []
	
	# Append the new item
	existing_data[StoreName.text].append({
		"Item_Name": ItemName.text,
		"Item_Price": float(ItemPrice.text),
		"date": current_date
	})
	
	GlobalScript.save_file(existing_data)
	
