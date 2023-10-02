extends StaticBody2D

var score = 0
var new_position = Vector2.ZERO
var dying = false

var powerup_prob = 0.1

func _ready():
	randomize()
	position = new_position
	
	if score >= 100:
		var Brick = load("res://Brick/Brick1.tscn")
		
	elif score >= 90:
		var Brick = load("res://Brick/Brick2.tscn")
	elif score >= 80:
		var Brick = load("res://Brick/Brick3.tscn")
	elif score >= 70:
		var Brick = load("res://Brick/Brick4.tscn")
	elif score >= 60:
		var Brick = load("res://Brick/Brick5.tscn")
	elif score >= 50:
		var Brick = load("res://Brick/Brick6.tscn")
	elif score >= 40:
		var Brick = load("res://Brick/Brick7.tscn")
	elif score >= 30:
		var Brick = load("res://Brick/Brick8.tscn")
	else:
		var Brick = load("res://Brick/Brick.tscn")
		

func _physics_process(_delta):
	if dying and not $Confetti.emitting:
		queue_free()

func hit(_ball):
	die()

func die():
	dying = true
	collision_layer = 0
	$Confetti.emitting = true
	$ColorRect.hide()
	Global.update_score(score)
	if not Global.feverish:
		Global.update_fever(score)
	get_parent().check_level()
	if randf() < powerup_prob:
		var Powerup_Container = get_node_or_null("/root/Game/Powerup_Container")
		if Powerup_Container != null:
			var Powerup = load("res://Powerups/Powerup.tscn")
			var powerup = Powerup.instantiate()
			powerup.position = position
			Powerup_Container.call_deferred("add_child", powerup)
