### script da main screen
extends Node2D

# referencia do botão para iniciar o jogo
var btn_iniciar = get_node("iniciar")

#TODO
# referencia do botão para tocar um som aleatorio 
var btn_tryme = get_node("som_legal")

# variavel que controla a escala da imagem de instruções
var faq_state = 0
var btn_faq = get_node("sprite_faq/btn_faq")


func faq_scale():
	if faq_state == 0:
		get_node("background/instrucoes/instrucoes_sprite").set_scale(Vector2(1, 1))
		faq_state = 1
	else:
		get_node("background/instrucoes/instrucoes_sprite").set_scale(Vector2(0.5, 0.5))
		faq_state = 0


func _ready():
	btn_faq = get_node("sprite_faq/btn_faq")
	set_fixed_process(true)
	
func _fixed_process(delta):
#	if btn_faq.is_pressed():
#		print("")
#		faq_scale()
		
# chamando a função instrucoes caso a imagem seja clicada
	
	