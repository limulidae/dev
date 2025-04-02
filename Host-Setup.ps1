Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False -Verbose

Enable-PSRemoting -Force -SkipNetworkProfileCheck -Verbose