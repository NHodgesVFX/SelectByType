extends Control
@tool





# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var plugin = EditorPlugin.new()
	var interface = plugin.get_editor_interface()
	var sel = interface.get_selection()
	
	var line_edit = $Panel/VBoxContainer/LineEdit
	var _type = line_edit.text
	
	sel.clear()
	
	var scene = get_tree().edited_scene_root
	
	for node in get_all_children(scene):
		if node.get_class() == _type:
			sel.add_node(node)
		
	
func get_all_children(node):
	var children = []
	var process = []
	
	var start = node.get_children()
	process.append_array(start)
	
	while process.size() != 0:
		var active = process.pop_front()
		var active_children = active.get_children()
		
		children.append(active)
		process.append_array(active_children)
		
	return children
