extends CharacterBody2D

# Demo-only stand-in player so this pack stays standalone. Zones just need a
# body in the "player" group.

@export var speed: float = 220.0


func _ready() -> void:
	add_to_group("player")


func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed
	move_and_slide()
