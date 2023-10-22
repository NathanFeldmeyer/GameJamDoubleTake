extends Label

var drawTextSpeed: int = 0
var storyLimit: int = 920

func _showStory(): 
	if drawTextSpeed < storyLimit:
		drawTextSpeed += 1
		self.visible_characters = drawTextSpeed

func _process(_delta):
	_showStory()
