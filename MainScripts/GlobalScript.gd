extends Node

var SAVE_DIR = DirAccess.open("user://")
const SavePath = "user://save_data/saveitems.rake"

var MONTH: String
var DAY: int
var YEAR: int

func get_current_date() -> String:
	var datetime = Time.get_datetime_dict_from_system()
	var months = ["January", "February", "March", "April", "May", "June", 
				  "July", "August", "September", "October", "November", "December"]
	MONTH = months[datetime["month"] - 1]
	DAY = datetime["day"]
	YEAR = datetime["year"]
	return "%s %d , %d" % [MONTH, DAY, YEAR]


func _ready() -> void:
	if not SAVE_DIR.dir_exists("user://save_data"):
		SAVE_DIR.make_dir("user://save_data")
		
	get_current_date()


func save_file(data: Dictionary):
	var json_string = JSON.stringify(data, "\t")
	var file = FileAccess.open(SavePath, FileAccess.WRITE)
	
	if file:
		# 3. Store the string in the file
		file.store_string(json_string)
		print("saved")
		file.close()
		# File automatically closes when the variable goes out of scope in Godot 4
	else:
		print("Failed to open file: ", FileAccess.get_open_error())

func load_file():
	if not FileAccess.file_exists(SavePath):
		return {}

	var file = FileAccess.open(SavePath, FileAccess.READ)
	var content = file.get_as_text()
	
	# Convert the string back into a Dictionary
	var data = JSON.parse_string(content)
	
	if data is Dictionary:
		return data
	return {}