/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BD;
import Clases.Categoria;
import Clases.Jugador;
import Clases.Partida;
import Clases.Pregunta;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author joaco
 */
public class Conexion {

    private Conexion() {
    }

    public static Conexion getInstance() {
        return ConexionHolder.INSTANCE;
    }

    private static class ConexionHolder {

        private static final Conexion INSTANCE = new Conexion();
        private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("PruebaPU");
        private static final EntityManager em = emf.createEntityManager();
    }

    public EntityManager getEntity() {
        return ConexionHolder.em;
    }

    public boolean persist(Object object) {
        EntityManager em = getEntity();
        em.getTransaction().begin();
        boolean retorno = false;
        try {
            em.persist(object);
            em.getTransaction().commit();
            retorno = true;
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
            retorno = false;
        }
        return retorno;
    }

    public void merge(Object object) {
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            em.merge(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        }
    }

    public boolean mergebool(Object object) {
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            em.merge(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
            return false;
        }
        return true;
    }

    public void delete(Object object) {
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            em.remove(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        }
    }

    public boolean deleteBoolean(Object object) {
        boolean retorno;
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            em.remove(object);
            em.getTransaction().commit();
            retorno = true;
        } catch (Exception e) {
            retorno = false;
            e.printStackTrace();
            em.getTransaction().rollback();
        }
        return retorno;
    }

    public void refresh(Object object) {
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            em.refresh(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        }
    }

    public void remove(Object object) {
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            em.remove(object);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        }
    }

    //-----------------------------JUGADOR------------------------------------//
     public boolean existeJugador(String nickname) {
        boolean retorno = false;
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            Jugador j = (Jugador) em.createNativeQuery("SELECT * FROM jugador WHERE nickname = :nickname", Jugador.class)
                    .setParameter("nickname", nickname)
                    .getSingleResult();
            em.getTransaction().commit();

            if (j != null) {
                retorno = true;
            } else {
                retorno = false;
            }

        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return retorno;
    }
     
     public Jugador validarJugador(String nickname, String password) {
        Jugador j = null;
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            j = (Jugador) em.createNativeQuery("SELECT * FROM jugador WHERE nickname = :nickname AND contrasenia = :contrasenia", Jugador.class)
                    .setParameter("nickname", nickname)
                    .setParameter("contrasenia", password)
                    .getSingleResult();
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return j;
    }
     
    //-------------------------------------------CATEGORIA------------------------------------------//
     public boolean existeCategoria(String nombreCategoria) {
        boolean retorno = false;
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            Categoria c = (Categoria) em.createNativeQuery("SELECT * FROM categoria WHERE nombre = :nombre", Categoria.class)
                    .setParameter("nombre", nombreCategoria)
                    .getSingleResult();
            em.getTransaction().commit();

            if (c != null) {
                retorno = true;
            } else {
                retorno = false;
            }

        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return retorno;
    }
     
    public List<Categoria> listadoCategorias() {
        EntityManager em = getEntity();
        List<Categoria> listaCategorias = null;
        em.getTransaction().begin();
        try {
            listaCategorias = em.createNativeQuery("SELECT * FROM categoria", Categoria.class).getResultList();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return listaCategorias;
    }
    
     public Categoria obtenerCategoriaRandom() {        
        EntityManager em = getEntity();
        Categoria c = null;
        em.getTransaction().begin();
        try {
            c = (Categoria) em.createNativeQuery("SELECT * FROM categoria ORDER BY RAND() LIMIT 1", Categoria.class).getSingleResult();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return c;
    }
     
    //-------------------------------------------------------PREGUNTA-----------------------------------//
     public Pregunta obtenerPreguntaRandom(int nivel, String categoria) {
        Pregunta p = null;
        EntityManager em = getEntity();
        em.getTransaction().begin();
        try {
            p = (Pregunta) em.createNativeQuery("SELECT * FROM pregunta WHERE nivel = :nivel AND categoria_nombre = :categoria ORDER BY RAND() LIMIT 1", Pregunta.class)
                    .setParameter("nivel", nivel)
                    .setParameter("categoria", categoria)
                    .getSingleResult();
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println(e);
        }
        return p;
    }
    
    //-----------------------------------------------------PARTIDA-------------------------------------------//
    public List<Partida> obtenerHistorialPuntaje() {
        EntityManager em = getEntity();
        List<Partida> listaPartidas = null;
        em.getTransaction().begin();
        try {
            listaPartidas = em.createNativeQuery("SELECT * FROM partida ORDER BY puntajeFinal DESC LIMIT 50", Partida.class).getResultList();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return listaPartidas;
    }
}

