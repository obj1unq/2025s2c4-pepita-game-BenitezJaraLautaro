import wollok.game.*
object arriba {
  method siguiente(posicion) {
    return posicion.up(1)
  }

  method borde(posicion) {
    return posicion.y() == game.height()-1
  }
}

object abajo {
  method siguiente(posicion) {
    return posicion.down(1)
  } 

    method borde(posicion) {
    return posicion.y() == 0
  } 
}

object izquierda {
  method siguiente(posicion) {
    return posicion.left(1)
  }  

    method borde(posicion) {
    return posicion.x() == 0
  }
}

object derecha {
  method siguiente(posicion) {
    return posicion.right(1)
  }  

    method borde(posicion) {
    return posicion.x() == game.width()-1
  }
}