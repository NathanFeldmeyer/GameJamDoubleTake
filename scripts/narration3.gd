extends Label

@onready var narration = $"../narration3"

var drawTextSpeed: int = 0
var storyLimit: int = 920

func _showStory(): 
	if drawTextSpeed < storyLimit && narration.visible:
		drawTextSpeed += 1
		self.visible_characters = drawTextSpeed

func _process(_delta):
	_showStory()
