<#
.SYNOPSIS
    SITECORE HACKATHON 2019

    UNIVERSAL-LESS-UNINSTALL

    Establish a scripted approach to uninstall an existing Universal Tracker installation

.DESCRIPTION


.NOTES


.AUTHORS
    ~~ TEAM ROSEMARY POTATOES ~~

.PARAMETER dbName
   IIS website binding for https port

.PARAMETER dbUser
   IIS website binding for https port

.PARAMETER dbPassword
   IIS website binding for https port

.PARAMETER collectionServiceSiteName
   IIS website binding for https port

.PARAMETER collectionServiceAppPoolName
   IIS website binding for https port
   
.PARAMETER collectionServicesiteFolderPath
   IIS website binding for https port

.PARAMETER processingServiceSiteName
   IIS website binding for https port

.PARAMETER processingServiceAppPoolName
   IIS website binding for https port

.PARAMETER processingServicesiteFolderPath
   IIS website binding for https port

.PARAMETER processingServiceName
   IIS website binding for https port

.PARAMETER collectionServiceCertificateSubjectName
   IIS website binding for https port   
#>
param (
    [Parameter(Mandatory = $True)]
    [string]
    $SqlServer,

    [Parameter(Mandatory = $True)]
    [string]
    $dbName,

    [Parameter(Mandatory = $True)]
    [string]
    $dbUser,

    [Parameter(Mandatory = $True)]
    [string]
    $dbPassword,

    [string]
    $collectionServiceSiteName = "Sitecore.Tracking.Collection.Service",

    [string]
    $collectionServiceAppPoolName = "Sitecore.Tracking.Collection.Service",

    [string]
    $collectionServicesiteFolderPath = "C:\inetpub\wwwroot",

    [string]
    $processingServiceSiteName = "Sitecore.Tracking.Processing.Service",

    [string]
    $processingServiceAppPoolName = "Sitecore.Tracking.Processing.Service",

    [string]
    $processingServicesiteFolderPath = "C:\inetpub\wwwroot",

    [string]
    $processingServiceName = "Sitecore Universal Tracker Processing Service",

    [string]
    $collectionServiceCertificateSubjectName
)

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
        [string]$SqlServer,

        [Parameter(Mandatory = $true)]
        [string]$dbName,

        [Parameter(Mandatory = $true)]
        [string]$SqlAdminUser,

        [Parameter(Mandatory = $true)]
        [string]$SqlAdminPassword
    )

    Write-Host "Removing Database '$dbName'"
    Invoke-SQLCmd -ServerInstance $SqlServer -U $SqlAdminUser -P $SqlAdminPassword -Query "IF EXISTS(SELECT * FROM sys.databases WHERe NAME = '$dbName') BEGIN ALTER DATABASE [$dbName] SET SINGLE_USER WITH ROllBACK IMMEDIATE; DROP DATABASE [$dbName];END"
}

<#
.SYNOPSIS
    Remove a website by name

.PARAMETER site
    Name of the site to remove.

.PARAMETER appPool
    Name of the site's app pool.
#>
function Delete-Website{
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

.PARAMETER subjectName
    Subject name of the certificate to remove.
#>
function Remove-CertificateBySubjectName(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$subjectName
    )
    Get-ChildItem Cert:\LocalMachine\My |
        Where-Object { $_.Subject -match $subjectName } |
        Remove-Item
}

<#
.SYNOPSIS
    Remove a certificate from the local machine store

.PARAMETER thumbprint
    Thumbprint of the certificate to remove.
#>
function Remove-CertificateByThumbprint(){
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$thumbprint
    )
    Get-ChildItem Cert:\LocalMachine\My\$thumbprint | Remove-Item
}

# Remove items in reverse order of their being added:
# - Processing Service
#   - website and app pool
#   - windows service
#   - hosts file entry
# - Collection Service
#   - website and app pool
#   - windows service
# - SQL Database
try 
{
    Write-Host "Removing the Processing Service..."

    Write-Host "Removing the website..."
    Delete-Website -site $processingServiceSiteName -appPool $processingServiceAppPoolName

    Write-Host "Removing the windows service..."
    Remove-Service($processingServiceName)

    Write-Host "Removing the hosts file entry..."
    Remove-HostsFileEntry($processingServiceSiteName)

    Write-Host "Processing Service removed!"
}
catch {
    Write-Error "Error removing Processing Service:" + $_.Exception.Message
    Break
}

try {
    Write-Host "Removing the Collection Service..."

    Write-Host "Removing the website..."
    Delete-Website -site $collectionServiceSiteName -appPool $collectionServiceAppPoolName

    Write-Host "Removing the hosts file entry..."
    Remove-HostsFileEntry($collectionServiceSiteName)

    if (-not ([string]::IsNullOrEmpty($collectionServiceCertificateSubjectName)))
    {
        Write-Host "Removing the certificate..."
        Remove-CertificateBySubjectName($collectionServiceCertificateSubjectName)
    }
    else {
        Write-Host "No certificate subject specified, not attempting to remove certificate."
    }

    Write-Host "Collection Service removed!"
}
catch {
    Write-Error "Error removing Collection Service:" + $_.Exception.Message
    Break
}

try {
    Write-Host "Removing the Universal Tracker Database..."
    Remove-Database -SqlServer $SqlServer -dbName $dbName -SqlAdminUser $dbUser -SqlAdminPassword $dbPassword

    Write-Host "Universal Tracker Database removed!"
}
catch {
    Write-Error "Error removing Database:" + $_.Exception.Message
    Break
}