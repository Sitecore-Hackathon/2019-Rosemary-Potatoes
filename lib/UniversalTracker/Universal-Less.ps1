<#
.SYNOPSIS
    SITECORE HACKATHON 2019

    UNIVERSAL-LESS

    Establish an automated, configurable process for installing 
    Universal Tracker v2.1  within an onPrem Sitecore install

.DESCRIPTION



.NOTES


.AUTHORS
    ~~ TEAM ROSEMARY POTATOES ~~

#>

$debug = $false;

function Show-Dialog {
    <# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Universal-Less
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$formUniversalLess               = New-Object system.Windows.Forms.Form
$formUniversalLess.ClientSize    = '448,563'
$formUniversalLess.text          = "Universal-Less"
$formUniversalLess.TopMost       = $false

$lblSqlName                      = New-Object system.Windows.Forms.Label
$lblSqlName.text                 = "SQL Server Name"
$lblSqlName.AutoSize             = $true
$lblSqlName.width                = 25
$lblSqlName.height               = 10
$lblSqlName.location             = New-Object System.Drawing.Point(9,12)
$lblSqlName.Font                 = 'Microsoft Sans Serif,10'

$txtSqlServerName                = New-Object system.Windows.Forms.TextBox
$txtSqlServerName.text           = ".\SQL2016"
$txtSqlServerName.multiline      = $false
$txtSqlServerName.width          = 410
$txtSqlServerName.height         = 20
$txtSqlServerName.location       = New-Object System.Drawing.Point(9,34)
$txtSqlServerName.Font           = 'Microsoft Sans Serif,10'

$txtSqlUser                      = New-Object system.Windows.Forms.TextBox
$txtSqlUser.text                 = "sa"
$txtSqlUser.multiline            = $false
$txtSqlUser.width                = 410
$txtSqlUser.height               = 20
$txtSqlUser.location             = New-Object System.Drawing.Point(9,87)
$txtSqlUser.Font                 = 'Microsoft Sans Serif,10'

$lblSqlUserName                  = New-Object system.Windows.Forms.Label
$lblSqlUserName.text             = "SQL User"
$lblSqlUserName.AutoSize         = $true
$lblSqlUserName.width            = 25
$lblSqlUserName.height           = 10
$lblSqlUserName.location         = New-Object System.Drawing.Point(9,65)
$lblSqlUserName.Font             = 'Microsoft Sans Serif,10'

$txtSqlPassword                  = New-Object system.Windows.Forms.TextBox
$txtSqlPassword.multiline        = $false
$txtSqlPassword.width            = 410
$txtSqlPassword.height           = 20
$txtSqlPassword.location         = New-Object System.Drawing.Point(9,148)
$txtSqlPassword.Font             = 'Microsoft Sans Serif,10'

$lblSqlPassword                  = New-Object system.Windows.Forms.Label
$lblSqlPassword.text             = "SQL Password"
$lblSqlPassword.AutoSize         = $true
$lblSqlPassword.width            = 25
$lblSqlPassword.height           = 10
$lblSqlPassword.location         = New-Object System.Drawing.Point(9,126)
$lblSqlPassword.Font             = 'Microsoft Sans Serif,10'

$txtDbName                       = New-Object system.Windows.Forms.TextBox
$txtDbName.text                  = "_Tracking"
$txtDbName.multiline             = $false
$txtDbName.width                 = 410
$txtDbName.height                = 20
$txtDbName.location              = New-Object System.Drawing.Point(9,211)
$txtDbName.Font                  = 'Microsoft Sans Serif,10'

$lblUnDbName                     = New-Object system.Windows.Forms.Label
$lblUnDbName.text                = "Universal Tracker Database Name"
$lblUnDbName.AutoSize            = $true
$lblUnDbName.width               = 25
$lblUnDbName.height              = 10
$lblUnDbName.location            = New-Object System.Drawing.Point(9,189)
$lblUnDbName.Font                = 'Microsoft Sans Serif,10'

$txtXconnectInstanceName         = New-Object system.Windows.Forms.TextBox
$txtXconnectInstanceName.text    = "sitecore91.xconnect"
$txtXconnectInstanceName.multiline  = $false
$txtXconnectInstanceName.width   = 410
$txtXconnectInstanceName.height  = 20
$txtXconnectInstanceName.location  = New-Object System.Drawing.Point(9,280)
$txtXconnectInstanceName.Font    = 'Microsoft Sans Serif,10'

$lblxConnectInstanceName         = New-Object system.Windows.Forms.Label
$lblxConnectInstanceName.text    = "xConnect Instance Name"
$lblxConnectInstanceName.AutoSize  = $true
$lblxConnectInstanceName.width   = 25
$lblxConnectInstanceName.height  = 10
$lblxConnectInstanceName.location  = New-Object System.Drawing.Point(9,258)
$lblxConnectInstanceName.Font    = 'Microsoft Sans Serif,10'

$txtLicenseFolderPath            = New-Object system.Windows.Forms.TextBox
$txtLicenseFolderPath.multiline  = $false
$txtLicenseFolderPath.width      = 370
$txtLicenseFolderPath.height     = 20
$txtLicenseFolderPath.location   = New-Object System.Drawing.Point(9,396)
$txtLicenseFolderPath.Font       = 'Microsoft Sans Serif,10'

$lblLicenseFilePath              = New-Object system.Windows.Forms.Label
$lblLicenseFilePath.text         = "License File Path"
$lblLicenseFilePath.AutoSize     = $true
$lblLicenseFilePath.width        = 25
$lblLicenseFilePath.height       = 10
$lblLicenseFilePath.location     = New-Object System.Drawing.Point(9,374)
$lblLicenseFilePath.Font         = 'Microsoft Sans Serif,10'

$lblRootWebsitePath              = New-Object system.Windows.Forms.Label
$lblRootWebsitePath.text         = "Root Websites Path "
$lblRootWebsitePath.AutoSize     = $true
$lblRootWebsitePath.width        = 25
$lblRootWebsitePath.height       = 10
$lblRootWebsitePath.location     = New-Object System.Drawing.Point(9,435)
$lblRootWebsitePath.Font         = 'Microsoft Sans Serif,10'

$txtSiteFolderPath               = New-Object system.Windows.Forms.TextBox
$txtSiteFolderPath.multiline     = $false
$txtSiteFolderPath.text          = "C:\inetpub\wwwroot"
$txtSiteFolderPath.width         = 369
$txtSiteFolderPath.height        = 20
$txtSiteFolderPath.location      = New-Object System.Drawing.Point(8,457)
$txtSiteFolderPath.Font          = 'Microsoft Sans Serif,10'

$txtPrefix                       = New-Object system.Windows.Forms.TextBox
$txtPrefix.multiline             = $false
$txtPrefix.width                 = 410
$txtPrefix.height                = 20
$txtPrefix.location              = New-Object System.Drawing.Point(9,337)
$txtPrefix.Font                  = 'Microsoft Sans Serif,10'

$lblPrefix                       = New-Object system.Windows.Forms.Label
$lblPrefix.text                  = "Prefix"
$lblPrefix.AutoSize              = $true
$lblPrefix.width                 = 25
$lblPrefix.height                = 10
$lblPrefix.location              = New-Object System.Drawing.Point(9,315)
$lblPrefix.Font                  = 'Microsoft Sans Serif,10'

$btnLicenseBrowse                = New-Object system.Windows.Forms.Button
$btnLicenseBrowse.text           = "..."
$btnLicenseBrowse.width          = 43
$btnLicenseBrowse.height         = 30
$btnLicenseBrowse.location       = New-Object System.Drawing.Point(388,390)
$btnLicenseBrowse.Font           = 'Microsoft Sans Serif,10'

$btnSitePathBrowse               = New-Object system.Windows.Forms.Button
$btnSitePathBrowse.text          = "..."
$btnSitePathBrowse.width         = 43
$btnSitePathBrowse.height        = 30
$btnSitePathBrowse.location      = New-Object System.Drawing.Point(388,449)
$btnSitePathBrowse.Font          = 'Microsoft Sans Serif,10'

$btnInstall                      = New-Object system.Windows.Forms.Button
$btnInstall.text                 = "Install Universal Tracker"
$btnInstall.width                = 173
$btnInstall.height               = 30
$btnInstall.location             = New-Object System.Drawing.Point(258,514)
$btnInstall.Font                 = 'Microsoft Sans Serif,10'

$formUniversalLess.controls.AddRange(@($lblSqlName,$txtSqlServerName,$txtSqlUser,$lblSqlUserName,$txtSqlPassword,$lblSqlPassword,$txtDbName,$lblUnDbName,$txtXconnectInstanceName,$lblxConnectInstanceName,$txtLicenseFolderPath,$lblLicenseFilePath,$lblRootWebsitePath,$txtSiteFolderPath,$txtPrefix,$lblPrefix,$btnLicenseBrowse,$btnSitePathBrowse,$btnInstall))

    $btnCheck.Add_Click( { 
            # TODO: Check if SQL data in form is valid.
            # $isValidSqlConnection = Test-SqlConnection -ServerName $txtSqlServerName.text -UserName $txtSqlUser.text -Password $txtSqlPassword.text
            # if($isValidSqlConnection){
            #     Write-Host "SQL Connection is Valid!" -ForegroundColor Green
            #     $btnInstall.Enabled = $true
            # }
        })

    $btnLicenseBrowse.Add_Click( { 
            $selectedLicenseFolder = Get-Folder
            $txtLicenseFolderPath.Text = $selectedLicenseFolder
        })

    $btnSitePathBrowse.Add_Click( { 
            $selectedBrowserFolder = Get-Folder
            $txtSiteFolderPath.Text = $selectedBrowserFolder
        })
        
    $btnInstall.Add_Click( { 

            # Close the dialog
            $formUniversalLess.Close();

            Install-UniversalTracker -SqlServerName $txtSqlServerName.Text `
                -SqlServerUser $txtSqlUser.Text `
                -SqlServerPassword $txtSqlPassword.Text `
                -SqlDbName $txtDbName.Text `
                -LicensePath $txtLicenseFolderPath.Text `
                -RootSitePath $txtSiteFolderPath.Text `
                -RepoPath $PSScriptRoot `
                -Prefix $txtPrefix.text
        })

    
    [void] $formUniversalLess.ShowDialog() 
}

function Install-UniversalTracker {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$SqlServerName,

        [Parameter(Mandatory = $true)]
        [string]$SqlServerUser,

        [Parameter(Mandatory = $true)]
        [string]$SqlServerPassword,

        [Parameter(Mandatory = $true)]
        [string]$SqlDbName,

        [Parameter(Mandatory = $true)]
        [string]$LicensePath,

        [Parameter(Mandatory = $true)]
        [string]$RootSitePath,

        [Parameter(Mandatory = $true)]
        [string]$RepoPath,

        [Parameter(Mandatory = $true)]
        [string]$Prefix
        
    )

    # Unzip files from download
    UnzipUniveralTrackerFiles -RepoPath $RepoPath
          
    Write-Host "Installing Universal Tracker..." -ForegroundColor Green
    # Install Universal Tracker
    Install-UniversalTrackerDb -SqlServerName $SqlServerName `
        -SqlServerUser $SqlServerUser `
        -SqlServerPassword $SqlServerPassword `
        -SqlDbName $SqlDbName `
        -RepoPath $RepoPath 

    $dbConnectionString = "user id=$($SqlServerUser);password=$($SqlServerPassword);data source=$($SqlServerName);database=$($SqlDbName);ConnectRetryCount=5;ConnectRetryInterval=10;Connection Timeout=50;"

    Write-Host "Installing Collection Service..." -ForegroundColor Green
    # Install Collection Service
    $collectionWdp = "$RepoPath\Sitecore.Tracking.Collection.Service.1.0.0-r00045.wdp.zip"
    $collectionDeploy = "$RepoPath\Sitecore.Tracking.Collection.Service.1.0.0-r00045.deploy\OnPremDeploymentInfrastructure" 
    
    $AppName = "$Prefix.tracking.collection.service"
    Install-Service -DeployScriptPath $collectionDeploy `
        -WdpPackagePath $collectionWdp `
        -DatabaseConnectionString $dbConnectionString `
        -LicenseXmlPath $LicensePath `
        -SiteFolderPath "$RootSitePath" `
        -Prefix $Prefix `
        -AppName $AppName `
        -LogName "log_collection"

    Write-Host "Installing Processing Service..." -ForegroundColor Green
    # Install Processing Service
    $processingWdp = "$RepoPath\Sitecore.Tracking.Processing.Service.1.0.0-r00070.wdp.zip"
    $processingDeploy = "$RepoPath\Sitecore.Tracking.Processing.Service.1.0.0-r00070.deploy\OnPremDeploymentInfrastructure" 
    
    $AppName = "$Prefix.tracking.processing.service"
    Install-Service -DeployScriptPath $processingDeploy `
        -WdpPackagePath $processingWdp `
        -DatabaseConnectionString $dbConnectionString `
        -LicenseXmlPath $LicensePath `
        -SiteFolderPath "$RootSitePath" `
        -Prefix $Prefix `
        -AppName $AppName `
        -LogName "log_processing"
}

function Get-Folder($directory) {
    [System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"

    if ($foldername.ShowDialog() -eq "OK") {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

function Unzip {
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

function Invoke-Command {
    param ( [string]$program = $(throw "Please specify a program" ),
        [string]$argumentString = "",
        [switch]$waitForExit )

    $psi = new-object "Diagnostics.ProcessStartInfo"
    $psi.FileName = $program 
    $psi.Arguments = $argumentString
    $proc = [Diagnostics.Process]::Start($psi)
    if ( $waitForExit ) {
        $proc.WaitForExit();
    }
}

function UnzipUniveralTrackerFiles {
    [CmdletBinding()]
    param(

        [Parameter(Mandatory = $true)]
        [string]$RepoPath
    )

    Write-Host "Extracting files..." -ForegroundColor Green
    $pathRoot = $RepoPath

    # Extract 'Sitecore Universal Tracker 1.0.0.zip'
    Unzip "$pathRoot\Sitecore Universal Tracker 1.0.0.zip" "$pathRoot\" 

    # Extract 'Sitecore.Tracking.Sql.Service.1.0.0-r00056.deploy.zip' and 'Sitecore.Tracking.Sql.Service.1.0.0-r00056.dacpac.zip'
    Unzip "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.deploy.zip" "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.deploy" 
    Unzip "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.dacpac.zip" "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.dacpac" 

    Unzip "$pathRoot\Sitecore.Tracking.Collection.Service.1.0.0-r00045.deploy.zip" "$pathRoot\Sitecore.Tracking.Collection.Service.1.0.0-r00045.deploy" 
    Unzip "$pathRoot\Sitecore.Tracking.Processing.Service.1.0.0-r00070.deploy.zip" "$pathRoot\Sitecore.Tracking.Processing.Service.1.0.0-r00070.deploy" 
    
    Write-Host "Extraction complete!" -ForegroundColor Green
}

# ABANDONED 
function Test-SqlConnection {
    param(
        [Parameter(Mandatory)]
        [string]$ServerName,
 
        [Parameter(Mandatory)]
        [string]$UserName,

        [Parameter(Mandatory)]
        [string]$Password
    )

    $ErrorActionPreference = 'Stop'

    try {
        $connectionString = 'Data Source={0}User ID={2};Password={3}' -f $ServerName,$UserName,$Password
        $sqlConnection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString
        $sqlConnection.Open()
        ## This will run if the Open() method does not throw an exception
        $true
    } catch {
        $false
    } finally {
        ## Close the connection when we're done
        $sqlConnection.Close()
    }
}

function Install-UniversalTrackerDb {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$SqlServerName,

        [Parameter(Mandatory = $true)]
        [string]$SqlServerUser,

        [Parameter(Mandatory = $true)]
        [string]$SqlServerPassword,

        [Parameter(Mandatory = $true)]
        [string]$SqlDbName,

        [Parameter(Mandatory = $true)]
        [string]$RepoPath
        
    )

    # Run onPremDeployfor
    $sqlDeployPath = "$RepoPath\Sitecore.Tracking.Sql.1.0.0-r00056.deploy\OnPremDeploymentInfrastructure\onPremDeploy.ps1"
    $sqlDeployArgumentList = @()
    $sqlDeployArgumentList += ("-sourceDacFile", "$RepoPath\Sitecore.Tracking.Sql.1.0.0-r00056.dacpac\Sitecore.Tracking.dacpac")
    $sqlDeployArgumentList += ("-serverName", "$SqlServerName")
    $sqlDeployArgumentList += ("-dbName", "$SqlDbName")
    $sqlDeployArgumentList += ("-dbUser", "$SqlServerUser")
    $sqlDeployArgumentList += ("-dbPassword", "$SqlServerPassword")
    

    $psCmd = "Set-ExecutionPolicy RemoteSigned; & `"$sqlDeployPath`" $sqlDeployArgumentList ; sleep 3"
    $expression = "cmd /c start powershell -Command { $psCmd } "
    $utInstallResult = Invoke-Expression $expression
    $utInstallResult | Out-File "$PSScriptRoot\log_utinstall.txt"

    # In IIS, navigate to the website you specified in instanceName. 
    # Navigate to Bindings. Double-click on the port 443 binding and select the SSL certificate.
}

function Install-Service {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$DeployScriptPath,

        [Parameter(Mandatory = $true)]
        [string]$WdpPackagePath,

        [Parameter(Mandatory = $true)]
        [string]$DatabaseConnectionString,

        [Parameter(Mandatory = $true)]
        [string]$LicenseXmlPath,

        [Parameter(Mandatory = $true)]
        [string]$SiteFolderPath,

        [Parameter(Mandatory = $true)]
        [string]$Prefix,

        [Parameter(Mandatory = $true)]
        [string]$AppName,

        [Parameter(Mandatory = $true)]
        [string]$LogName
    )

    # Run onPremDeploy
    $installArgs = @()
    $installArgs += ("-wdpPackagePath", "`"$WdpPackagePath`"")
    $installArgs += ("-databaseConnectionString", "`"$DatabaseConnectionString`"")      
    $installArgs += ("-licenseXmlPath", "`"$LicenseXmlPath\license.xml`"")
    $installArgs += ("-siteFolderPath", "`"$SiteFolderPath`"")
    $installArgs += ("-siteHttpPort", "`"80`"")
    $installArgs += ("-instanceName", "`"$AppName`"")
    $installArgs += ("-iisAppPollName", "`"$AppName`"")

    $psCmd = "cd $DeployScriptPath; & .\onPremDeploy.ps1 $installArgs ; sleep 3"
    $expression = "cmd /c start powershell -Command { $psCmd } " 

    #Write-Host $psCmd
    $serviceInstallResult = Invoke-Expression $expression 
    $serviceInstallResult | Out-File "$PSScriptRoot\$LogName.txt"

    #Add the binding for your service in the %windir%\System32\drivers\etc\hosts file.
    Add-HostEntry $AppName
}

function Add-HostEntry {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$HostName
    )
    
    $HostFile = "$env:windir\System32\drivers\etc\hosts"
 
    # Create a backup copy of the Hosts file
    $dateFormat = (Get-Date).ToString('dd-MM-yyyy hh-mm-ss')
    $FileCopy = $HostFile + '.' + $dateFormat + '.backup'
    Copy-Item $HostFile -Destination $FileCopy
 
    # Get the contents of the Hosts file
    $File = Get-Content $HostFile
 
    # write the Entries to hosts file, if it doesn't exist.
    if ($File -contains "127.0.0.1 `t $HostName") {
        Write-Host "Host File Entry for $HostName is already exists."
        $EntryExists = $true
    }
    #Add Entry to Host File
    if (!$EntryExists) {
        Write-Host "Adding Host File Entry for $HostName"
        Add-Content -path $HostFile -value "`n127.0.0.1 `t $HostName"
    }   
}

function CleanUp {  
    [CmdletBinding()]
    param(

        [Parameter(Mandatory = $true)]
        [string]$RepoPath
        
    )

    Get-ChildItem -Path "$RepoPath\" -File -Recurse |
        Where-Object { $_.Name -ne "Universal-Less.ps1" -and $_.Name -ne "Sitecore Universal Tracker 1.0.0.zip" -and $_.Name -ne "log_utinstall.txt" -and $_.Name -ne "log_collection.txt" -and $_.Name -ne "log_processing.txt"  } |
        Remove-Item

    Get-ChildItem -Path "$RepoPath\" -Directory -Recurse |
        Where-Object { $_.Name -ne "Universal-Less.ps1" -and $_.Name -ne "Sitecore Universal Tracker 1.0.0.zip" } |
        Remove-Item -Recurse
}

# Per instructions
Set-ExecutionPolicy RemoteSigned

# Manual Step?: Download the Sitecore Universal Tracker package --- Unzip the file

# Add WinForm assemblies
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Unzip assembly and method
Add-Type -AssemblyName System.IO.Compression.FileSystem

if ($debug) {
    #Debug Mode
    $Prefix = "rosytaters"
    $SqlServerName = "localhost"
    $SqlDbName = "$($Prefix)_Tracker"
    $SqlUser = "sitecore"
    $SqlPassword = "s1t3c0r3"
    $LicensePath = "C:\"
    $RootSitePath = "C:\inetpub\wwwroot\"

    Install-UniversalTracker -SqlServerName $SqlServerName `
        -SqlDbName $SqlDbName `
        -SqlServerUser $SqlUser `
        -SqlServerPassword $SqlPassword `
        -LicensePath $LicensePath `
        -RootSitePath $RootSitePath `
        -RepoPath $PSScriptRoot `
        -Prefix $Prefix
}
else {
    # Start here by showing the dialog.
    
    Show-Dialog 
}


# Update with xConnect URL in config



# Get and update thumbprint 



# invoke status page for 200



# Post deploy file clean-up
CleanUp -RepoPath $PSScriptRoot
