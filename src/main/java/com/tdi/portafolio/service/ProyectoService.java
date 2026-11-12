package com.tdi.portafolio.service;

import com.tdi.portafolio.model.Proyecto;
import java.util.List;

public interface ProyectoService {
    List<Proyecto> listarTodos();
    Proyecto obtenerPorId(int id);
    void guardar(Proyecto proyecto);
    void actualizar(Proyecto proyecto);
    void eliminar(int id);
}