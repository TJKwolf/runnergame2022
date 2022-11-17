extends Spatial

var run_speed : float = 8.0
var jump_length : float = 5.5
var jump_height : float = 2.0

var inital_road_count :int = 5
var road_scenes = [
	load("res://road 1.tscn"),
	load("res://Road1e.tscn"),
	load("res://Road2e.tscn"),
	load("res://Road3e.tscn"),
]

onready var player = $Player
onready var camera_pivot = $pivot

# Called when the node enters the scene tree for the first time.
func _ready():
	player.setup_jump(jump_length, jump_height, run_speed)
	randomize()
	for i in range(inital_road_count):
		var road = make_random_road()
		road.translation.z = -(i+1) * 50
		add_child(road)




func make_random_road():
	var road_scene = road_scenes[randi() % road_scenes.size()]
	var road = road_scene.instance()
	return road




func _physics_process(delta):
	camera_pivot.translation = player.translation
	camera_pivot.translation.y = 0
