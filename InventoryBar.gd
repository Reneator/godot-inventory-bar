extends HBoxContainer

var slots = [] #to enable activation via shortcuts you could replace the array with a 
#dictionary or just use the position in the array for their position in the UI

func _ready():
	Events.connect("on_item_added", self, "add_item")
	Events.connect("on_bar_clear", self, "clear")

func add_item(item: Item):
	# first we try to find a slot with the same item
	var slot_with_item = get_slot_with_item(item)
	if slot_with_item:
		slot_with_item.add_item(item)
		return
	
	#if no slot has the item, we try to find an empty slot
	for slot in slots:
		if slot.is_empty():
			slot.add_item(item)
			return
			
	print("Item couldnt be added to the inventoryBar")#this is to protect you from bad cases
	assert(false)# assert(false) just makes the debug stop here, in debug builds. In production builds this doesnt happen anymore


func add_slot(slot):
	slots.append(slot)
	
func get_slot_with_item(item: Item):
	for slot in slots:
		if slot.has_item(item):
			return slot
func clear():
	for slot in slots:
		slot.clear()
