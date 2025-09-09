
object pepita {
	var energia  = 100
	var property position = game.at(0,1)

	method image() = "pepita.png"

	method text() = "Energy: /n" + energia

	method textColor() = "FF00FF"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method redibujar() {
	  game.removeVisual(self)
	  game.addVisual(self)
	}

}

