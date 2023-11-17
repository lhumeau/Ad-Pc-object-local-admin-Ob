# Ad-Pc-object-local-admin-Ob
# Script de Análisis de Usuarios Administradores en Máquinas de Dominio

Este repositorio contiene un script de PowerShell diseñado para identificar usuarios locales que tienen privilegios de administrador en máquinas dentro de un dominio específico de Windows Active Directory.

## Descripción

El script realiza las siguientes tareas:
- Se conecta a cada máquina en un dominio de Active Directory especificado.
- Obtiene una lista de todos los usuarios locales en cada máquina.
- Verifica si cada usuario local es miembro del grupo de administradores de la máquina.
- Genera un informe con los resultados.

## Requisitos

- Windows PowerShell 5.1 o superior.
- Acceso a un dominio de Active Directory.
- Credenciales con permisos para leer información de Active Directory y de las máquinas del dominio.

## Uso

1. Abra PowerShell con permisos de administrador.
2. Ejecute el script: `.\NombreDelScript.ps1`
3. Cuando se le solicite, ingrese las credenciales con permisos adecuados.
4. Asegurate que los equipos tenga el puerto RPC habilitado.

## Notas de Seguridad

- Asegúrese de que las credenciales utilizadas para ejecutar el script tengan los permisos necesarios y sigan las políticas de seguridad de su organización.
- Se recomienda realizar pruebas en un entorno controlado antes de ejecutar el script en un entorno de producción.
- Este script puede requerir ajustes dependiendo de la configuración específica de su red y políticas de seguridad.

## Contribuciones

Las contribuciones a este script son bienvenidas. Por favor, envíe Pull Requests o cree Issues para sugerencias o mejoras.

## Licencia

MIT

## Contacto
X || Twitter:
https://twitter.com/humeau_luis




---

