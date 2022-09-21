extends Node2D

var dialog_cutscene_dream = [
	{"name":"Diretor","text":"Você teve uma péssima conduta na escola"},
	{"name":"Diretor","text":"Você está expulso"},
	{"name":"Diretor","text":"Não aceitamos delinquentes como você nessa escola"},
	{"name":"Diretor","text":"Saia daqui"}
]

onready var tempo = $Timer
onready var dialogo_cut_scener = $dialogo
onready var audio_play = $audio

signal cutscene_end

var ended = false

func _ready():
	audio_play.play()
	tempo.start()

func _on_Timer_timeout():
	dialogo_cut_scener.play_dialog(dialog_cutscene_dream)


func _on_dialogo_ended():
	ended = true
	emit_signal("cutscene_end")
