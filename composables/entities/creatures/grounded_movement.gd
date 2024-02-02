extends Node

class_name GroundedMovementInput

# Get access to the actor this node will be manipulating
@export var actor: CharacterBody2D

# Get access to the movement stats that will be used to move the actor
@export var velocity_stats: HumanoidVelocityStats

var gravity 
var actorMaxJumpHeight
var actorCollisionShape: CollisionShape2D
var sprite: AnimatedSprite2D

func _ready():
	gravity = velocity_stats.gravity
	actorCollisionShape = actor.find_child("CollisionShape2D")
	actorMaxJumpHeight = actorCollisionShape.shape.size.y
	sprite = actor.find_child('AnimatedSprite2D')
	pass;
	
func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	handle_jump() 
	handle_acceleration(delta)
	actor.move_and_slide() 

func handle_jump():
	if actor.is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			actor.velocity.y = actorMaxJumpHeight * .6 * -8.5
	else:
		if Input.is_action_just_released("ui_accept") and actor.velocity.y < actorMaxJumpHeight * .6 * -8.5 / 2:
			actor.velocity.y = actorMaxJumpHeight * .6 * -8.5 / 2
			
func apply_gravity(delta):
	if not actor.is_on_floor():
		#print(actor.velocity.x)
		actor.velocity.y += gravity * 1 * delta # 1 is gravity_scale
		#actor.velocity.x = move_toward(actor.velocity.x, velocity_stats.max_speed * actor.velocity.x, velocity_stats.friction * delta)
func handle_acceleration(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		actor.velocity.x = move_toward(actor.velocity.x, velocity_stats.max_speed * direction, velocity_stats.acceleration * delta)
		sprite.play("walk")
		sprite.flip_h = actor.velocity.x < 0
	else:
		if actor.is_on_floor():
			# deceleration
			actor.velocity.x = move_toward(actor.velocity.x, 0, velocity_stats.friction * delta)
		else:
			# air resistance
			actor.velocity.x = move_toward(actor.velocity.x, 0, velocity_stats.friction / 2 * delta)
		sprite.play("idle")
