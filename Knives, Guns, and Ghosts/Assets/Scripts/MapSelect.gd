extends MenuButton

var maps = [
	"Test",
	"Test2"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_popup().connect("id_pressed", self, "pressed")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show():
	print("SHOW!")

func pressed(id):
	var item_name = get_popup().get_item_text(id)
	print(item_name + " pressed")
	set_text(item_name)
	Global.map = id
