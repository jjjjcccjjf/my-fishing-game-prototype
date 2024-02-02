extends Node2D


var picked_up: bool
var picked_up_by: Node2D
var item_body: RigidBody2D
var pickup_magnet: Area2D
var pickup_range: Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	item_body = $RigidBody2D
	pickup_magnet = $PickupMagnet
	pickup_range = $PickupRange
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pickup_magnet.global_position = item_body.global_position
	pickup_range.global_position = item_body.global_position
	
	if picked_up and picked_up_by is CharacterBody2D:
		follow_body_entered(picked_up_by.global_position, delta)
	pass 


func _on_area_2d_body_entered(body):
	picked_up = true
	picked_up_by = body
	pass # Replace with function body.

func follow_body_entered(target, delta):
	#$RigidBody2D.velocity = move_toward(position, 300, delta)
	var direction = (target - item_body.global_position).normalized()
	direction.y += -80 * delta
	item_body.apply_central_impulse(direction * 800 * delta)
	pass

func _on_area_2d_body_exited(body):
	picked_up = false
	picked_up_by = null
	pass # Replace with function body.
	
func _on_pickup_range_body_entered(body):
	if body is CharacterBody2D:
		queue_free();
	pass # Replace with function body.
