extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lead_bdd =  "Wait"
var lead = [["Florentin", 12], ["Azarias", 43], ["Henri", 32]]

# Called when the node enters the scene tree for the first time.
func _ready():
	$BackButton.connect("pressed", self, "backb")
	lead.sort_custom(self, "customComparison")
	print (lead)
	
func backb():
	Transition.fade_to("res://scenes/Menu.tscn")
	
func customComparison(a, b):
        return a[1] < b[1]
