extends Base

@onready var vida = $"../../Vida_pikachu"
@onready var ratata = $"../../pikamon"

func add_text(msg: String):
	ratata.text += msg + "\n"

func revidar_ataque(alvo: Base):
	if hp <= 0:
		if vida.value <= 0:
			add_text("%s está desmaiado e não pode revidar." % nome)
			return
	add_text("%s revidou com ataque rápido!" % nome)
	var dano = max(ataque - alvo.defesa, 0)
	alvo.hp -= dano
	vida.value -= dano
	add_text("%s sofreu %d de dano de %s." % [alvo.nome, dano, nome])
	if alvo.hp <= 0:
		vida.value = 0
		alvo.hp = 0
		add_text("%s foi derrotado!" % alvo.nome)
		await get_tree().create_timer(0.3).timeout
		get_tree().quit()
