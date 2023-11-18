extends Node2D

var growth_stage = 0
var is_grown = false
const MAX_GROWTH_STAGE = 3

func _ready():
	# Initialize the tree
	pass
	
func grow():
	growth_stage += 1
	if growth_stage >= MAX_GROWTH_STAGE:
		is_grown = true
		# Update tree sprite to show it's fully grown
