param([string]$BaseUrl = 'http://localhost:8081/TallerS6s10')
$ErrorActionPreference = 'Stop'
$script:checks = 0
function Confirmar($condition, [string]$name) {
    if (-not $condition) { throw "FALLO: $name" }
    $script:checks++
    Write-Host "OK: $name"
}
foreach ($ruta in @('/', '/index_ej1.jsp', '/SvPromedio', '/resultado_ej1.jsp', '/SvCarrito', '/carrito.jsp', '/login.jsp', '/SvLogin', '/assets/bootstrap.min.css', '/assets/app.css')) {
    $r = Invoke-WebRequest -UseBasicParsing "$BaseUrl$ruta"
    Confirmar ($r.StatusCode -eq 200) "HTTP 200: $ruta"
}
foreach ($caso in @(
    @{n1='15';n2='16';n3='18';promedio='16.8';estado='Aprobado'},
    @{n1='8';n2='10';n3='11';promedio='10.1';estado='Desaprobado'},
    @{n1='12';n2='12';n3='12';promedio='12';estado='Aprobado'},
    @{n1='0';n2='0';n3='0';promedio='0';estado='Desaprobado'},
    @{n1='20';n2='20';n3='20';promedio='20';estado='Aprobado'},
    @{n1='12';n2='12';n3='11.99';promedio='11.995';estado='Desaprobado'}
)) {
    $r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/SvPromedio" -Method Post -Body @{nota1=$caso.n1;nota2=$caso.n2;nota3=$caso.n3}
    Confirmar ($r.Content.Contains('class="result-number">' + $caso.promedio + '</div>') -and $r.Content.Contains('<strong>' + $caso.estado + '</strong>')) "Promedio $($caso.promedio): $($caso.estado)"
}
foreach ($valor in @('', '-1', '21', 'abc', 'NaN', 'Infinity', '12.345')) {
    $r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/SvPromedio" -Method Post -Body @{nota1=$valor;nota2='12';nota3='12'}
    Confirmar ($r.Content.Contains('Ingresa las tres notas entre 0 y 20')) "Validacion del servidor: '$valor'"
}
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/SvPromedio" -Method Post -Body @{nota1='12';nota2='12'}
Confirmar ($r.Content.Contains('Ingresa las tres notas entre 0 y 20')) 'Rechazo de nota ausente'
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/SvCarrito"
Confirmar ($r.Content -match '4[,.]145[,.]80') 'Total del carrito: S/ 4145.80'
Confirmar (($r.Content -split '<th scope="row">').Count -eq 5) 'Cuatro productos en la tabla'
Confirmar ($r.Content.Contains('6 unidades')) 'Seis unidades en el carrito'
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/panel.jsp" -SessionVariable sesion
Confirmar ($r.BaseResponse.ResponseUri.AbsolutePath.EndsWith('/login.jsp')) 'Panel protegido sin sesion'
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/SvLogin" -Method Post -Body @{txtUsuario='admin';txtPassword='incorrecta'} -WebSession $sesion
Confirmar ($r.Content.Contains('Usuario o contraseña incorrectos')) 'Credenciales incorrectas'
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/SvLogin" -Method Post -Body @{txtUsuario='admin';txtPassword='utp2026'} -WebSession $sesion
Confirmar ($r.Content.Contains('¡Bienvenido, admin!')) 'Ingreso y bienvenida personalizada'
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/panel.jsp" -WebSession $sesion
Confirmar ($r.Content.Contains('¡Bienvenido, admin!') -and $r.Headers['Cache-Control'] -eq 'no-store') 'Persistencia de sesion y panel sin cache'
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/SvLogout" -Method Post -WebSession $sesion
Confirmar ($r.Content.Contains('Sesión cerrada correctamente.')) 'Cierre de sesion'
$r = Invoke-WebRequest -UseBasicParsing "$BaseUrl/panel.jsp" -WebSession $sesion
Confirmar ($r.BaseResponse.ResponseUri.AbsolutePath.EndsWith('/login.jsp')) 'Panel inaccesible despues de salir'
Write-Host "Verificacion terminada: $script:checks comprobaciones correctas."
