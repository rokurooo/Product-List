extends Node

var SAVE_DIR = DirAccess.open("user://")
const SavePath = "user://save_data/saveitems.rake"

var MONTH: String
var DAY: int
var YEAR: int

func _ready() -> void:

	if not SAVE_DIR.dir_exists("user://save_data"):
		SAVE_DIR.make_dir("user://save_data")
		
	get_current_date()

func get_current_date() -> String:
	var datetime = Time.get_datetime_dict_from_system()
	var months = ["January", "February", "March", "April", "May", "June", 
				  "July", "August", "September", "October", "November", "December"]
	MONTH = months[datetime["month"] - 1]
	DAY = datetime["day"]
	YEAR = datetime["year"]
	return "%s %d , %d" % [MONTH, DAY, YEAR]
