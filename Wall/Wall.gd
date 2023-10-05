extends StaticBody2D

var decay = 0.01

func _ready():
	pass

func _physics_process(_delta):
	pass

func hit(_ball):
	var sound_wall = get_node("/root/Game/Sound_Wall")
	sound_wall.play()
