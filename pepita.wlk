import extras.*
import comidas.*
import wollok.game.*
import direcciones.*


object pepita {
	var energia  = 100
	var property position = game.at(0,1)
	const predador = silvestre
	const hogar    = nido

	method image() {
	  return "pepita-" + self.estado() + ".png"
	}

	method estado() {//devuelve que tipo de pepita va a ser dependiendo de su posicion
	  return if (self.estaSobre(predador) or !self.puedoMover()) {"gris"}
	  			else if (self.estaSobre(hogar)) {"grande"}
				else {"base"}
	}

	method puedoMover() {
	  return energia >= self.energiaNecesaria(1)
	}

	method estaSobre(personaje) {
	  return position == personaje.position()
	}



	method text() = "Energy: /n" + energia

	method textColor() = "FF00FF"


	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerAca() {
		
	    self.comer(game.uniqueCollider(self))
	}


	method energiaNecesaria(kms) {
	  return 9 * kms 
	}

	method volar(kms) {
		energia = energia - self.energiaNecesaria(kms)
	}
	
	method energia() {
		return energia
	}

	method mover(direccion) {
	  if(self.puedoMover()) {	
	  self.volar(1)
	  position = direccion.siguiente(position)} 
	}

	/*method volarArriba() {
	  self.volar(1)
	  self.position(self.position().up(1))	
	}
	method volarAbajo() {
	  self.volar(1)
	  self.position(self.position().down(1))	
	}
	method volarDerecha() {
	  self.volar(1)
	  self.position(self.position().left(1))	
	}
	method volarIzquierda() {
	  self.volar(1)
	  self.position(self.position().right(1))	
	}
*/
	method redibujar() {
	  game.removeVisual(self)
	  game.addVisual(self)
	}

}

