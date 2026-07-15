class_name Base extends Node2D

@export var foodProductionInClear = 0
@export var foodProductionInRain = 0
@export var foodProductionInDrought = 0
@export var foodProductionInWind = 0
@export var foodProductionInCold = 0

@export var silkProductionInClear = 0
@export var silkProductionInRain = 0
@export var silkProductionInDrought = 0
@export var silkProductionInWind = 0
@export var silkProductionInCold = 0

@export var stickProductionInClear = 0
@export var stickProductionInRain = 0
@export var stickProductionInDrought = 0
@export var stickProductionInWind = 0
@export var stickProductionInCold = 0

@export var pebbleProductionInClear = 0
@export var pebbleProductionInRain = 0
@export var pebbleProductionInDrought = 0
@export var pebbleProductionInWind = 0
@export var pebbleProductionInCold = 0

func on_placed() -> void:
# TODO: use materials and do sound effect
	pass

func update_state() -> void:
	print("state updated")

func nearby_building_placed() -> void:
	pass
