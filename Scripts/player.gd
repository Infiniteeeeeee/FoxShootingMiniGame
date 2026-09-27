extends CharacterBody2D


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#velocity = Vector2(50, 0)
	##pass # Replace with function body.

@export var move_speed : float = 50
@export var animator : AnimatedSprite2D

# 玩家状态
@export var is_game_over : bool = false

@export var bullet_scene : PackedScene

func _process(delta: float) -> void:
	if velocity == Vector2.ZERO or is_game_over:
		$Running.stop()
		
	elif not $Running.playing:
		$Running.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_game_over:
		#print(Input.get_vector("left", "right", "up", "down"))
		velocity = Input.get_vector("left", "right", "up", "down") * move_speed
		
		# 如果速度为0，播放待机动画，反之跑步动画
		if velocity == Vector2.ZERO:
			animator.play("idle")
		else:
			animator.play("run")
		
		move_and_slide()
		#pass
	
func game_over():
	if not is_game_over:
		is_game_over = true
		animator.play("gameover")
		
		get_tree().current_scene.show_game_over()
		
		$GameOver.play()
		
		$RestartTimer.start()


func _on_fire() -> void:
	
	if velocity != Vector2.ZERO or is_game_over:
		return
	
	$FireSound.play()
	
	var bullet_node = bullet_scene.instantiate()
	bullet_node.position = position + Vector2(6, 6)
	get_tree().current_scene.add_child(bullet_node)


func _reload_scene() -> void:
	get_tree().reload_current_scene()
