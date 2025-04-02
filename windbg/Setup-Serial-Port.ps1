# .\Setup-Serial-Port.ps1 -vm_name "win_1cpu" -pipe_name "windbg"

param(
    [string]$vm_name,
    [string]$pipe_name
)

Set-VMFirmware -VMName $vm_name -EnableSecureBoot Off -Verbose

Set-VMComPort -VMName $vm_name 1 \\.\pipe\${pipe_name} -Verbose

# Restart-VM $vm_name -Verbose