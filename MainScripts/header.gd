extends PanelContainer
@export var SHOWMENU: bool

@onready var CurrentDateLabel: Label = $VBoxContainer/DateToday

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrentDateLabel.text = GlobalScript.get_current_date()
	pass # Replace with function body.

