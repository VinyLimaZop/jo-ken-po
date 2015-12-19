# script do jogo
# O jogo terá 3 fases
#	1_ escolha da "arma"#
#		1_1 O computador utiliza um random para escolher sua "arma"
#	2_ comparação de armas
#	3_ computação de vencedor e score

extends Node2D

#escolha do usuario
var user
# Integer com o score do user
var user_score
# Nó de score do usuario (Texto)
var user_lbl_score = get_node("user_score")

# escolha da IA
var ia
# Integer com o score do IA
var ia_score
# Nó de score da IA (Texto)
var ia_lbl_score = get_node("ia_static/ia_score")

# TODO ocultar as armas após a escolha e após o resultado voltar a mostra-las!


# variavel para verificar se a rodada foi jogada completamente
var rodada

# atribuição de valores nas armas
# 
# Spock = 0
# Tesoura = 1
# Papel = 2
# Pedra = 3
# Lagarto = 4


func draw_weapons():
	if get_node("armas/spock/btn_spock").is_pressed():
		user = 0
		print(user)
	elif get_node("armas/tesoura/btn_tesoura").is_pressed():
		user = 1
		print(user)
	elif get_node("armas/papel/btn_papel").is_pressed():
		user = 2
		print(user)
	elif get_node("armas/pedra/btn_pedra").is_pressed():
		user = 3
		print(user)
	elif get_node("armas/lagarto/btn_lagarto").is_pressed():
		user = 4
		print(user)
	


# decisao de quem ganhou mais contabilização do placar
func jokenpo(user, ia):
	if (user == 0) && (ia == 1 || ia == 3):
		user_score = user_score + 1
	elif (user == 1) && (ia == 2 || ia == 4):
		user_score = user_score + 1
	elif (user == 2) && (ia == 3 || ia == 0):
		user_score = user_score + 1
	elif (user == 3) && (ia == 4 || ia == 1):
		user_score = user_score + 1
	else:
		ia_score = ia_score + 1


func _ready():
	user_lbl_score = get_node("user_score")
	ia_lbl_score = get_node("ia_static/ia_score")
#	armas_pos = get_node("armas").get_pos()
	user_score = 0
	user_lbl_score.set_text(str(user_score))
	ia_score = 0
	ia_lbl_score.set_text(str(ia_score))
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	if user:
		get_node("armas/draw_weapon").set_text("")
		get_node("armas").queue_free()
	else:
		draw_weapons()
#		get_node("armas").set_pos(Vector2(armas_pos.x, armas_pos.y))
		
	ia = randi(0,5)
	jokenpo(user, ia)
	get_node("user_score").set_text(str(user_score))
	get_node("ia_static/ia_score").set_text(str(ia_score))
	
	user = null
	ia = null
	

