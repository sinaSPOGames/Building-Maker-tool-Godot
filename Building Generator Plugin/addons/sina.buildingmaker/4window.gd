extends Node
tool
export var name_ = ""
export var old_name_ = ""
export var done = false
export var add = false
func _process(delta):
	if done:
		if get_tree().get_nodes_in_group(old_name_):
			print("group exist")
			done = false
			print("ERROR 0x0000001")
			print("Cleaning and Restart")
			remove_from_group(old_name_)
			add()
		else:
			print("A")
			
	if add == true:
		add()
		add = false
func add():
		done = false
		self.add_to_group(name_)
		
		return
