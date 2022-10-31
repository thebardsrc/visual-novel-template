extends Control

@export var starting_timeline:String 

################################################################################
##								PUBLIC
################################################################################

func open():
	show()
	await get_tree().create_timer(0.2)
	$Buttons/NewGame_Button.grab_focus()

################################################################################
##								PRIVATE
################################################################################

func _ready():
	open()

func _on_NewGame_Button_pressed():
	get_parent().get_node("MenuMusic").playing = false
	var scene = load("res://addons/dialogic/Other/DefaultDialogNode.tscn").instantiate()
	add_child(scene)

	
	randomize()
	Dialogic.start_timeline(starting_timeline)


	
	#dialog.layer = 0
	#get_parent().add_game_node(dialog)
	$Buttons/NewGame_Button.release_focus()

func _on_LoadGame_Button_pressed():
	hide()
	get_parent().get_node("SubMenus").open_load_menu()

func _on_Settings_Button_pressed():
	hide()
	get_parent().get_node("SubMenus").open_settings_menu()

func _on_About_Button_pressed():
	hide()
	get_parent().get_node("SubMenus").open_about_menu()

func _on_Quit_Button_pressed():
	get_tree().quit()
