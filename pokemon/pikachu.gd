extends Base
@onready var vida = $"../../Vida_ratata"

func choque_do_trovao(alvo:Base) -> void:
	if velocidade >= alvo.velocidade:
		if hp <= 0:
			if vida <= 0:
				print("%s está desmaiado e não pode atacar." % nome)
				return
		print("%s usou Choque do trovão" % [nome])
		var dano =  max(sp_ataque - alvo.sp_defesa, 0)
		alvo.hp -= dano
		vida.value -= dano
		print("%s causou %d de dano em %s." % [nome, dano, alvo.nome])
		if alvo.hp <= 0:
			vida.value = 0
			alvo.hp = 0
			print("%s foi derrotado!" % alvo.nome)
			print("%s ganho!!!" %nome)
			get_tree().quit()
		else:
			alvo.revidar_ataque(self)
	else:
		alvo.revidar_ataque(self)


func ataque_rapido(alvo:Base) -> void:
	if velocidade >= alvo.velocidade:
		if hp <= 0:
			if vida <= 0:
				print("%s está desmaiado e não pode atacar." % nome)
				return
		print("%s usou Ataque rapido" % [nome])
		var dano =  max(ataque - defesa, 0)
		alvo.hp -= dano
		vida.value -= dano
		print("%s causou %d de dano em %s." % [nome, dano, alvo.nome])
		if alvo.hp <= 0:
			vida.value = 0
			alvo.hp = 0
			print("%s foi derrotado!" % alvo.nome)
			print("%s ganho!!!" %nome)
			get_tree().quit()
		else:
			alvo.revidar_ataque(self)
	else:
		alvo.revidar_ataque(self)


func esquiva(alvo:Base):
	if velocidade > alvo.velocidade:
		print("%s esquivou do ataque" % [nome])
		var dano = 0
		alvo.hp -= dano
		print("%s causou %d de dano em %s." % [nome, dano, alvo.nome])
		if alvo.hp <= 0:
			alvo.hp = 0
			print("%s foi derrotado!" % alvo.nome)
			print("%s ganho!!!" %nome)
			get_tree().quit()
		else:
			alvo.revidar_ataque(self)
	else:
		alvo.revidar_ataque(self)

func trovao(alvo:Base) -> void:
	if velocidade >= alvo.velocidade:
		if hp <= 0:
			if vida <= 0:
				print("%s está desmaiado e não pode atacar." % nome)
				return
		print("%s usou Trovão" % [nome])
		var dano =  max(sp_ataque - alvo.sp_defesa, 0)
		alvo.hp -= dano
		vida.value -= dano
		print("%s causou %d de dano em %s." % [nome, dano, alvo.nome])
		if alvo.hp <= 0:
			alvo.hp = 0
			print("%s foi derrotado!" % alvo.nome)
			print("%s ganho!!!" %nome)
			get_tree().quit()
		else:
			alvo.revidar_ataque(self)
	else:
		alvo.revidar_ataque(self)
