extends Node

# Drag your ResourceManager node into this field in the Inspector.
@export var resource_manager: Node

# How long each weather cycle lasts.
@export var cycle_time: float = 60.0

# Current countdown value.
var timer: float = 0.0

# Arrays start at index 0.
# 0 = Clear
# 1 = Rain
# 2 = Drought
# 3 = Wind
# 4 = Cold
var current_cycle: int = 0

var weather_cycle: Array[String] = [
	"Clear",
	"Rain",
	"Drought",
	"Wind",
	"Cold"
]

var current_weather: String = ""
var game_finished: bool = false

# Current cycle resource requirements.
var food_goal: int = 0
var silk_goal: int = 0
var sticks_goal: int = 0
var pebbles_goal: int = 0


func _ready() -> void:
	start_cycle()


func _process(delta: float) -> void:
	if game_finished:
		return

	timer -= delta

	if timer <= 0.0:
		timer = 0.0
		end_cycle()


func start_cycle() -> void:
	# Reset the timer.
	timer = cycle_time

	# Set the current weather using the weather array.
	current_weather = weather_cycle[current_cycle]

	# Load the correct resource goals for this cycle.
	set_cycle_goals()

	print("")
	print("Cycle started: ", current_cycle + 1)
	print("Current weather: ", current_weather)
	print_cycle_goals()


func set_cycle_goals() -> void:
	# Reset every goal first
	# This prevents values from the previous cycle carrying over
	food_goal = 0
	silk_goal = 0
	sticks_goal = 0
	pebbles_goal = 0

	match current_cycle:
		0:
			# Clear
			food_goal = 18
			silk_goal = 6

		1:
			# Rain
			food_goal = 16
			silk_goal = 8
			pebbles_goal = 8

		2:
			# Drought
			food_goal = 22
			silk_goal = 8
			sticks_goal = 12

		3:
			# Wind
			food_goal = 18
			silk_goal = 14
			sticks_goal = 12
			pebbles_goal = 12

		4:
			# Cold
			food_goal = 30
			silk_goal = 16
			sticks_goal = 16
			pebbles_goal = 14


func end_cycle() -> void:
	print("")
	print("Cycle ended: ", current_cycle + 1)

	# Check whether the player has enough resources.
	if not has_met_cycle_goal():
		lose_game()
		return

	# Remove the required resources.
	pay_cycle_goal()

	# Advance to the next weather cycle.
	current_cycle += 1

	# If all five cycles are complete, the player wins.
	if current_cycle >= weather_cycle.size():
		win_game()
		return

	# Begin the next cycle.
	start_cycle()


func has_met_cycle_goal() -> bool:
	return (
		resource_manager.food >= food_goal
		and resource_manager.silk >= silk_goal
		and resource_manager.sticks >= sticks_goal
		and resource_manager.pebbles >= pebbles_goal
	)


func pay_cycle_goal() -> void:
	resource_manager.remove_food(food_goal)
	resource_manager.remove_silk(silk_goal)
	resource_manager.remove_sticks(sticks_goal)
	resource_manager.remove_pebbles(pebbles_goal)

	print("Cycle objective completed.")
	print("Required resources were consumed.")


func print_cycle_goals() -> void:
	print("Cycle goals:")
	print("Food: ", food_goal)
	print("Silk: ", silk_goal)
	print("Sticks: ", sticks_goal)
	print("Pebbles: ", pebbles_goal)


func print_missing_resources() -> void:
	if resource_manager.food < food_goal:
		print("Missing Food: ", food_goal - resource_manager.food)

	if resource_manager.silk < silk_goal:
		print("Missing Silk: ", silk_goal - resource_manager.silk)

	if resource_manager.sticks < sticks_goal:
		print("Missing Sticks: ", sticks_goal - resource_manager.sticks)

	if resource_manager.pebbles < pebbles_goal:
		print("Missing Pebbles: ", pebbles_goal - resource_manager.pebbles)


func get_next_weather() -> String:
	var next_cycle_index: int = current_cycle + 1

	if next_cycle_index >= weather_cycle.size():
		return "None"

	return weather_cycle[next_cycle_index]


func win_game() -> void:
	game_finished = true
	set_process(false)

	print("")
	print("YOU WIN!")
	print("The colony survived every weather cycle.")


func lose_game() -> void:
	game_finished = true
	set_process(false)

	print("")
	print("YOU LOSE!")
	print("The colony failed during: ", current_weather)
	print_missing_resources()
