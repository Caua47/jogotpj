extends Base
@onready var vida = $"../../Vida_pikachu"

func revidar_ataque(alvo: Base):
	if velocidade > alvo.velocidade:
		if hp <= 0:
			if vida <= 0:
				print("%s está desmaiado e não pode revidar." % nome)
				return
		print("%s revidou com ataque rápido!" % nome)
		var dano = max(ataque - alvo.defesa, 0)
		alvo.hp -= dano
		vida.value -= dano
		print("%s sofreu %d de dano de %s." % [alvo.nome, dano, nome])
	if alvo.hp <= 0:
		vida.value = 0
		alvo.hp = 0
		print("%s foi derrotado!" % alvo.nome)
		get_tree().quit()
