extends Node
class_name Item


var icon
var quantity
var item_name

func _init(item_def: Resource):
	icon = item_def.icon
	quantity = item_def.quantity
	item_name = item_def.item_name
