extends Node2D
var rng = RandomNumberGenerator.new()
var weakness = 0
var hp = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var score_node = get_node("/root/Battle/Score")
	var my_random_number = weakness
	while my_random_number == weakness:
		my_random_number = rng.randi_range(3, 6)
	self.weakness = my_random_number
	self.hp = my_random_number * (int(score_node.text)+1)
	self.get_node("HP").text = str(self.hp)
	self.get_node("Triangle").visible = false
	self.get_node("Rectangle").visible = false
	self.get_node("Pentagon").visible = false
	self.get_node("Hexagon").visible = false
	if my_random_number == 3:
		self.get_node("Triangle").visible = true
	elif my_random_number == 4:
		self.get_node("Rectangle").visible = true
	elif my_random_number == 5:
		self.get_node("Pentagon").visible = true
	elif my_random_number == 6:
		self.get_node("Hexagon").visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.get_node("HP").text = str(self.hp)

func attacked(damage):
	if damage == self.weakness:
		self.hp -= damage
	else:
		self.hp += damage
	if self.hp <= 0:
		var score_node = get_node("/root/Battle/Score")
		score_node.text = str(int(score_node.text) + 1)
		self._ready()

func _on_weapon_3_pressed():
	attacked(3)

func _on_weapon_4_pressed():
	attacked(4)

func _on_weapon_5_pressed():
	attacked(5)

func _on_weapon_6_pressed():
	attacked(6)
