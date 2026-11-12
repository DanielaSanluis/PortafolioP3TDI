package com.tdi.portafolio.controller;

import com.tdi.portafolio.model.Proyecto;
import com.tdi.portafolio.service.ProyectoService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProyectoController {

    private final ProyectoService service;

    public ProyectoController(ProyectoService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String inicio() {
        return "redirect:/proyectos";
    }

    @GetMapping("/proyectos")
    public String listarProyectos(Model model) {
        model.addAttribute("proyectos", service.listarTodos());
        return "index";
    }

    @GetMapping("/proyectos/nuevo")
    public String mostrarFormularioNuevo(Model model) {
        model.addAttribute("proyecto", new Proyecto());
        model.addAttribute("esEdicion", false);
        return "formulario";
    }

    @PostMapping("/proyectos/guardar")
    public String guardarProyecto(@Valid @ModelAttribute("proyecto") Proyecto proyecto,
                                  BindingResult result,
                                  Model model,
                                  RedirectAttributes redirectAttrs) {
        if (result.hasErrors()) {
            model.addAttribute("esEdicion", false);
            return "formulario";
        }
        service.guardar(proyecto);
        redirectAttrs.addFlashAttribute("mensajeExito", "msg.exito.guardado");
        return "redirect:/proyectos";
    }

    @GetMapping("/proyectos/editar/{id}")
    public String mostrarFormularioEditar(@PathVariable int id, Model model) {
        Proyecto proyecto = service.obtenerPorId(id);
        model.addAttribute("proyecto", proyecto);
        model.addAttribute("esEdicion", true);
        return "formulario";
    }

    @PutMapping("/proyectos/actualizar/{id}")
    public String actualizarProyecto(@PathVariable int id,
                                     @Valid @ModelAttribute("proyecto") Proyecto proyecto,
                                     BindingResult result,
                                     Model model,
                                     RedirectAttributes redirectAttrs) {
        if (result.hasErrors()) {
            model.addAttribute("esEdicion", true);
            return "formulario";
        }
        proyecto.setId(id);
        service.actualizar(proyecto);
        redirectAttrs.addFlashAttribute("mensajeExito", "msg.exito.actualizado");
        return "redirect:/proyectos";
    }

    @DeleteMapping("/proyectos/eliminar/{id}")
    public String eliminarProyecto(@PathVariable int id, RedirectAttributes redirectAttrs) {
        service.eliminar(id);
        redirectAttrs.addFlashAttribute("mensajeExito", "msg.exito.eliminado");
        return "redirect:/proyectos";
    }
}