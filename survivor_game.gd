extends Node2D

var score = 0

func _ready() -> void:
	%ScoreLabel.text = str("Score : ", score)


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	new_mob.mob_dead.connect(_on_mob_dead)


func _on_timer_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true
	
func _on_mob_dead():
	score += 10
	%ScoreLabel.text = str("Score : ", score)
