extends Node

class Damageable:
	#signal damage_signal
	func get_damage():
		pass

func node_implements_interface(node_to_check:Node, interface) -> bool:
	if "implements" in node_to_check:
		var node_implements = node_to_check.implements

		if not node_implements is Array:
			if node_implements == interface:
				return true
		else: 
			for implemented_interface in node_implements:
				if implemented_interface == interface:
					return true
		
	return false


## Get an array of all the descendants of the given node, and includes the given node
func _get_all_descendants(node:Node) -> Array:
	var all_descendants = [node]
	
	var children = node.get_children()
	for child in children:
		all_descendants.append_array(_get_all_descendants(child))

	return all_descendants
	


func _ready():
	var all_the_darn_nodes = _get_all_descendants(get_tree().current_scene)
	
	for node in all_the_darn_nodes:
		_check_node(node)
	
	get_tree().node_added.connect(_check_node)


## Checks to the given node's methods, properties, and signals to see if they match the
## interface's methods, properties, and signals, throwing an error if not. 
func _check_node(node:Node) -> void:
	if "implements" in node:
		var node_implements = node.implements
		
		var check = func (node, interface_instance):
			var err_string:String = "Interface error: " + node.name + " does not possess the "
		
			
			## NOTE: if an error happened here, it's because your interface system probably worked!
			## Check the error in your Godot editor to see which method, property, or signal
			##   did not match the interface you set up above
			for method in interface_instance.get_script().get_script_method_list():
				assert(method.name in node, err_string + method.name + " method.")
			for this_signal in interface_instance.get_script().get_script_signal_list():
				assert(this_signal.name in node, err_string + this_signal.name + " signal.")
			var prop_list:Array = interface_instance.get_script().get_script_property_list()
			for i in range(1, prop_list.size()):  # skip first property as the default is the property "Built-in script"
				var property = prop_list[i]
				assert(property.name in node, err_string + property.name + " property.")
			
		
		if not node_implements is Array: 
			var instance = node.implements.new()
			check.call(node, instance)
		else:
			for implemented_interface in node_implements:
				var instance = implemented_interface.new()
				check.call(node, instance)
