<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><spring:message code="${esEdicion ? 'form.titulo.editar' : 'form.titulo.nuevo'}"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container my-5" style="max-width: 650px;">
    <div class="card shadow-sm border-0">
        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">
                <spring:message code="${esEdicion ? 'form.titulo.editar' : 'form.titulo.nuevo'}"/>
            </h4>
        </div>
        <div class="card-body p-4">

            <c:set var="accionUrl" value="${esEdicion ? '/proyectos/actualizar/'.concat(proyecto.id) : '/proyectos/guardar'}"/>

            <form:form id="formProyecto" modelAttribute="proyecto" method="post" action="${pageContext.request.contextPath}${accionUrl}">
                <c:if test="${esEdicion}">
                    <input type="hidden" name="_method" value="put"/>
                </c:if>

                <div class="mb-3">
                    <label class="form-label fw-bold"><spring:message code="form.campo.titulo"/></label>
                    <form:input path="titulo" id="titulo" cssClass="form-control"/>
                    <form:errors path="titulo" cssClass="text-danger small"/>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold"><spring:message code="form.campo.descripcion"/></label>
                    <form:textarea path="descripcion" id="descripcion" rows="3" cssClass="form-control"/>
                    <form:errors path="descripcion" cssClass="text-danger small"/>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold"><spring:message code="form.campo.tecnologias"/></label>
                    <form:input path="tecnologias" id="tecnologias" cssClass="form-control" placeholder="Java, Spring Boot, MySQL..."/>
                    <form:errors path="tecnologias" cssClass="text-danger small"/>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold"><spring:message code="form.campo.github"/></label>
                    <form:input path="urlGithub" id="urlGithub" cssClass="form-control" placeholder="https://github.com/DanielaSanluis/..."/>
                    <form:errors path="urlGithub" cssClass="text-danger small"/>
                </div>

                <div id="alertaValidacion" class="alert alert-danger d-none" role="alert">
                    Por favor completa todos los campos obligatorios antes de guardar.
                </div>

                <div class="d-flex justify-content-end gap-2">
                    <a href="${pageContext.request.contextPath}/proyectos" class="btn btn-secondary">
                        <spring:message code="btn.cancelar"/>
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <spring:message code="btn.guardar"/>
                    </button>
                </div>
            </form:form>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>