extends Sprite2D


#$Line2D
var xSP: int = randi_range(10,200)
var ySP: int = randi_range(10,200)

@export var speed: Vector2 = Vector2(xSP,ySP)
# Get the height and width of the sprite for checking boundaries
var height: Vector2 = $".".texture.get_size() * $".".scale
#var width: int = Texture.get_width()

# Extract world boundaries from parent object
# World boundaries are hard coded in the brush script for now until I figure out how to properly pass variables between scripts. 
var wHeight: int = 500
var wWidth: int = 500


# Variable to store the trail
@onready var trail: Line2D = $Line2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print($".".scale)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	trail.add_point(global_position)
	if((position.x >=  (wWidth-height.x) and (speed.x > 0)) or (position.x<=0) and speed.x <0):
		speed.x = speed.x * -1
		
	if((position.y >=  (wHeight-height.x) and (speed.y > 0)) or (position.y<=0) and speed.y <0):
		speed.y = speed.y * -1
	# Update the X position based on the speed variable  
	position += speed*delta


func checkBound():
	pass
