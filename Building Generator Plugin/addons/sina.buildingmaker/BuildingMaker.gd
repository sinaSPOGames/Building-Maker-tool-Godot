extends Spatial
tool

export var min_randomize_scale = 1.2
export var max_randomize_scale = 2.0
export var window_size = 1.0
export var randomize_ = false
export var update_windows_ = false
var floor_height = 3.0
export var building_height = 15.0

func _process(delta):
	if randomize_:
		randomize_scale()
		randomize_ = false
		pass

	if update_windows_:
		windows()
		update_windows_ = false
		pass


func randomize_scale():
	var Building_base = $"building-main-node"
	var Building_base_mesh = $"building-main-node/Base Building"
	var height = rand_range(min_randomize_scale,max_randomize_scale)
	floor_height = height /4
	var prev_scale = Building_base_mesh.depth - (height + 0.0)
	var num_floors = floor(building_height / floor_height)
	var floor_y_coords = []
	for i in range(num_floors):
		floor_y_coords.append(i * floor_height)
	
	$"building-main-node/Floor 1".translation.y = floor_y_coords[0] +0.2
	$"building-main-node/Floor 2".translation.y = floor_y_coords[1] +0.2
	$"building-main-node/Floor 3".translation.y = floor_y_coords[2] +0.2
	$"building-main-node/Floor 4".translation.y = floor_y_coords[3] +0.2
	$"building-main-node/roof_pos".translation.y = height
	print("previous scale is ",prev_scale," diffrent")
	windows()
	Building_base_mesh.depth = height
	var roof_height = $"building-main-node/roof_pos".translation.y
	
	var child_roof = Building_base.get_children()
	for i in child_roof:
		if i.is_in_group("roof"):
			i.translation.y = roof_height - 0.08


func windows():
	var Building_base = $"building-main-node"
	var children = Building_base.get_children()
	for child in children:
		if child.is_in_group("floor1"):
			child.translation.y = $"building-main-node/Floor 1".translation.y
			child.scale.y = window_size
		elif child.is_in_group("floor2"):
			child.translation.y = $"building-main-node/Floor 2".translation.y
			child.scale.y = window_size
		elif child.is_in_group("floor3"):
			child.translation.y = $"building-main-node/Floor 3".translation.y
			child.scale.y = window_size
		elif child.is_in_group("floor4"):
			child.translation.y = $"building-main-node/Floor 4".translation.y
			child.scale.y = window_size
	pass

