package com.tdi.portafolio.repository;

import com.tdi.portafolio.model.Proyecto;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProyectoRepository {

    private final JdbcTemplate jdbcTemplate;

    public ProyectoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Proyecto> rowMapper = (rs, rowNum) -> new Proyecto(
        rs.getInt("id"),
        rs.getString("titulo"),
        rs.getString("descripcion"),
        rs.getString("tecnologias"),
        rs.getString("url_github")
    );

    public List<Proyecto> findAll() {
        String sql = "SELECT * FROM proyectos ORDER BY id DESC";
        return jdbcTemplate.query(sql, rowMapper);
    }

    public Proyecto findById(int id) {
        String sql = "SELECT * FROM proyectos WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, rowMapper, id);
    }

    public int save(Proyecto p) {
        String sql = "INSERT INTO proyectos (titulo, descripcion, tecnologias, url_github) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, p.getTitulo(), p.getDescripcion(), p.getTecnologias(), p.getUrlGithub());
    }

    public int update(Proyecto p) {
        String sql = "UPDATE proyectos SET titulo = ?, descripcion = ?, tecnologias = ?, url_github = ? WHERE id = ?";
        return jdbcTemplate.update(sql, p.getTitulo(), p.getDescripcion(), p.getTecnologias(), p.getUrlGithub(), p.getId());
    }

    public int deleteById(int id) {
        String sql = "DELETE FROM proyectos WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}