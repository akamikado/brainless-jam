extends Node

var current_day: int = 1

@export var resource_manager: Node
@export var weather_manager: Node

var food_quota: int = 5
var silk_quota: int = 2
var sticks_quota: int = 2
var pebbles_quota: int = 0

func end_day():
	print("Ending Day ", current_day)

	# 1. Apply building/resource generation here later
	# BuildingManager.generate_all_resources()

	# 2. Apply weather effects
	weather_manager.apply_current_weather(resource_manager)

	# 3. Pay quota
	var survived = pay_daily_quota()

	if survived == false:
		#game_over()
		return

# 4. Increase difficulty
	increase_quota()

	# 5. Move to next day
	current_day += 1
	weather_manager.roll_next_weather(current_day)

	print("Starting Day ", current_day)
	
func pay_daily_quota() -> bool:
	if resource_manager.food < food_quota:
		print("Not enough food!")
		return false
	
	if resource_manager.silk < silk_quota:
		print("Not enough silk!")
		return false
	
	if resource_manager.sticks < sticks_quota:
		print("Not enough sticks!")
		return false
	
	if resource_manager.pebbles < pebbles_quota:
		print("Not enough pebbles!")
		return false

	resource_manager.remove_food(food_quota)
	resource_manager.remove_silk(silk_quota)
	resource_manager.remove_sticks(sticks_quota)
	resource_manager.remove_pebbles(pebbles_quota)

	return true
	
func increase_quota():
	food_quota += 2

	if current_day % 2 == 0:
		sticks_quota += 1

	if current_day % 3 == 0:
		silk_quota += 1

	if current_day % 4 == 0:
		pebbles_quota += 1
