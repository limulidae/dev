# .\WinDbg-kdcom.ps1 -vm_hostname win-1cpu -pipe_name windbg

param(
    [string]$vm_hostname,
    [string]$pipe_name
)

# Add the directory to the PATH environment variable
$env:PATH += ";D:\EWDK\ge_release_svc_prod3.26100.3323\Program Files\Windows Kits\10\Debuggers\x64"

# Start windbg with the correct pipe name and settings
windbg -v -k com:pipe,port=\\.\pipe\$pipe_name,resets=0,reconnect
