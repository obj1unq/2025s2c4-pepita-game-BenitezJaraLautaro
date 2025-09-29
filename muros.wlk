object muro1 {
  const property position = game.at(6, 5)

  method image() {
    return "muro.png"
  }

  method efectoColision(alguien) {
    alguien.retroceder()
    
  }
}

object muro2 {
  const property position = game.at(6, 6)

  method image() {
    return "muro.png"
  }
}

object muro3 {
  const property position = game.at(6, 7)

  method image() {
    return "muro.png"
  }
}