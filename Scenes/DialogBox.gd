extends Control

var dialog = [
	'Hey! The weather is nice and cool today, isn\'t it!',
	'I hope you enjoy your time here!'
]

var dialog_index = 0
var finished =  false

func _ready():
	$Speaker.bbcode_text = 'Penny'
	load_dialog()

func _process(delta):
	$Indicator.visible = finished
	if Input.is_action_just_pressed('ui_accept'):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$Dialog.bbcode_text = dialog[dialog_index]
		$Dialog.percent_visible = 0
		$Tween.interpolate_property(
			$Dialog, 'percent_visible', 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
