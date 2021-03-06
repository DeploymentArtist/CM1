Function Add-Prerequisites
{
    Param(
         [Switch]$DotNet,
         $File = "C:\temp\dotNetFx40_Full_x86_x64.exe",
         $Arguments = "/Q /Norestart"
         )
    
    $Roles = @("Web-Server", "Web-Asp-Net", "Web-ASP", "Web-Windows-Auth", "Web-Metabase", "Web-WMI", "BITS", "RDC", "NET-Framework-Core")
 
    Try{
        Write-Host " -  Loading Server Manager PowerShell Module"
        Import-Module servermanager -ErrorAction STOP  
    }
    Catch{
        Write-Host "Failed to load Server Manager PowerShell Module"
    }
    
    Try{
        Write-Host " - Adding Server Roles and Features"
        Add-WindowsFeature $Roles -ErrorAction STOP
    }
    Catch{
        Write-Host "Error: $($_.Exception.Message)"
    }
    
    
    If($DotNet){
        Try{
            Write-Host " - Installing DotNet 4.0 "
            $Install = Start-Process $File -ArgumentList $Arguments -ErrorAction STOP -Wait -PassThru 
            Write-Host " - Installation Return Code:$($Install.ExitCode)"
        }
        Catch{
            Write-Host "Error: $($_.Exception.Message)"
        }
    }
}



