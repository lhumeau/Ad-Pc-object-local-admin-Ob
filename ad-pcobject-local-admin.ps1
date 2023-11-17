# Pedir credenciales
$credenciales = Get-Credential

# Definir el nombre del dominio
$dominio = "Dominio"

# Obtener las máquinas del dominio
$machines = Get-ADComputer -Filter * -SearchBase "DC=$dominio,DC=local"

# Crear un listado para almacenar la información
$resultados = @()

foreach ($machine in $machines) {
    # Intentar establecer conexión con la máquina
    if (Test-Connection -ComputerName $machine.Name -Count 1 -Quiet) {
        # Obtener los usuarios locales de la máquina
        try {
            $localUsers = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount=True" -ComputerName $machine.Name -Credential $credenciales

            foreach ($user in $localUsers) {
                # Verificar si el usuario es administrador
                try {
                    $adminCheck = Invoke-Command -ComputerName $machine.Name -ScriptBlock {
                        param($userName)
                        net localgroup Administrators | Select-String $userName
                    } -ArgumentList $user.Name -Credential $credenciales

                    if ($adminCheck) {
                        # Agregar al listado
                        $resultados += [PSCustomObject]@{
                            Maquina = $machine.Name
                            Usuario = $user.Name
                            EsAdministrador = $true
                        }
                    }
                } catch {
                    Write-Host "Error al verificar el usuario administrador en la máquina: $($machine.Name)"
                }
            }
        } catch {
            Write-Host "No se pudo obtener usuarios locales de la máquina: $($machine.Name)"
        }
    } else {
        Write-Host "No se pudo conectar a la máquina: $($machine.Name)"
    }
}

# Mostrar los resultados
$resultados | Format-Table -AutoSize
