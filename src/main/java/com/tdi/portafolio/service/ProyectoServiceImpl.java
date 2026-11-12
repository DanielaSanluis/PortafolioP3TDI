package com.tdi.portafolio.service;

import com.tdi.portafolio.model.Proyecto;
import com.tdi.portafolio.repository.ProyectoRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class ProyectoServiceImpl implements ProyectoService {

    private final ProyectoRepository repository;

    public ProyectoServiceImpl(ProyectoRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Proyecto> listarTodos() {
        return repository.findAll();
    }

    @Override
    public Proyecto obtenerPorId(int id) {
        return repository.findById(id);
    }

    @Override
    public void guardar(Proyecto proyecto) {
        repository.save(proyecto);
    }

    @Override
    public void actualizar(Proyecto proyecto) {
        repository.update(proyecto);
    }

    @Override
    public void eliminar(int id) {
        repository.deleteById(id);
    }
}