extends Control


var item : Item


func _ready():
	get_parent().add_slot(self)

func add_item(_item: Item):
	if not item:
		set_item(_item)
		return

	if not has_item(_item):
		return # jjust to double check if the correct kind of item gets added
	item.quantity += _item.quantity
	refresh_stack_size()

func set_item(_item: Item):
	item = _item
	$TextureRect.texture = item.icon
	refresh_stack_size()

func refresh_stack_size():
	var text
	if item:
		text = str(item.quantity)
	else:
		text = ""
	$StackSize.text = text

func has_item(_item):
	if not item:
		return false
	return item.item_name == _item.item_name

func clear():
	item = null
	$TextureRect.texture = null
	refresh_stack_size()
	

func is_empty():
	return not item
