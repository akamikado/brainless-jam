extends Node

var food: int = 0
var fiber: int = 0
var nectar: int = 0

func add_resource(resource_type: String, amount: int):
	if resource_type == "Food":
		food += amount
	elif resource_type == "Fiber":
		fiber += amount
	elif resource_type == "Nectar":
		nectar += amount

	print_resources()

func spend_resource(resource_type: String, amount: int) -> bool:
	if resource_type == "Food" and food >= amount:
		food -= amount
		print_resources()
		return true
	
	if resource_type == "Fiber" and fiber >= amount:
		fiber -= amount
		print_resources()
		return true
	
	if resource_type == "Nectar" and nectar >= amount:
		nectar -= amount
		print_resources()
		return true
	
	return false

func print_resources():
	print("Food:", food, " Fiber:", fiber, " Nectar:", nectar)
