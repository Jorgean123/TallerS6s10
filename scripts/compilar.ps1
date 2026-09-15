param([string]$Maven = 'C:\Program Files\NetBeans-12.0\netbeans\java\maven\bin\mvn.cmd')
$ErrorActionPreference = 'Stop'
$anteriorJava = $env:JAVA_HOME
$anteriorOpts = $env:MAVEN_OPTS
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
    if (Test-Path 'C:\Program Files\Eclipse Adoptium\jdk-25.0.2.10-hotspot') {
        $env:JAVA_HOME = 'C:\Program Files\Eclipse Adoptium\jdk-25.0.2.10-hotspot'
    }
    if (-not (Test-Path $Maven)) { $Maven = (Get-Command mvn.cmd -ErrorAction Stop).Source }
    # Usa certificados de confianza de Windows, sin desactivar la validación TLS.
    $env:MAVEN_OPTS = "$anteriorOpts -Djavax.net.ssl.trustStoreType=Windows-ROOT -Djavax.net.ssl.trustStore=NUL"
    & $Maven -B package
    if ($LASTEXITCODE -ne 0) { throw 'La compilacion Maven fallo.' }
} finally {
    $env:JAVA_HOME = $anteriorJava
    $env:MAVEN_OPTS = $anteriorOpts
    Pop-Location
}
