/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author joaco
 */
@Entity
public class Pregunta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    @OneToMany(cascade = {CascadeType.ALL})
    private List<Respuesta> respuestas;
    
    @OneToOne
    private Categoria categoria;
    
    private String descripcion;    
    private int puntos;
    private int nivel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pregunta)) {
            return false;
        }
        Pregunta other = (Pregunta) object;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Pregunta[ id=" + id + " ]";
    }

    public List<Respuesta> getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(List<Respuesta> respuestas) {
        this.respuestas = respuestas;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
    
    public List getRespuestasRandomOrder(){
        List respuestitas = new ArrayList<>();
        List indices = Arrays.asList(0, 1, 2, 3);
        Collections.shuffle(indices);
        Iterator itIndices = indices.iterator();
        while(itIndices.hasNext()){
            int indice = (int)itIndices.next();
            respuestitas.add(this.respuestas.get(indice).getDescripcion());
        }
        return respuestitas;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public String obtenerRespuestaCorrecta(List<Respuesta> respuestas) {
        String respuestaCorrecta = "";
        for(Respuesta r : respuestas) {
            if(r.isIsCorrecta()){
                respuestaCorrecta = r.getDescripcion();
                break;
            }
        }
        
        return respuestaCorrecta;
    }
    
   
}
