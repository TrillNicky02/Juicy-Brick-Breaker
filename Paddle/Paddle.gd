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

func _input(event):
	if event is InputEventMouseMotion:
		target.x += event.relative.x

func hit(_ball):
	$Highlight.modulate.a = 1.0
	$Confetti.emitting = true
	#START NEW CODE
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
