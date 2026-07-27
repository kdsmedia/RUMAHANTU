## ActionButton — small HUD button that fires an input action on touch/click.
## Attach this script to any Button node, set input_action in the Inspector.
extends Button

## The input action name (must exist in Project Settings → Input Map).
@export var input_action: String = ""

func _ready() -> void:
	# Make sure the button eats touch events so the joystick below won't also fire.
	mouse_filter = Control.MOUSE_FILTER_STOP
	# Prevent the default focus visual from flashing on touch.
	focus_mode = Control.FOCUS_NONE

func _gui_input(event: InputEvent) -> void:
	if input_action.is_empty():
		return

	# Touch screens
	if event is InputEventScreenTouch:
		if event.pressed:
			Input.action_press(input_action)
		else:
			Input.action_release(input_action)
		get_viewport().set_input_as_handled()

	# Desktop mouse (editor testing with emulate_touch_from_mouse=true)
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				Input.action_press(input_action)
			else:
				Input.action_release(input_action)
			get_viewport().set_input_as_handled()
