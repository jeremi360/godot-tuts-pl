extends Node

var collected = 0 setget _set_collected, _get_collected
var to_collect = 0

const default_camera_zoom = 0.7
var camera_zoom

const default_window_size = Vector2(1024, 600)
var _prev_window_size
var window_size setget _set_window_size, _get_window_size

signal collected_changed
signal window_resize
signal window_minimized
signal window_maximized
signal window_fullscreen

func _ready():
	camera_zoom = default_camera_zoom
	_prev_window_size = default_window_size

func _set_collected(value):
	collected = value
	emit_signal("collected_changed")

func _get_collected():
	return collected

func _set_window_size(value):
	if value == _prev_window_size:
		return
	_prev_window_size = value
	OS.window_size = value
	emit_signal("window_resize")

func _get_window_size():
	return OS.window_size

func _process():
	if OS.window_minimized:
		emit_signal("window_minimized")
	
	if OS.window_maximized:
		emit_signal("window_maximized")
	
	if OS.window_fullscreen:
		emit_signal("window_fullscreen")
