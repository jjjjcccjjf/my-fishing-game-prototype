extends Node
class_name GroundedMovementVelocityInput

# Get access to the actor this node will be manipulating
@export var actor: CharacterBody2D

# Get access to the movement stats that will be used to move the actor
@export var creature_resource: CreatureResource
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var actorCollisionShape: CollisionShape2D
var sprite: AnimatedSprite2D
var actorMaxJumpHeight: float

func _ready():
	actorCollisionShape = actor.find_child("CollisionShape2D")
	sprite = actor.find_child('AnimatedSprite2D')
	actorMaxJumpHeight = actorCollisionShape.shape.size.y
	pass;
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not actor.is_on_floor():
		actor.velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and actor.is_on_floor():
		actor.velocity.y = actorMaxJumpHeight * .6 * -7.5
		#actor.velocity.y = creature_resource.jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		actor.velocity.x = direction * creature_resource.max_speed
		sprite.play("moving")
		sprite.flip_h = actor.velocity.x > 0
	else:
		actor.velocity.x = move_toward(actor.velocity.x, 0, creature_resource.max_speed)
		sprite.play("idle")
	actor.move_and_slide() 
