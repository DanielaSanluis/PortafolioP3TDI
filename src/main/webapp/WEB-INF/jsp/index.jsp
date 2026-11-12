<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="nav.titulo"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/estilos.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/proyectos">
            <spring:message code="nav.titulo"/>
        </a>
        <div class="d-flex align-items-center gap-2">
            <button type="button" class="btn btn-outline-info btn-sm" data-bs-toggle="modal" data-bs-target="#modalCV">
                <spring:message code="nav.cv"/>
            </button>
            <a href="${pageContext.request.contextPath}/proyectos/nuevo" class="btn btn-primary btn-sm">
                + <spring:message code="nav.nuevo"/>
            </a>
            <div class="btn-group btn-group-sm ms-2" role="group">
                <a href="?lang=es" class="btn btn-outline-light">ES</a>
                <a href="?lang=en" class="btn btn-outline-light">EN</a>
            </div>
        </div>
    </div>
</nav>

<div class="container my-5">

    <c:if test="${not empty mensajeExito}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <spring:message code="${mensajeExito}"/>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Tarjeta de Perfil Personalizado -->
    <div class="card border-0 shadow-sm mb-5 bg-white">
        <div class="card-body p-4 p-md-5">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <span class="badge bg-primary mb-2">UNAM • Facultad de Ciencias</span>
                    <h1 class="fw-bold mb-1"><spring:message code="hero.nombre"/></h1>
                    <h5 class="text-primary fw-semibold mb-3"><spring:message code="hero.carrera"/></h5>
                    <p class="text-secondary mb-4"><spring:message code="hero.bio"/></p>
                    <div class="d-flex flex-wrap gap-2">
                        <button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#modalCV">
                            <spring:message code="hero.btn.perfil"/>
                        </button>
                        <a href="${pageContext.request.contextPath}/docs/CV_Daniela_Sanluis.pdf" target="_blank" class="btn btn-outline-primary btn-sm">
                            <spring:message code="hero.btn.cv"/>
                        </a>
                        <a href="https://github.com/DanielaSanluis" target="_blank" class="btn btn-outline-secondary btn-sm">
                            GitHub
                        </a>
                        <a href="https://www.linkedin.com/in/daniela-alejandra-sanluis-castillo-b285aa429/" target="_blank" class="btn btn-outline-secondary btn-sm">
                            LinkedIn
                        </a>
                       <a href="mailto:danielasanluisc@ciencias.unam.mx" id="btnCopiarCorreo"
						   data-correo="danielasanluisc@ciencias.unam.mx"
						   class="btn btn-outline-secondary btn-sm">
						    danielasanluisc@ciencias.unam.mx
						</a>
                    </div>
                </div>
                <div class="col-lg-4 mt-4 mt-lg-0">
                    <label for="buscadorProyectos" class="form-label fw-semibold text-muted small">
                        <spring:message code="buscador.placeholder"/>
                    </label>
                    <input type="text" id="buscadorProyectos" class="form-control form-control-lg shadow-sm"
                           placeholder="<spring:message code='buscador.placeholder'/>">
                </div>
            </div>
        </div>
    </div>

    <!-- Galería de Proyectos -->
    <div class="row g-4 mb-5" id="galeriaProyectos">
        <c:forEach var="p" items="${proyectos}">
            <div class="col-md-6 col-lg-4 item-proyecto">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold text-primary">${p.titulo}</h5>
                        <p class="card-text text-secondary flex-grow-1">${p.descripcion}</p>
                        <div class="mb-3">
                            <span class="badge bg-info text-dark">${p.tecnologias}</span>
                        </div>
                        <div class="mt-auto">
                            <a href="${p.urlGithub}" target="_blank" class="btn btn-dark btn-sm w-100">
                                <spring:message code="btn.github"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Tabla Administrativa -->
    <h3 class="mb-3 fw-bold"><spring:message code="tabla.titulo"/></h3>
    <div class="table-responsive bg-white rounded shadow-sm p-3">
        <table class="table table-striped table-hover align-middle mb-0" id="tablaProyectos">
            <thead class="table-dark">
                <tr>
                    <th><spring:message code="col.id"/></th>
                    <th><spring:message code="col.titulo"/></th>
                    <th><spring:message code="col.tecnologias"/></th>
                    <th class="text-end"><spring:message code="col.acciones"/></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${proyectos}">
                    <tr class="fila-proyecto">
                        <td>${p.id}</td>
                        <td class="fw-semibold">${p.titulo}</td>
                        <td>${p.tecnologias}</td>
                        <td class="text-end">
                            <a href="${pageContext.request.contextPath}/proyectos/editar/${p.id}"
                               class="btn btn-warning btn-sm">
                                <spring:message code="btn.editar"/>
                            </a>
                            <button type="button"
                                    class="btn btn-danger btn-sm btn-abrir-modal-eliminar"
                                    data-id="${p.id}"
                                    data-titulo="${p.titulo}"
                                    data-bs-toggle="modal"
                                    data-bs-target="#modalEliminar">
                                <spring:message code="btn.eliminar"/>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal de Currículum Vitae -->
<div class="modal fade" id="modalCV" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title"><spring:message code="modal.cv.titulo"/></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4">
                <h4 class="fw-bold text-primary mb-1">Daniela Alejandra San Luis Castillo</h4>
                <p class="text-muted mb-3">Software Developer | Lic. en Ciencias de la Computación (Facultad de Ciencias, UNAM)</p>
                <hr>
                <h6 class="fw-bold text-uppercase text-secondary">Educación</h6>
                <p class="mb-3">
                    <strong>Licenciatura en Ciencias de la Computación</strong> — Universidad Nacional Autónoma de México (UNAM, Facultad de Ciencias) | 2022 – Presente (Último semestre)<br>
                    <strong>Bachillerato</strong> — Colegio de Ciencias y Humanidades (CCH Plantel Naucalpan, UNAM) | 2020 – 2023
                </p>
                <h6 class="fw-bold text-uppercase text-secondary">Habilidades Técnicas</h6>
                <ul class="mb-3">
                    <li><strong>Lenguajes:</strong> Python, Java, SQL, JavaScript, C++</li>
                    <li><strong>Frameworks & Libs:</strong> Spring Boot, React, React Native, Expo, Django, Quarto, Bootstrap, jQuery</li>
                    <li><strong>Bases de Datos & Herramientas:</strong> PostgreSQL, MySQL, Docker, Git/GitHub, Jupyter Notebook, LaTeX</li>
                    <li><strong>Sistemas Operativos:</strong> Linux (Fedora), Windows</li>
                </ul>
                <h6 class="fw-bold text-uppercase text-secondary">Proyectos Destacados</h6>
                <ul class="mb-0">
                    <li><strong>ClinicaMente:</strong> App móvil de psicología con React Native, Expo, TypeScript y PostgreSQL.</li>
                    <li><strong>Minería de Datos & Clustering (Salud Pública México):</strong> Análisis estadístico y reportes interactivos con Python, Pandas y Quarto.</li>
                    <li><strong>Plataforma Web (TDI):</strong> Arquitecturas cliente-servidor con Django, Spring Boot, PostgreSQL/MySQL y Docker.</li>
                </ul>
            </div>
            <div class="modal-footer">
                <a href="${pageContext.request.contextPath}/docs/CV_Daniela_Sanluis.pdf" download class="btn btn-primary">
                    <spring:message code="modal.cv.descargar"/>
                </a>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <spring:message code="btn.cancelar"/>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Confirmación de Eliminación -->
<div class="modal fade" id="modalEliminar" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title"><spring:message code="modal.eliminar.titulo"/></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p><spring:message code="modal.eliminar.mensaje"/></p>
                <p class="fw-bold text-danger" id="nombreProyectoEliminar"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <spring:message code="btn.cancelar"/>
                </button>
                <form id="formEliminar" method="post" action="">
                    <input type="hidden" name="_method" value="delete"/>
                    <button type="submit" class="btn btn-danger">
                        <spring:message code="btn.eliminar"/>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const CONTEXT_PATH = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>