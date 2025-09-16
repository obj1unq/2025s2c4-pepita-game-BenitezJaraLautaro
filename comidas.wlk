import wollok.game.*

object manzana {
	const base  = 5
	var madurez = 1
	var property position = game.at(4,4)

	method position() {
	  return position
	}

	method image() {
	  return "manzana.png"
	}
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

	method andate() {
	  game.removeVisual(self)
	}

	method provocarEfectoColision(personaje) {
		personaje.comerAca()
	  
	}

}

object alpiste {

	method energiaQueOtorga() {
		return 20
	} 

}

