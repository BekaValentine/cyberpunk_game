extends KinematicBody

export var fall_limit = -100
export var gravity = -9.8
export var jump_speed = 2.0
export var mouse_sensitivity = 0.002
export var run_speed = 5.0
export var walk_speed = 1.0
export var push_force = 1

var crouch_tween = null
var camera = null
var pivot = null
var pickup_detect_ray = null
var hold_position = null
var held_object = null
var should_show_highlight = true
var object_highlight = null
var self_initial_rotation = Vector3.ZERO
var held_object_initial_rotation = Vector3.ZERO
var velocity = Vector3.ZERO
var velocity_after_move_and_slide = null
var stand_height = null
var crouch_height = 0.75
var crouch_time = 0.25
var crouching = false
var in_crouching_transition = false
var equipped_object = null
var pushed_objects = []
var pushed_objects_changed = false

var tick = 0






func _ready():
	crouch_tween = $crouch_tween
	pivot = $pivot
	stand_height = pivot.transform.origin.y
	camera = $pivot/camera
	hold_position = $hold_position
	pickup_detect_ray = $pivot/pickup_detect_ray
	object_highlight = $object_highlight
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		self.rotate_y(-event.relative.x * mouse_sensitivity)
		pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		pivot.rotation.x = clamp(pivot.rotation.x, -1.2, 1.2)
	elif Input.is_action_pressed("crouch"):
		toggle_crouch()

func toggle_crouch():
	if not in_crouching_transition:
		crouching = !crouching
		
		crouch_tween.interpolate_method(
			self,
			"set_camera_height",
			pivot.transform.origin.y,
			crouch_height if crouching else stand_height,
			crouch_time,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT
		)
		in_crouching_transition = true
		crouch_tween.start()

func finished_crouching_transition():
	in_crouching_transition = false

func set_camera_height(h):
	pivot.transform.origin.y = h

func move(delta):
	var move_direction = Vector3.ZERO
	# determine the direction to move in
	var basis = global_transform.basis
	if Input.is_action_pressed("move_forward"):
		move_direction -= basis.z
	if Input.is_action_pressed("move_backward"):
		move_direction += basis.z
	if Input.is_action_pressed("move_left"):
		move_direction -= basis.x
	if Input.is_action_pressed("move_right"):
		move_direction += basis.x
			
	if is_on_floor():
		# we're walking, running, or jumping
		
		# determine the horizontal velocity to move
		var speed
		if Input.is_action_pressed("run"):
			# we're running
			speed = run_speed
		else:
			# we're walking
			speed = walk_speed

		var vel = move_direction.normalized() * speed
		velocity.x = vel.x
		velocity.z = vel.z
		
		# determine the vertical velocity
		if Input.is_action_just_pressed("jump"):
			# we're jumping, so we just set the vertical speed
			velocity.y = jump_speed
		
	else:
		# we're falling
		velocity.y += gravity * delta

#	$velocity.set_rotation(-self.rotation)
#	$velocity.rotate_y(sign(Vector3(0,0,-1).cross(Vector3(move_direction.x, 0, move_direction.z)).y)*Vector3(0,0,-1).angle_to(Vector3(move_direction.x, 0, move_direction.z)))
	
	velocity = move_and_slide(velocity, Vector3.UP,true)
	

	#prevents infinite falling
	if translation.y < fall_limit:
		scene_manager.reload_scene()

func interact_objects():
	if held_object:
		hide_highlight()
		holding_object()
		return
	
	var raycast_hit = pickup_detect_ray.get_collider()
	
	if raycast_hit and should_show_highlight:
		show_highlight(raycast_hit)
	else:
		hide_highlight()
	
	if not raycast_hit:
		return
	
	if raycast_hit.is_in_group("manipulate"):
		pickup_object(raycast_hit)

	elif raycast_hit.is_in_group("use"):
		use_object(raycast_hit)

func holding_object():
	if Input.is_action_just_pressed("primary_interaction"):
		throw_held_object()
		
	elif Input.is_action_just_pressed("secondary_interaction"):
		drop_held_object()

func pickup_object(obj):
	if Input.is_action_just_pressed("primary_interaction"):
		hold_object(obj)

func use_object(obj):
	if Input.is_action_just_pressed("primary_interaction"):
		obj.use(equipped_object)

func show_highlight(obj):
	var bounds = obj.highlight_shape.get_transformed_aabb()
	var origin = bounds.position
	var size = bounds.size
	var points = [
		camera.unproject_position(origin),
		camera.unproject_position(origin + Vector3(size.x,0,0)),
		camera.unproject_position(origin + Vector3(size.x,0,size.z)),
		camera.unproject_position(origin + Vector3(size.x,size.y,0)),
		camera.unproject_position(origin + Vector3(size.x,size.y,size.z)),
		camera.unproject_position(origin + Vector3(0,size.y,0)),
		camera.unproject_position(origin + Vector3(0,size.y,size.z)),
		camera.unproject_position(origin + Vector3(0,0,size.z)),
	]
	
	var left = points[0].x
	var top = points[0].y
	var right = points[0].x
	var bottom = points[0].y
	
	for p in points:
		if p.x < left:
			left = p.x
		
		if right < p.x:
			right = p.x
		
		if p.y < top:
			top = p.y
		
		if bottom < p.y:
			bottom = p.y
	
	object_highlight.set_position(Vector2(left,top))
	object_highlight.set_size(Vector2(right-left,bottom-top))
	object_highlight.visible = true

func hide_highlight():
	object_highlight.visible = false

func rotate_held_object():
	if held_object:
		held_object.global_transform.origin = hold_position.global_transform.origin
		var delta_rotation = self.get_rotation() - self_initial_rotation
#		$debug_message.show_text(str(delta_rotation))
		held_object.set_rotation(held_object_initial_rotation + delta_rotation)

func hold_object(obj):
	held_object = obj
	self_initial_rotation = self.get_rotation()
	if held_object.transform.basis.y.angle_to(Vector3.UP) > 0.01:
		held_object_initial_rotation = Vector3.ZERO
	else:
		held_object_initial_rotation = held_object.get_rotation()
	held_object.mode = RigidBody.MODE_KINEMATIC
	held_object.collision_mask = 4

func throw_held_object():
	if held_object:
		held_object.mode = RigidBody.MODE_STATIC
#		held_object.collision_mask = 1 | 4
		held_object.apply_impulse(Vector3(0,0,0), -10*camera.global_transform.basis.z)
		held_object = null

func drop_held_object():
	if held_object:
		held_object.mode = RigidBody.MODE_STATIC
#		held_object.collision_mask = 1 | 4
		held_object = null

func _physics_process(delta):
	tick += 1
	move(delta)
	rotate_held_object()
	interact_objects()
