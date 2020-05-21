extends Button


export (Resource) var item_to_add

func _on_AddItem_pressed():
	var item = Item.new(item_to_add)
	Events.emit_signal("on_item_added", item)
