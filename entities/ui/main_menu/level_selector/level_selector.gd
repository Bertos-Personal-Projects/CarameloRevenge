extends Control

@export var return_page_button:Button
@export var item_list:ItemList
@export var level_data_list:Array[LevelData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	return_page_button.pressed.connect(func():
		get_parent().change_screen(0)
		)
	populate_list()
	item_list.item_activated.connect(_on_item_activated)
	
	
func _on_item_activated(idx:int) -> void:
	var metadata = item_list.get_item_metadata(idx)
	get_tree().change_scene_to_file(metadata["uid"])

func populate_list() -> void:
	for i in level_data_list.size():
		var level = level_data_list[i]
		item_list.add_item(level.name,level.icon,true)
		item_list.set_item_metadata(i,{"id": level.id,"uid": level.uid})
