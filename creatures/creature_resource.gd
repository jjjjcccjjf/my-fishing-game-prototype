extends Resource
class_name CreatureResource

@export var str_stat = 1
@export var dex_stat = 1
@export var con_stat = 1
@export var wis_stat = 1
@export var int_stat = 1
@export var cha_stat = 1

@export var hit_points = 100
@export var stamina_points = 100

@export var max_speed = 100
@export var acceleration = 1000.0
@export var friction = 500.0
@export var jump_velocity = -216 # magic number for 6/10ths of a humanoid character height
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
