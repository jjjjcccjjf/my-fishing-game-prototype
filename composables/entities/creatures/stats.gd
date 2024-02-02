extends Node
class_name Stats

@export var str_stat: int
@export var dex_stat: int
@export var con_stat: int
@export var wis_stat: int
@export var int_stat: int
@export var cha_stat: int

@export var hit_points: float
@export var stamina_points: float

# Called when the node enters the scene tree for the first time.
func _ready():
	str_stat = 1
	dex_stat = 1
	con_stat = 1
	wis_stat = 1
	int_stat = 1
	cha_stat = 1

	hit_points = str_stat * 20
	stamina_points = dex_stat * 100
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
