extends AnimatedSprite2D

@export var min:int #= 50
@export var max:int #= 200
#$Line2D
@onready var xSP: int = randi_range(min,max)
@onready var ySP: int = randi_range(min,max)
@export var col: Color
@onready var speed: Vector2 = Vector2(xSP,ySP)

#@export var tr_Col: Color = Color(randf_range(.2,.8),randf_range(.2,.7),randf_range(.2,.8),.1)

# Get the height and width of the sprite for checking boundaries
@onready var height: Vector2 = sprite_frames.get_frame_texture("Right",0).get_size()*scale
#var width: int = Texture.get_width()

# Extract world boundaries from parent object
# World boundaries are hard coded in the brush script for now until I figure out how to properly pass variables between scripts. 
var wHeight: int = 500
var wWidth: int = 500
var trailHome: Vector2
var trailOffset:= Vector2(0,0)
# Variable to store the trail
@onready var trail: Line2D = $Trail
@onready var world: Node2D = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print($".".scale)
	trail.default_color = col
	trailHome = Vector2((height.x)/2,(height.y)/2)
	trail.position = trailHome
	world = get_parent()
	wHeight = world.WORLD_HEIGHT
	wWidth = world.WORLD_WIDTH
	#trail.LineJointMode
	#pass # Replace with function body.
	#autoplay = rue


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateTrailOffset()
	trail.add_point(position+trailOffset)
	
	
	if((position.x >=  (wWidth-(height.x )) and (speed.x > 0)) or (position.x<=0) and speed.x <0):
		speed.x = speed.x * -1
		
	if((position.y >=  (wHeight-(height.y)) and (speed.y > 0)) or (position.y<=0) and speed.y <0):
		speed.y = speed.y * -1
	# Update the X position based on the speed variable  
	position += speed*delta
	bumpVelocity()

func updateTrailOffset():
	var dir:Vector2=checkDirection(speed)
	if(dir.x == 1):
		trailOffset.x = (height.x *-.9)/2.5
		play("Right") 
	else:
		trailOffset.x = (height.x*.9)/2.5
		play("Left")
		
	#if(dir.y == 1):
		#trailOffset.y = (height.y*-1)/2
	#else:
	trailOffset.y = height.y/2	

func checkDirection(velocity: Vector2) -> Vector2:
	var dir: Vector2 
	dir.x = clamp(velocity.x,-1,1)
	dir.y = clamp(velocity.y,-1,1)
	return dir
	



func bumpVelocity() -> void:
	var Bscale:int = 5
	if(randi_range(0,50) == 6):
		var blep:int = randi_range(Bscale*-1,Bscale)
		speed.x +=  clamp(blep,-100,100)
		#print(blep)
	if(randi_range(0,50) == 5):
		var blop:int = randi_range(Bscale*-1,Bscale)
		speed.y += clamp(blop,-100,100)
		#print(blop)
		#clamp(speed.x,-100,100)
		
