# Laboratorio UTP · Semana 6 / Sesión 10

**Alumno:** Jorge Eduardo Acosta Loyola · U22205593  
**Curso:** Desarrollo Web Integrado (1000005154)  
**Docente:** Mtro. Ing. César A. Cárdenas Latorre · Arequipa

## Ejecutar

Proyecto Maven WAR para Java 11 o superior y Tomcat 10.1. Las APIs Jakarta son compatibles con [Tomcat 10.1](https://tomcat.apache.org/tomcat-10.1-doc/); las vistas usan [Jakarta Tags 3.0](https://jakarta.ee/specifications/tags/3.0/).

En este equipo: **http://localhost:8081/TallerS6s10/**.

Credenciales de demostración: **admin / utp2026**. Son valores fijos pedidos por el laboratorio, no un sistema de cuentas de producción.

### NetBeans

1. Archivo → Abrir proyecto → seleccionar `C:\WebIntegradoUTP\TallerS6s10` (contiene `pom.xml`).
2. Usar un JDK 11 o superior. Las clases se generan para Java 11.
3. Ejecutar **Clean and Build**. También se puede compilar desde PowerShell con `powershell -ExecutionPolicy Bypass -File scripts\compilar.ps1`.
4. El archivo generado es `target\TallerS6s10.war`. Desplegar en `C:\apache-tomcat-10.1.59\webapps`.
5. Si Tomcat está detenido, definir `JAVA_HOME` con el JDK y ejecutar `C:\apache-tomcat-10.1.59\bin\startup.bat`.
6. Abrir la URL indicada. Tomcat usa **8081**, según su configuración existente.

NetBeans 12 puede abrir y compilar el proyecto Maven; su integración antigua de servidores puede no reconocer Tomcat 10.1. En ese caso, compilar en NetBeans y desplegar el WAR manualmente como se indica arriba. El script de compilación utiliza los certificados de Windows para resolver el problema de confianza TLS del JDK local.

## Ejercicios

| Ejercicio | Controlador | Vistas | Comportamiento |
|---|---|---|---|
| Promedio | `SvPromedio.java` | `index_ej1.jsp`, `resultado_ej1.jsp` | Pesos 20%, 30%, 50%; aprobado desde 12.0; validación de 0 a 20 |
| Carrito | `SvCarrito.java` | `carrito.jsp` | Cuatro productos, subtotales y total S/ 4145.80 |
| Acceso | `SvLogin.java`, `SvLogout.java` | `login.jsp`, `panel.jsp` | Validación, sesión, bienvenida y cierre de sesión |

Las notas admiten hasta dos decimales. Se usa `BigDecimal` para no perder precisión y se evalúa el estado sin redondear. El carrito contiene seis unidades en cuatro filas.

## Arquitectura y rúbrica

- `src/main/java/pe/edu/utp/modelo/Producto.java`: modelo con getters para EL y cálculo de subtotal.
- `src/main/java/pe/edu/utp/controlador/`: captura con `getParameter`, cálculos y atributos con `setAttribute`; vistas de resultados mediante `RequestDispatcher.forward`.
- `src/main/java/pe/edu/utp/filtro/AccesoFilter.java`: protege el panel sin sesión y evita almacenar el panel en caché.
- `src/main/webapp/`: vistas sin código Java; `c:if` en alertas, `c:choose` en resultados, `c:forEach` en carrito y EL para datos.
- `WEB-INF/web.xml`: prohíbe scriptlets con `scripting-invalid` y configura sesiones.
- `assets/`: Bootstrap 5.3.3 (licencia MIT incluida en el archivo) y estilos propios. No requiere Internet al navegar.

## Verificación

Con Tomcat iniciado:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\verificar.ps1
```

Comprueba las rutas, los límites de notas, entradas inválidas, el total del carrito, login fallido y correcto, persistencia y cierre de sesión y protección del panel.

## Guía para tus capturas

1. Proyecto en NetBeans con paquetes y JSP; salida **BUILD SUCCESS**.
2. Portada del laboratorio.
3. Notas **15, 16, 18** → promedio **16.8**, aprobado.
4. Notas **8, 10, 11** → promedio **10.1**, desaprobado.
5. Carrito con cuatro filas y total **S/ 4,145.80**.
6. Login con contraseña incorrecta y alerta roja.
7. Login con **admin / utp2026** y panel de bienvenida.
8. Cerrar sesión y mensaje de confirmación.

El repositorio incluye el código fuente y los scripts para generar el WAR localmente. Las capturas se agregan por separado; `target/` y los registros de ejecución se excluyen del control de versiones.
