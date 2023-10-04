extends StaticBody2D

var score = 0
var new_position = Vector2.ZERO
var dying = false


var time_appear = 0.5
var time_fall = 0.8
var time_rotate = 1.0
var time_a = 0.8
var time_s = 1.2
var time_v = 1.5
var tween


var powerup_prob = 0.1

func _ready():
	randomize()
	position = new_position
	

	process_mode = Node.PROCESS_MODE_ALWAYS
	position.x = new_position.x
	position.y = -100
	tween = create_tween()
	tween.tween_property(self, "position", new_position, 0.5 + randf()*2).set_trans(Tween.TRANS_BOUNCE)

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
	
	#Start NEW CODE
	if tween:
		tween.kill()
	tween = create_tween().set_parallel(true)
	tween.tween_property(self, "position", Vector2(position.x, 1000), time_fall).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "rotation", -PI + randf()*2*PI, time_rotate).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($ColorRect, "color:a", 0, time_a)
	tween.tween_property($ColorRect, "color:s", 0, time_s)
	tween.tween_property($ColorRect, "color:v", 0, time_v)
	
	#END NEW CODE
	
	if randf() < powerup_prob:
		var Powerup_Container = get_node_or_null("/root/Game/Powerup_Container")
		if Powerup_Container != null:
			var Powerup = load("res://Powerups/Powerup.tscn")
			var powerup = Powerup.instantiate()
			powerup.position = position
			Powerup_Container.call_deferred("add_child", powerup)
			
			
