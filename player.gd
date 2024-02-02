extends Node2D
var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func attacked(damage):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.get_node("HP").text = str(self.hp)

func _on_ready():
	print("ready")

func _on_attack():
	self.hp -= 1
	if self.hp <= 0:
		$Weapon3.disabled = true
		$Weapon4.disabled = true
		$Weapon5.disabled = true
		$Weapon6.disabled = true
		get_node("/root/Battle/Title").text = "BATTLE ENDED!"
