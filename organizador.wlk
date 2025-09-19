import direcciones.*
import wollok.game.*
import pepita.*
import extras.*
import comidas.*
import muros.*
import niveles.*
object oraganizador {
    method reiniciar() {
        keyboard.r().onPressDo( { 
            game.clear()
            nivel1.inicializarNivel1()
         } )
      
    }
  
}