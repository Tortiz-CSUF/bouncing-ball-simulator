extends Node2D

@onready var ball: RigidBody2D = $Ball

@onready var gravity_spin: SpinBox = $UI/ControlPanel/VBox/Gravity/SpinBox
@onready var mass_spin: SpinBox = $UI/ControlPanel/VBox/Mass/SpinBox
@onready var bounce_spin: SpinBox = $UI/ControlPanel/VBox/Bounce/SpinBox

var ball_material: PhysicsMaterial

func _ready() -> void:
	# must have a live editable material
	if ball.physics_material_override:
		ball_material = ball.physics_material_override.duplicate()
		
	else:
		ball_material = PhysicsMaterial.new()
		
	ball.physics_material_override = ball_material
	
	# initialize UI from current ball values (default)
	gravity_spin.value = ball.gravity_scale
	mass_spin.value = ball.mass
	bounce_spin.value = ball_material.bounce
	
	# connection hooks
	gravity_spin.value_changed.connect(_on_gravity_changed)
	mass_spin.value_changed.connect(_on_mass_changed)
	bounce_spin.value_changed.connect(_on_bounce_changed)
	
	
# functions for on_x_changed
func _on_gravity_changed(value: float) -> void:
	ball.gravity_scale = value
	
func _on_mass_changed(value: float) -> void:
	ball.mass = max(0.01, value)
	
func _on_bounce_changed(value: float) -> void:
	ball_material.bounce = clamp(value, 0.0, 1.0)
	
