extends Node

var gold = 0

func _ready():
	# Initialize economy
	pass
	
func sell_tree(tree_price: int):
	if tree.is_grown:
		gold += tree_price
		tree.queue_free()  # Remove the tree from the game
		# Update UI to reflect new gold amount
