extends Node2D

@onready var ball: RigidBody2D = $Ball

@onready var gavity_spin: SpinBox = $UI/ControlPanel/VBox/Gravity/SpinBox
@onready var mass_spin: SpinBox = $UI/ControlPanel/VBox/Mass/SpinBox
@onready var bounce_spin: SpinBox = $UI/ControlPanel/VBox/Bounce/SpinBox

var ball_material: PhysicsMaterial

func _ready() -> void:
	# must have a live editable material
	if ball.physics_material_override:
		ball_material = ball.physics_material_override.duplicate()
		
	else:
		ball_material = PhysicsMaterial.new()
