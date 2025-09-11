import extras.*
import comidas.*
import wollok.game.*

object pepita {
	var energia  = 100
	var property position = game.at(0,1)
	const predador = silvestre
	const hogar    = nido

	method image() {
	  return "pepita-" + self.estado() + ".png"
	}

	method estado() {//devuelve que tipo de pepita va a ser dependiendo de su posicion
	  return if (self.estaSobre(predador)) {"gris"}
	  			else if (self.estaSobre(hogar)) {"grande"}
				else {"base"}
	}

	method estaSobre(personaje) {
	  return position == personaje.position()
	}

	

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

