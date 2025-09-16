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
	  return if (!self.puedoMover()) {"gris"}
	  			else if (self.esHogar()) {"grande"}
				else {"base"}
	}

	method puedoMover() {
	  return energia >= self.energiaNecesaria(1) and !self.estaAtrapada()
	}
	method estaAtrapada() {
	  return self.position() == predador.position()
	}

	method estaSobre(personaje) {
	  return position == personaje.position()
	}
	method esHogar() =self.estaSobre(hogar)



	method text() = "Energy: /n" + energia

	method textColor() = "FF00FF"


	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerAca() {
		const comida = self.loQueHayAca()
	    self.comer(comida)
		comida.andate()

	}
	method loQueHayAca() {
		return game.uniqueCollider(self)//El objeto que esta en la misma posicion del principal	  
	}


	method energiaNecesaria(kms) {
	  return 2 * kms 
	}

	method volar(kms) {
		energia = energia - self.energiaNecesaria(kms)
	}
	
	method energia() {
		return energia
	}


	method mover(direccion) {
	  if(self.puedoMover() and !self.estaEnlimite(direccion) and !self.estoyFrenteAMuro(direccion)) {	//resolver perder
	  self.volar(1)
	  position = direccion.siguiente(position)}
	  else if (!self.puedoMover()) {self.perder()}


	}
	method estaEnlimite(direccion) {
	  return direccion.borde(position)
	}
	method estoyFrenteAMuro(direccion) {
	  return direccion.hayMuro(position)
	}



	method perder() {
		game.say(self, "perdi")
		game.schedule(2000, {game.stop()})

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

	method efectoColision(algo) {
		algo.provocarEfectoColision(self)
	  
	}

	method redibujar() {
	  game.removeVisual(self)
	  game.addVisual(self)
	}

}

