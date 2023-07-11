package com.proyectointegrador.dao;

import java.util.List;

import com.proyectointegrador.entidad.Persona;

public interface  personaDAO {
	
	boolean insert(Persona persona);
	List<Persona> getAllPersonas();
    Persona getPersonaByDni(int dni);
    boolean update(Persona persona);
    boolean delete(int dni);
}
