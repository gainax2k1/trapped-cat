extends Node


#fs = full_script is a dictionary of string:txt obj
var FS = load("res://Scripts/FullTxtDictionary.tres")
var NullThing : TxtThing

func get_thing(txtName: String) -> TxtThing:
	print("txtName: ", txtName)
	var result = null
	if FS.TScript.has(txtName):
		result = FS.TScript[txtName]
	if (result != null):
		print("found" + txtName)
		return result
	else:
		print("not found" + txtName)
		return NullThing

func get_thing_txt(txtName: String) -> String:
	var retrieved = get_thing(txtName)
	return retrieved.TXT

func get_thing_button_1(txtName: String) -> String:
	var retrieved = get_thing(txtName)
	return retrieved.Button1
	
func get_thing_button_2(txtName: String) -> String:
	var retrieved = get_thing(txtName)
	return retrieved.Button2	
