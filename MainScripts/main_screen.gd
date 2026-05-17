extends Control


@onready var CurrentDateLabel = $HBoxContainer/VBoxContainer/CurrentDate
@onready var FirstBallInput = $HBoxContainer/VBoxContainer/HBoxContainer/TextEdit
@onready var SecondBallInput = $HBoxContainer/VBoxContainer/HBoxContainer/TextEdit2

var firebase_db

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	firebase_db = Firebase.Database
	CurrentDateLabel.text = GlobalScript.get_current_date()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_submit_pressed() -> void:
	var first_ball = FirstBallInput.text
	var second_ball = SecondBallInput.text
	var current_date = GlobalScript.get_current_date()
	
	var data = {
		"first_ball": first_ball,
		"second_ball": second_ball,
		"date": current_date
	}
	
	# Save to Firebase
	firebase_db.child("barcodes").child(current_date).set_value(data)
