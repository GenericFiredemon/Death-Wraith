extends Area2D

export (PackedScene) var bullet_scene
export var speed = 650
var screen_size = Vector2.ZERO


func _ready():
	screen_size = get_viewport_rect().size
#	hide()

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var direction = Vector2.ZERO
	if Input.is_action_pressed("shoot"):
		_on_player_shoot()
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	# UP IS A NEGATIVE VALUE DOWN IS A POSITIVE VALUE.
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if direction.length() > 0:
		direction = direction.normalized()
	else:
		$AnimatedSprite.stop()
		
	position += direction * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_player_shoot():
	var bullet_spawn_location = $Muzzle
	bullet_spawn_location.unit_offset = $Muzzle.position
	
	var bullet = bullet_scene.instance()
	add_child(bullet)
	
	bullet.transform = $Muzzle.transform
	
	
