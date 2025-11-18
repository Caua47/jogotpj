extends Base

@onready var vida = $"../../Vida_ratata"
@onready var pikamon = $"../../pikamon"

func add_text(msg: String):
	pikamon.text += msg + "\n"


func aplicar_dano(alvo: Base, dano: int) -> bool:
	alvo.hp -= dano
	vida.value -= dano

	add_text("%s causou %d de dano em %s." % [nome, dano, alvo.nome])

	if alvo.hp <= 0:
		alvo.hp = 0
		vida.value = 0
		add_text("%s foi derrotado!" % alvo.nome)
		add_text("%s venceu!!!" % nome)
		return true
	return false


func pode_atacar() -> bool:
	if hp <= 0 or vida.value <= 0:
		add_text("%s está desmaiado e não pode atacar." % nome)
		return false
	return true


func choque_do_trovao(alvo: Base) -> void:
	if not pode_atacar():
		return

	add_text("%s usou Choque do Trovão!" % nome)

	var dano = max(sp_ataque - alvo.sp_defesa, 0)
	if aplicar_dano(alvo, dano):
		await get_tree().create_timer(1).timeout
		get_tree().quit()
		return

	alvo.revidar_ataque(self)


func ataque_rapido(alvo: Base) -> void:
	if not pode_atacar():
		return

	add_text("%s usou Ataque Rápido!" % nome)

	var dano = max(ataque - alvo.defesa, 0)

	if aplicar_dano(alvo, dano):
		await get_tree().create_timer(1).timeout
		get_tree().quit()
		return

	alvo.revidar_ataque(self)


func esquiva(alvo: Base):
	if not pode_atacar():
		return

	if velocidade > alvo.velocidade:
		add_text("%s esquivou do ataque!" % nome)
		add_text("%s causou 0 de dano." % nome)
		alvo.revidar_ataque(self)
	else:
		alvo.revidar_ataque(self)


func trovao(alvo: Base) -> void:
	if not pode_atacar():
		return

	add_text("%s usou Trovão!" % nome)

	var dano = max(sp_ataque - alvo.sp_defesa, 0)
	if aplicar_dano(alvo, dano):
		await get_tree().create_timer(1).timeout
		get_tree().quit()
		return

	alvo.revidar_ataque(self)
