extends Node2D


func _ready():
	if Global.level < 0 or Global.level >= len(Levels.levels):
		Global.end_game(true)
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		var level = Levels.levels[Global.level]
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
