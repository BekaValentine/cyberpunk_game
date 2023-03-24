extends RigidBody

var highlight_shape = null

func _ready():
	highlight_shape = $CSGSphere

func take():
	print("taken!")
