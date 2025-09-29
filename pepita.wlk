import niveles.*
import extras.*
import comidas.*
import wollok.game.*
import direcciones.*
import organizador.*


object pepita {
	var property energia  = 100
	var property position = game.at(0,1)
	const predador           = silvestre
	const hogar              = nido
	var property perdi       = false 
	var property ultimaDireccion = null

	method image() {
	  return "pepita-" + self.estado() + ".png"
	}

	method estado() {//devuelve que tipo de pepita va a ser dependiendo de su posicion
	  return if (self.esHogar()) {"grande"}
	  			else if (!self.puedoVolar()) {"gris"}
				else {"base"}
	}

	method puedoVolar() {//puedeVolar
	  return energia >= self.energiaNecesaria(1) and !self.estaAtrapada() 
	}
	method estaAtrapada() {
	  return self.position() == predador.position()
	}

	method estaSobre(personaje) {
	  return position == personaje.position()
	}
	method esHogar() = self.estaSobre(hogar) 



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
	  if(self.puedeMover(direccion)) {//Agregar condiciones en un solo metodo	
	  self.volar(1)
	  position = direccion.siguiente(position)
	  ultimaDireccion = direccion}
	  else if (!self.puedoVolar()) {self.perder()}

	}
	method puedeMover(direccion) {
		return self.puedoVolar() and !self.estaEnlimite(direccion) and !self.estoyFrenteAMuro(direccion)
	  
	}
	method retroceder() {
		position = ultimaDireccion.anterior(position)
	  
	}


	method estaEnlimite(direccion) {
	  return direccion.borde(position)
	}
	method estoyFrenteAMuro(direccion) {
	  return direccion.hayMuro(position)
	}


	method inicialziar() {
		position = game.at(0, 1)
		energia  = 100	  
	}


	method perder() {
		game.say(self, "perdi, presione r para reiniciar nivel")
		game.removeTickEvent("caer")
		oraganizador.reiniciar()
		

	}

	method cae() {
		if (self.puedeMover(abajo)) {position = position.down(1)}
			  
	}

	method ganar() {
		
		if(self.image() == "pepita-grande.png") {
			game.say(self, "!!GANEE¡¡")
			game.stop()
			}

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

