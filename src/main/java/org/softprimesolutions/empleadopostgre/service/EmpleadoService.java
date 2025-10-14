package org.softprimesolutions.empleadopostgre.service;

import org.softprimesolutions.empleadopostgre.model.Empleado;
import org.softprimesolutions.empleadopostgre.repository.EmpleadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmpleadoService {

    @Autowired
    private EmpleadoRepository empleadoRepository;

    public List<Empleado> listarTodos() {
        return empleadoRepository.findAll();
    }

    public Empleado guardar(Empleado empleado) {
        return empleadoRepository.save(empleado);
    }

    public Optional<Empleado> obtenerPorId(Long id) {
        return empleadoRepository.findById(id);
    }

    public void eliminar(Long id) {
        empleadoRepository.deleteById(id);
    }
}

