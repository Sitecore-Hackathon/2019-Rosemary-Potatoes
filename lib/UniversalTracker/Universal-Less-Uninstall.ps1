<#
.SYNOPSIS
    SITECORE HACKATHON 2019

    UNIVERSAL-LESS-UNINSTALL

    Establish a scripted approach to uninstall an existing Universal Tracker installation

.DESCRIPTION


.NOTES


.AUTHORS
    ~~ TEAM ROSEMARY POTATOES ~~
    
#>

<#
.SYNOPSIS
    Remove a Windows service

.PARAMETER serviceName
    Name of the service to remove. Must be the service name, not the display name
#>
function Remove-Service {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$serviceName
    )

    $service = Get-Service $serviceName -ErrorAction SilentlyContinue
        
    if($service){
    Write-Host "Removing Service '$serviceName'"
    if($service.Status -ne "Stopped"){
        Write-Host "Stopping Service '$serviceName'"
        Stop-Service $serviceName
    }

    sc.exe delete $serviceName 
    Write-Host "Removed Service '$serviceName'"
    }
    else {
    Write-Host "Service not found '$serviceName'"
    } 
}

<#
.SYNOPSIS
    Remove a database by name

.PARAMETER serviceName
    Name of the database to remove. Be careful, as this can delete any database the provided user has access to.

.PARAMETER SqlServer
    SQL Server to connect to.

.PARAMETER SqlAdminUser
    SQL user that has access to remove the database in question.

.PARAMETER SqlAdminPassword
    Password for the above SQL user.
#>
function Remove-Database(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$dbName,

        [Parameter(Mandatory = $true)]
        [string]$SqlServer,

        [Parameter(Mandatory = $true)]
        [string]$SqlAdminUser,

        [Parameter(Mandatory = $true)]
        [string]$SqlAdminPassword
    )

    Write-Host "Removing Database '$dbName'"
    Invoke-SQLCmd -ServerInstance $SqlServer -U $SqlAdminUser -P $SqlAdminPassword -Query "IF EXISTS(SELECT * FROM sys.databases WHERe NAME = '${prefix}_$dbName') BEGIN ALTER DATABASE [${prefix}_$dbName] SET SINGLE_USER WITH ROllBACK IMMEDIATE; DROP DATABASE [${prefix}_$dbName];END"
}

<#
.SYNOPSIS
    Remove a website by name

.PARAMETER site
    Name of the site to remove.

.PARAMETER appPool
    Name of the site's app pool.
#>
function Remove-Website(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$site,

        [Parameter(Mandatory = $true)]
        [string]$appPool
    )

    Write-Host "Removing Site '$site'"
    $webSite = Get-Website -Name $site -ErrorAction SilentlyContinue
    $sitePath = $webSite.PhysicalPath
    if($webSite){
      Stop-Website -Name $site
     
      Remove-Website -Name $site

      Write-Host "Removing Application Pool '$appPool'"
      Remove-WebAppPool -Name $appPool 
    }
    else {
      Write-Host "Site not found '$site'"
    }
}

<#
.SYNOPSIS
    Remove a folder by path

.PARAMETER path
    Name of the folder to remove.
#>
function Remove-Folder(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$path
    )
    if(Test-Path -Path $path){
        Write-Host "Removing Folder '$path'"
        &cmd.exe /c rd /s /q $path
    }
    else{
        Write-Host "Folder not found: '$path'"
    }
 
    if(Test-Path -Path $path)      {
        Write-Error "Failed to delete folder '$path'"
    }
}

<#
.SYNOPSIS
    Remove a single host from the hosts file by hostname

.PARAMETER hostname
    Hostname to remove.
#>
function Remove-HostsFileEntry(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$hostsFileEntry
    )
    # TODO
}

<#
.SYNOPSIS
    Remove a certificate from the local machine store

.PARAMETER thumbprint
    Thumbprint of the certificate to remove.
#>
function Remove-Certificate(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$thumbprint
    )
    # TODO
}