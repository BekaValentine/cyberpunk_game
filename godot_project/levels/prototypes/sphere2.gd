extends RigidBody

var highlight_shape = null

func _ready():
	highlight_shape = $CSGSphere

func _hold():
	$CSGSphere.layers = 2

func _release():
	$CSGSphere.layers = 1

func take():
	print("taken!")
