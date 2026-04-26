extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jump_delay = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("a", "d")
	
	if is_on_floor():
		if direction:
			velocity.x = move_toward(velocity.x, direction * SPEED, SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		if direction:
			velocity.x = move_toward(velocity.x, direction * SPEED, SPEED/25)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED/25)

	# Handle jump.
	if Input.is_action_pressed("ui_accept") or Input.is_action_pressed("w"):
		if is_on_floor() and jump_delay >10:
			velocity.y = JUMP_VELOCITY


	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()
	jump_delay+=1


func _on_bal_body_entered(body: Node2D) -> void:
	if body is TileMap: # Replace with function body.
		if not is_on_floor():
			if Input.is_action_pressed("w") or Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_VELOCITY
				velocity.x = 400.0

func _on_jobb_body_entered(body: Node2D) -> void:
	if body is TileMap: # Replace with function body.
		if not is_on_floor():
			if Input.is_action_pressed("w") or Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_VELOCITY
				velocity.x = -400.0 # Replace with function body.
