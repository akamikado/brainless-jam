extends Node

enum HousingType { NONE, ANT_HATCHERY, NECTAR_GARDEN, SILK_WEAVER, STICK_YARD, PEBBLE_QUARRY, HOUSING_SMALL }

var citizens_total: int = 0
var citizens_assigned: int = 0
var citizens_unassigned: int = 0

var housing_total: int = 0
var housing_occupied: int = 0
var housing_unoccupied: int = 0

var food: int = 0
var silk: int = 0
var sticks: int = 0
var pebbles: int = 0

# Returns the amount of citizens that couldn't be added, e.g. 0 if all, x if full
func add_citizens(count: int) -> bool:
	var pre_count = citizens_total
	citizens_total = min(housing_total, citizens_total + count)
	var citizens_added = citizens_total - pre_count
	
	citizens_unassigned += citizens_added
	housing_occupied += citizens_added
	housing_unoccupied = housing_total - housing_occupied
	return true

func remove_citizens(count: int) -> bool:
	var pre_count = citizens_total
	citizens_total = max(0, citizens_total - count)
	var citizens_removed = pre_count - citizens_total
	var assigned_citizens_to_remove = min(0,-1 * (citizens_unassigned - citizens_removed))
	citizens_unassigned -= citizens_removed
	citizens_assigned -= assigned_citizens_to_remove
	housing_occupied = max(0, housing_occupied - count)
	housing_unoccupied = housing_total - housing_occupied
	return true

func assign_citizens(count: int) -> bool:
	if citizens_unassigned < count:
		return false
	citizens_assigned += count
	citizens_unassigned -= count
	return true

func unassign_citizens(count: int) -> bool:
	if citizens_assigned < count:
		return false
	citizens_unassigned += count
	citizens_assigned -= count
	return true

func add_housing(count: int) -> bool:
	housing_total += count
	housing_unoccupied += count
	return true

func remove_housing(count: int) -> bool:
	var pre_count = housing_total
	housing_total = max(0, housing_total - count)
	var housing_removed = pre_count - housing_total
	var occupied_housing_to_remove = min(0, -1 * (housing_unoccupied - housing_removed))
	housing_unoccupied -= housing_removed
	housing_occupied -= occupied_housing_to_remove
	return true

func add_food(count: int) -> bool:
	food += count
	return true

func remove_food(count: int) -> bool:
	if food - count >= 0:
		food = food - count
		return true
	return false
	
func add_silk(count: int) -> bool:
	silk += count
	return true

func remove_silk(count: int) -> bool:
	if silk - count >= 0:
		silk = silk - count
		return true
	return false

func add_sticks(count: int) -> bool:
	sticks += count
	return true

func remove_sticks(count: int) -> bool:
	if sticks - count >= 0:
		sticks = sticks - count
		return true
	return false
	
func add_pebbles(count: int) -> bool:
	pebbles += count
	return true

func remove_pebbles(count: int) -> bool:
	if pebbles - count >= 0:
		pebbles = pebbles - count
		return true
	return false
