import pepita.*

object nido {
  const property position = game.at(8, 8)

  method image() {
    return "nido.png"
  }

}

object silvestre {
    const presa = pepita
    method image() {
     return "silvestre.png"
    }   

    method position() = game.at(presa.position().x(),0) 
}


