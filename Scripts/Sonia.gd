extends CharacterBody2D

@export var speed : float
var run : bool = false

func _process(delta):
	Motion_ctrl()
	Ray_cast_ctrl()
	pass
	
func Motion_ctrl():
	Direction_ctrl()
	Animation_ctrl()
	Speed_ctrl()
	move_and_slide()
	pass
	
func Direction_ctrl():
	velocity.x = Globalscript.get_axis().x * speed
	velocity.y = Globalscript.get_axis().y * -speed
	pass
	
func Animation_ctrl():
	Walk_Run_animation_ctrl()
	pass
	
func Walk_Run_animation_ctrl():
	if run:
		Run_animation_ctrl()
	else:
		Walk_animation_ctrl()
		pass
	
func Run_animation_ctrl():
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_up"):
			$AnimationPlayer.play("run_up_right")
		elif Input.is_action_pressed("ui_down"):
			$AnimationPlayer.play("run_down_right")
		else:
			$AnimationPlayer.play("run_right")
			pass
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_up"):
			$AnimationPlayer.play("run_up_left")
		elif Input.is_action_pressed("ui_down"):
			$AnimationPlayer.play("run_down_left")
		else:
			$AnimationPlayer.play("run_left")
			pass
	elif Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_left"):
			$AnimationPlayer.play("run_up_left")
		elif Input.is_action_pressed("ui_right"):
			$AnimationPlayer.play("run_up_right")
		else:
			$AnimationPlayer.play("run_up")
			pass
	elif Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_left"):
			$AnimationPlayer.play("run_down_left")
		elif Input.is_action_pressed("ui_right"):
			$AnimationPlayer.play("run_down_right")
		else:
			$AnimationPlayer.play("run_down")
			pass
	else:
		$AnimationPlayer.play("idle")
		pass
	pass
	
func Walk_animation_ctrl():
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_up"):
			$AnimationPlayer.play("walk_up_right")
		elif Input.is_action_pressed("ui_down"):
			$AnimationPlayer.play("walk_down_right")
		else:
			$AnimationPlayer.play("walk_right")
			pass
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_up"):
			$AnimationPlayer.play("walk_up_left")
		elif Input.is_action_pressed("ui_down"):
			$AnimationPlayer.play("walk_down_left")
		else:
			$AnimationPlayer.play("walk_left")
			pass
	elif Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_left"):
			$AnimationPlayer.play("walk_up_left")
		elif Input.is_action_pressed("ui_right"):
			$AnimationPlayer.play("walk_up_right")
		else:
			$AnimationPlayer.play("walk_up")
			pass
	elif Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_left"):
			$AnimationPlayer.play("walk_down_left")
		elif Input.is_action_pressed("ui_right"):
			$AnimationPlayer.play("walk_down_right")
		else:
			$AnimationPlayer.play("walk_down")
			pass
	else:
		$AnimationPlayer.play("idle")
		pass
	
func Speed_ctrl():
	if Input.is_action_just_pressed("Run"):
		speed = 200
		run = true
	elif Input.is_action_just_released("Run"):
		speed = 120
		run = false
		pass
	pass
	
func Ray_cast_ctrl():
	if $SoniaRayCasts/SoniaRayCast2DRight.is_colliding() or $SoniaRayCasts/SoniaRayCast2DLeft.is_colliding() or $SoniaRayCasts/SoniaRayCast2DUp.is_colliding():
		z_index = 3
	else:
		z_index = 1
		pass
	pass
