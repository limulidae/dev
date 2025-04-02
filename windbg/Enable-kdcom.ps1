param(
    [string]$remote_name
)

# Try to run commands on the remote machine
try {
    # Use Invoke-Command to run commands on the remote machine
    Invoke-Command -ComputerName $remote_name -ScriptBlock {
        hostname
        bcdedit /bootdebug on
        bcdedit /debug on
        bcdedit /dbgsettings serial debugport:1 baudrate:115200

        # Check settings
        bcdedit
        bcdedit /dbgsettings
    } -Credential (Get-Credential) -ErrorAction Stop

    Write-Host "Remote commands executed successfully"
} catch {
    Write-Host "Unable to execute remote commands, error: $_"
}
