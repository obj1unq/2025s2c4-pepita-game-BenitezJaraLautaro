import wollok.game.*
import muros.*

object arriba {
  const obstaculo1 = muro1.position()
  const obstaculo2 = muro2.position()
  const obstaculo3 = muro3.position()
  method siguiente(posicion) {
    return posicion.up(1)
  }

  method borde(posicion) {//estaEnElBorde
    return posicion.y() == game.height()-1
  }

  method hayMuro(posicion) {
    return posicion.up(1) == obstaculo1 or posicion.up(1) == obstaculo2 or posicion.up(1) == obstaculo3
  }
}

object abajo {
  const obstaculo1 = muro1.position()
  const obstaculo2 = muro2.position()
  const obstaculo3 = muro3.position()
  method siguiente(posicion) {
    return posicion.down(1)
  } 

    method borde(posicion) {
    return posicion.y() == 0
  }

    method hayMuro(posicion) {
    return posicion.down(1) == obstaculo1 or posicion.down(1) == obstaculo2 or posicion.down(1) == obstaculo3
  } 
}

object izquierda {
  const obstaculo1 = muro1.position()
  const obstaculo2 = muro2.position()
  const obstaculo3 = muro3.position()
  method siguiente(posicion) {
    return posicion.left(1)
  }  

    method borde(posicion) {
    return posicion.x() == 0
  }

  method hayMuro(posicion) {
  return posicion.left(1) == obstaculo1 or posicion.left(1) == obstaculo2 or posicion.left(1) == obstaculo3
  
 }
}

object derecha {
  const obstaculo1 = muro1.position()
  const obstaculo2 = muro2.position()
  const obstaculo3 = muro3.position()
  method siguiente(posicion) {
    return posicion.right(1)
  }  

    method borde(posicion) {
    return posicion.x() == game.width()-1
  }

  method hayMuro(posicion) {
  return posicion.right(1) == obstaculo1 or posicion.right(1) == obstaculo2 or posicion.right(1) == obstaculo3
 }
}