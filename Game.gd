extends Node2D


func _ready():
	pass
	
# Music and sound effects
#	var level = Levels.levels[Global.level]
#	var Music = get_node_or_null("/root/Game/Music")
#	var Sound_Brick = get_node_or_null("/root/Game/Sound_Brick")
#	var Sound_Wall = get_node_or_null("/root/Game/Sound_Wall")
#	var Sound_Paddle = get_node_or_null("/root/Game/Sound_Paddle")
#	Sound_Paddle.play()
#	Sound_Paddle.play()
#	Sound_Paddle.play()
#	Sound_Paddle.play()
#	var Sound_Die = get_node_or_null("/root/Game/Sound_Die")
#	var Sound_Start = get_node_or_null("/root/Game/Sound_Start")
#	if Music != null:
#		Music.stream = load(level["music"])
#		Music.play()
#	if Sound_Wall != null:
#		Sound_Wall.stream = load(level["sound_wall"])
#	if Sound_Paddle != null:
#		Sound_Paddle.stream = load(level["sound_paddle"])
#	if Sound_Brick != null:
#		Sound_Brick.stream = load(level["sound_brick"])
#	if Sound_Die != null:
#		Sound_Die.stream = load(level["sound_die"])
#	if Sound_Start != null:
#		Sound_Start.stream = load(level["sound_start"])
	
	
	
	
	
	if Global.level < 0 or Global.level >= len(Levels.levels):
		Global.end_game(true)
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		var level = Levels.levels[Global.level]
		#print(level)
		var margin = level["layout_start"]
		var index = level["layout_spacing"]
		var layout = level["layout"]
		var Brick_Container = get_node_or_null("/root/Game/Brick_Container")
		Global.time = level["timer"]
		if Brick_Container != null:
			
			
			for rows in range(len(layout)):
				for cols in range(len(layout[rows])):
					var score = layout[rows][cols]
					if score >= 100:
						var Brick = load("res://Brick/Brick1.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
					elif score >= 90:
						var Brick = load("res://Brick/Brick2.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
					elif score >= 80:
						var Brick = load("res://Brick/Brick3.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
					elif score >= 70:
						var Brick = load("res://Brick/Brick4.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
					elif score >= 60:
						var Brick = load("res://Brick/Brick5.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
					elif score >= 50:
						var Brick = load("res://Brick/Brick6.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
					elif score >= 40:
						var Brick = load("res://Brick/Brick7.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
					elif score >= 30:
						var Brick = load("res://Brick/Brick8.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
						
					else:
						
						var Brick = load("res://Brick/Brick.tscn")
						
						var brick = Brick.instantiate()
						brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-100)
						brick.score = layout[rows][cols]
						Brick_Container.add_child(brick)
						
						
						
					
			
			
			#var Brick = load("res://Brick/Brick7.tscn")
			
			
			#if score >= 100:
			#	var Brick = load("res://Brick/Brick1.tscn")
			#elif score >= 90:
			#	var Brick = load("res://Brick/Brick2.tscn")
			#elif score >= 80:
			#	var Brick = load("res://Brick/Brick3.tscn")
			#elif score >= 70:
			#	var Brick = load("res://Brick/Brick4.tscn")
			#elif score >= 60:
			#	var Brick = load("res://Brick/Brick5.tscn")
			#elif score >= 50:
			#	var Brick = load("res://Brick/Brick6.tscn")
			#elif score >= 40:
			#	var Brick = load("res://Brick/Brick7.tscn")
			#elif score >= 30:
				#var Brick = load("res://Brick/Brick8.tscn")
			#else:
				#var Brick = load("res://Brick/Brick.tscn")
				
				
			#for rows in range(len(layout)):
				#for cols in range(len(layout[rows])):
					#if layout[rows][cols] > 0:
						#var brick = Brick.instantiate()
						#brick.new_position = Vector2(margin.x + index.x*cols, margin.y + index.y*rows)
						#brick.position = Vector2(brick.new_position.x,-100)
						#brick.score = layout[rows][cols]
						#Brick_Container.add_child(brick)
		var Instructions = get_node_or_null("/root/Game/UI/Instructions")
		if Instructions != null:
			Instructions.set_instructions(level["name"],level["instructions"])
		
		var themusic
		if (level["name"]) == "Level 1":
			themusic = get_node("/root/Game/Music3")
		if (level["name"]) == "Level 2":
			themusic = get_node("/root/Game/Music2")
		if (level["name"]) == "Bonus Round":
			themusic = get_node("/root/Game/Music1")
		
		
		themusic.play()
			
