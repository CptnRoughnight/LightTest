extends Node2D


@onready var fpsLabel : Label = $Debug/HBoxContainer/FPS
@onready var lightsLabel : Label = $Debug/HBoxContainer/Lights
@onready var lights : Node2D = $Lights
@onready var timer : Timer = $AnimationTimeOut

# test system ryzen 7 5800x Radeon 6600Xt 32g räm
# forward+ 140fps
# compatible 225 - visible artifacts


func _ready() -> void:
	lightsLabel.text = "Lights : " + str(lights.get_child_count())
	
func _physics_process(_delta: float) -> void:
	fpsLabel.text = "FPS : " + str(Engine.get_frames_per_second())
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func beocht_na_solise() -> void:
	for deligt in lights.get_children():
		var newpos : Vector2 = Vector2(16+randf()*500,randf()*230)
		var newstrength : float = randf() * 4
		var tween : Tween = get_tree().create_tween()
		tween.tween_property(deligt,"position",newpos,3.0)
		tween.play()
		deligt.set("energy",newstrength)



func _on_animation_time_out_timeout() -> void:
	beocht_na_solise()
	timer.start(4)
