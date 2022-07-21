extends Area2D

export var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta
	
func on_Bullet_body_entered_(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
	

