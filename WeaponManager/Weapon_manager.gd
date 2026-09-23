class_name WeaponManager 
extends Node3D

@export var current_weapon: WeaponResource

@export var player : CharacterBody3D
@export var Bullet_raycast : RayCast3D
@export var view_model_container : Node3D
@export var world_model_container : Node3D

@export var current_weapon_view_model : Node3D
@export var current_weapon_world_model : Node3D


var current_weapon_model: Node3D

func update_weapon_model() -> void:
	if current_weapon != null:
		if view_model_container and current_weapon.view_model:
			current_weapon_view_model = current_weapon.view_model.instantiate()
			view_model_container.add_child(current_weapon_view_model)
		if world_model_container and current_weapon.world_model:
			current_weapon_world_model = current_weapon.world_model.instantiate()
			world_model_container.add_child(current_weapon_world_model)
			play_anim(current_weapon.view_idle_anim)

func play_anim(name : String):
	var anim_player : AnimationPlayer = current_weapon_view_model.get_node_or_null("AnimationPlayer")
	if not anim_player or not anim_player.has_animation(name):
		return
	
	anim_player.seek(0.0)
	anim_player.play(name)

func _ready() -> void:
	update_weapon_model()
