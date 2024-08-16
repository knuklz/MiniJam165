extends Sprite2D

@export var speed: int = 50


# Get the height and width of the sprite for checking boundaries
var height: Vector2 = $".".texture.get_size()
#var width: int = Texture.get_width()


# Extract world boundaries from parent object
# World boundaries are hard coded in the brush script for now until I figure out how to properly pass variables between scripts. 
var wHeight: int = 500
var wWidth: int = 500



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if((position.x >=  (wWidth-height.x) and (speed > 0)) or (position.x<=0) and speed <0):
		speed = speed * -1
	# Update the X position based on the speed variable  
	position.x += speed*delta
	
	
	#Sprite2D.texture.get_height()
	#print($"..".WORLD_HEIGHT)


func checkBound():
	pass
