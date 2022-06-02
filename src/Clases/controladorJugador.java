/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author joaco
 */
public class controladorJugador {
    private static Jugador j;
    
    private controladorJugador() {
    }
    
    public static controladorJugador getInstance() {
        return controladorUsuarioHolder.INSTANCE;
    }
    
    private static class controladorUsuarioHolder {
        private static final controladorJugador INSTANCE = new controladorJugador();
    }

    public static Jugador getJ() {
        return j;
    }

    public static void setJ(Jugador j) {
        controladorJugador.j = j;
    }

    
}
