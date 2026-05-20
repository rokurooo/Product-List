extends HBoxContainer

@onready var shopList = $Shops
@onready var itemList = $Items
@onready var priceList = $Price

var data_list
var shops_found: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent() != null:
		data_list = get_parent().get_parent().data_list
	pass # Replace with function body.


func matched_shops(shop_name_input: String) -> void:
	data_list = GlobalScript.load_file()
	itemList.clear()
	priceList.clear()
	shopList.clear()
	
	var search_shop = shop_name_input.to_lower()
	
	for shop in data_list:
		if contains_all_chars(shop.to_lower(), search_shop):
			shops_found = true
			var items = data_list[shop]
			shopList.append_text(shop + "\n")
			
			for item in items:
				itemList.append_text(item["Item_Name"] + "\n")
				priceList.append_text(str(item["Item_Price"]) + "\n")

func matched_items(shop_name_input: String, item_name_input: String) -> void:
	data_list = GlobalScript.load_file()
	itemList.clear()
	priceList.clear()
	shopList.clear()
	
	var search_shop = shop_name_input.to_lower()
	var search_item = item_name_input.to_lower()
	
	for shop in data_list:
		var items = data_list[shop]
		
		for item in items:
			var shop_match = contains_all_chars(shop.to_lower(), search_shop)
			var item_match = contains_all_chars(item["Item_Name"].to_lower(), search_item)
			
			if shop_match and item_match:
				shopList.append_text(shop + "\n")
				itemList.append_text(item["Item_Name"] + "\n")
				priceList.append_text(str(item["Item_Price"]) + "\n")

func contains_all_chars(text: String, search: String) -> bool:
	for i in search:
		if i not in text:
			return false
	return true
