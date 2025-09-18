import direcciones.*
import wollok.game.*
import pepita.*
import extras.*
import comidas.*
import muros.*

object nivel1 {
    method inicializarNivel1() {
    game.addVisual(manzana)
	game.addVisual(nido)
	game.addVisual(silvestre)
	game.addVisual(muro1)
	game.addVisual(muro2)
	game.addVisual(muro3)
	game.addVisual(pepita)



	keyboard.up   ().onPressDo( {pepita.mover(arriba)} )//bloque: ejecuta el comando dentro cuando se presiona la tecla
	keyboard.down ().onPressDo( {pepita.mover(abajo)} )
	keyboard.right().onPressDo( {pepita.mover(derecha)} )
	keyboard.left ().onPressDo( {pepita.mover(izquierda)} )
	keyboard.c().onPressDo( { pepita.comerAca() } )

    game.onCollideDo(pepita, {algo => pepita.efectoColision(algo)})
	game.onTick(1000, pepita, {pepita.cae()})
      
    }

  
}