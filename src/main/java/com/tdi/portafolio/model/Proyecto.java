package com.tdi.portafolio.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class Proyecto {

    private Integer id;

    @NotBlank(message = "El título es obligatorio")
    @Size(max = 100, message = "El título no puede exceder los 100 caracteres")
    private String titulo;

    @NotBlank(message = "La descripción es obligatoria")
    private String descripcion;

    @NotBlank(message = "Debes especificar al menos una tecnología")
    private String tecnologias;

    @NotBlank(message = "El enlace a GitHub es obligatorio")
    private String urlGithub;

    public Proyecto() {}

    public Proyecto(Integer id, String titulo, String descripcion, String tecnologias, String urlGithub) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.tecnologias = tecnologias;
        this.urlGithub = urlGithub;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getTecnologias() { return tecnologias; }
    public void setTecnologias(String tecnologias) { this.tecnologias = tecnologias; }

    public String getUrlGithub() { return urlGithub; }
    public void setUrlGithub(String urlGithub) { this.urlGithub = urlGithub; }
}