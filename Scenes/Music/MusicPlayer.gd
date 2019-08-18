extends AudioStreamPlayer


export (AudioStream) var level_music_1 = preload("res://Audio/Music/TheLongHaulThroughTheMinesNormalised.ogg")


func _ready():
	play_the_level_music()


func play_the_level_music():
	stream = level_music_1
	play()