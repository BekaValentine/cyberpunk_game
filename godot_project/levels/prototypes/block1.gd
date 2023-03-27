extends RigidBody

var highlight_shape = null

func _ready():
	highlight_shape = $CSGBox

func _hold():
	$CSGBox.layers = 2
	$CSGBox2.layers = 2

func _release():
	$CSGBox.layers = 1
	$CSGBox2.layers = 1
