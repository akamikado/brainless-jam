class_name Building extends Node2D

@export_group("food")
@export var foodProductionInClear = 0
@export var foodProductionInRain = 0
@export var foodProductionInDrought = 0
@export var foodProductionInWind = 0
@export var foodProductionInCold = 0

@export_group("silk")
@export var silkProductionInClear = 0
@export var silkProductionInRain = 0
@export var silkProductionInDrought = 0
@export var silkProductionInWind = 0
@export var silkProductionInCold = 0

@export_group("stick")
@export var stickProductionInClear = 0
@export var stickProductionInRain = 0
@export var stickProductionInDrought = 0
@export var stickProductionInWind = 0
@export var stickProductionInCold = 0

@export_group("pebble")
@export var pebbleProductionInClear = 0
@export var pebbleProductionInRain = 0
@export var pebbleProductionInDrought = 0
@export var pebbleProductionInWind = 0
@export var pebbleProductionInCold = 0

func update_state() -> void:
	#TODO: match for every weather condition and do Global.add_<item>(<item>ProductionIn<weather>)
	pass

func nearby_building_placed() -> void:
	pass
