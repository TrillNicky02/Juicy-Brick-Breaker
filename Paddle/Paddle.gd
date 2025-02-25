extends CharacterBody2D

var target = Vector2.ZERO
var speed = 10.0
var width = 0
var width_default = 0
var decay = 0.02
var time_highlight = 0.4
var time_highlight_size = 0.3
var tween

func _ready():
	width = $CollisionShape2D.get_shape().size.x
	width_default = width
	target = Vector2(Global.VP.x / 2, Global.VP.y - 80)

func _physics_process(_delta):
	target.x = clamp(target.x, width/2, Global.VP.x - width/2)
	position = target
	if $Highlight.modulate.a > 0:
		$Highlight.modulate.a -= decay
		
	for c in $Powerups.get_children():
		c.payload()
		
		
	target.x = clamp(target.x, 0, Global.VP.x - 2*width)
	position = target
	var ball_container = get_node_or_null("/root/Game/Ball_Container")
	if ball_container != null and ball_container.get_child_count() > 0:
		var ball = ball_container.get_child(0)
		$Eye1/Pupil/Sprite.position.x = 7
		$Eye2/Pupil/Sprite.position.x = 7
		$Eye1/Pupil.look_at(ball.position)
		$Eye2/Pupil.look_at(ball.position)
		var d = ((($Mouth.global_position.y - ball.global_position.y)/Global.VP.y)-0.2)*2
		d = clamp(d, -1, 1)
		$Mouth.scale.y = d
	else:
		$Eye1/Pupil/Sprite.position.x = 0
		$Eye2/Pupil/Sprite.position.x = 0
		$Mouth.scale.y = 1

func _input(event):
	if event is InputEventMouseMotion:
		target.x += event.relative.x

func hit(_ball):
	$Highlight.modulate.a = 1.0
	$Confetti.emitting = true

	var Sound_Paddle = get_node("/root/Game/Sound_Paddle")
	Sound_Paddle.play()
	

	if tween:
		tween.kill()
	tween = create_tween().set_parallel(true)
	$Highlight.modulate.a = 1.0
	tween.tween_property($Highlight, "modulate:a", 0.0, time_highlight)
	$Highlight.scale = Vector2(1.5, 1.5)
	tween.tween_property($Highlight, "scale", Vector2(1.0,1.0), time_highlight_size).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)



func powerup(payload):
	for c in $Powerups.get_children():
		if c.type == payload.type:
			c.queue_free()
	$Powerups.call_deferred("add_child", payload)
