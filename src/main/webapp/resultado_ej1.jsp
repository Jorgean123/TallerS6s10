<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="titulo" value="Resultado del promedio" /><c:set var="seccion" value="promedio" />
<%@ include file="WEB-INF/jspf/header.jspf" %>
<div class="page-heading"><span class="eyebrow">EJERCICIO 01 · RESULTADO</span><h1>Tu resultado académico</h1><p class="text-secondary">Desglose de las evaluaciones y sus aportes al promedio.</p></div>
<c:choose><c:when test="${not empty promedio}">
<div class="row g-4"><div class="col-lg-8"><div class="card p-4"><div class="table-responsive"><table class="table align-middle">
    <caption>Pesos de evaluación: 20%, 30% y 50%.</caption><thead><tr><th scope="col">Evaluación</th>
        <th scope="col">Nota</th><th scope="col">Peso</th><th scope="col">Aporte</th></tr></thead><tbody>
<tr><th scope="row">Nota 1</th><td>${nota1}</td><td>20%</td><td>${aporte1}</td></tr>
<tr><th scope="row">Nota 2</th><td>${nota2}</td><td>30%</td><td>${aporte2}</td></tr>
<tr><th scope="row">Nota 3</th><td>${nota3}</td><td>50%</td><td>${aporte3}</td></tr>
</tbody></table></div></div></div><div class="col-lg-4"><section class="result-card"><span class="eyebrow">PROMEDIO FINAL</span>
    <div class="result-number">${promedio}</div><p class="text-secondary">sobre 20 puntos</p>
<c:if test="${aprobado}"><div class="alert alert-success mb-0" role="status"><strong>${estado}</strong><br>Alcanzaste la nota mínima de 12.0.</div></c:if>
<c:if test="${not aprobado}"><div class="alert alert-danger mb-0" role="status"><strong>${estado}</strong><br>Tu promedio es menor a 12.0.</div></c:if>
</section></div></div>
</c:when><c:otherwise><div class="alert alert-info">Primero ingresa tus tres notas para consultar el resultado.</div></c:otherwise></c:choose>
<a class="btn btn-primary mt-4" href="${pageContext.request.contextPath}/SvPromedio">Calcular otro promedio</a>
<%@ include file="WEB-INF/jspf/footer.jspf" %>
