extends Node2D

var pos_quant := 0
var pos_states := []
var random = false

func _ready():
	pos_quant = get_child_count()
	for i in range(pos_quant):
		var child = get_child(i) 
		child.position = global_position + child.position
	create_points(10, 50, -10)

func create_points(quant, xoffset, yoffset):
	for i in range(quant):
		var pos_node = Position2D.new()
		pos_node.position = Vector2(global_position.x + i*xoffset, global_position.y + i*yoffset)
		add_child(pos_node)
		pos_states.append(0)

func occup_point(n):
	pos_states[n] = 1

func get_next_point():
	if not random:
		var ind = pos_states.find(0)
		if ind != -1:
			occup_point(ind)
			return get_child(ind).position
