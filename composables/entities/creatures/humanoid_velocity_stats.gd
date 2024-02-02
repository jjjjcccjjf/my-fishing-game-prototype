extends Node
class_name HumanoidVelocityStats

@export var max_speed: int = 150	
@export var acceleration: float = 500.0
@export var friction: float = 1000.0
@export var jump_velocity: int = -216 # magic number for 6/10ths of a humanoid character height
@export var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity", 980)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
